#!/usr/bin/env python3
"""
Build pipeline for card graphics (two directions):

  IMPORT (ROM → repo):
    Step 1a: 6bpp → 8bpp  (decode_6bpp_to_8bpp, pure Python)
    Step 1b: 8bpp → PNG   (gbagfx via WSL, using .gbapal)

  BUILD (repo → ROM):
    Step 2a: PNG  → 8bpp  (gbagfx via WSL, using .gbapal)
    Step 2b: 8bpp → 6bpp  (encode_8bpp_to_6bpp, pure Python)

Running this script performs the BUILD direction (PNG → 6bpp).
The IMPORT direction helpers are kept for reference / one-off use.

6bpp ↔ 8bpp encoding:
  Every 3 bytes ↔ four 6-bit pixel indices packed as a 24-bit LE integer.
  4800 bytes (6bpp) ↔ 6400 bytes (8bpp) for an 80×80 image.
"""

import os
import subprocess

SCRIPT_DIR    = os.path.dirname(os.path.abspath(__file__))
DIR_6BPP      = os.path.join(SCRIPT_DIR, 'graphics', '6bpp', 'cards')
DIR_8BPP      = os.path.join(SCRIPT_DIR, 'graphics', '8bpp', 'cards')
DIR_PAL       = os.path.join(SCRIPT_DIR, 'graphics', 'pal', 'cards')
DIR_PNG       = os.path.join(SCRIPT_DIR, 'graphics', 'png', 'cards')
CARD_GFX_SIZE = 4800   # 80×80 @ 6 bpp

for d in (DIR_6BPP, DIR_8BPP, DIR_PNG):
    os.makedirs(d, exist_ok=True)


# ---------------------------------------------------------------------------
# Codec helpers
# ---------------------------------------------------------------------------

def decode_6bpp_to_8bpp(data: bytes) -> bytes:
    """4800-byte 6bpp → 6400-byte 8bpp (each pixel stored as one byte 0-63)."""
    if len(data) != CARD_GFX_SIZE:
        raise ValueError(f'Expected {CARD_GFX_SIZE} bytes, got {len(data)}')
    out = bytearray()
    for i in range(0, len(data), 3):
        v = data[i] | (data[i+1] << 8) | (data[i+2] << 16)
        out.append((v >>  0) & 0x3F)
        out.append((v >>  6) & 0x3F)
        out.append((v >> 12) & 0x3F)
        out.append((v >> 18) & 0x3F)
    return bytes(out)


def encode_8bpp_to_6bpp(data: bytes) -> bytes:
    """6400-byte 8bpp → 4800-byte 6bpp (reverse of decode_6bpp_to_8bpp)."""
    if len(data) != 80 * 80:
        raise ValueError(f'Expected {80*80} bytes, got {len(data)}')
    out = bytearray()
    for i in range(0, len(data), 4):
        p0, p1, p2, p3 = data[i], data[i+1], data[i+2], data[i+3]
        v = (p0 & 0x3F) | ((p1 & 0x3F) << 6) | ((p2 & 0x3F) << 12) | ((p3 & 0x3F) << 18)
        out.append( v        & 0xFF)
        out.append((v >>  8) & 0xFF)
        out.append((v >> 16) & 0xFF)
    return bytes(out)


# ---------------------------------------------------------------------------
# Palette truncation
# ---------------------------------------------------------------------------
PAL_KEEP = 128   # 64 colours × 2 bytes — what the 6bpp format uses

def truncate_palettes():
    """Truncate every .gbapal in DIR_PAL to PAL_KEEP bytes (gbagfx may write 512)."""
    files = [f for f in os.listdir(DIR_PAL) if f.endswith('.gbapal')]
    truncated = 0
    for fname in files:
        path = os.path.join(DIR_PAL, fname)
        size = os.path.getsize(path)
        if size > PAL_KEEP:
            data = open(path, 'rb').read()[:PAL_KEEP]
            open(path, 'wb').write(data)
            truncated += 1
    if truncated:
        print(f'  truncated {truncated} .gbapal files to {PAL_KEEP} bytes.')


# ---------------------------------------------------------------------------
# WSL helper
# ---------------------------------------------------------------------------

def win_to_wsl(path: str) -> str:
    path = path.replace('\\', '/')
    if len(path) >= 2 and path[1] == ':':
        return f'/mnt/{path[0].lower()}{path[2:]}'
    return path


GBAGFX = win_to_wsl(os.path.join(SCRIPT_DIR, 'gbagfx'))


def run_gbagfx(*args):
    return subprocess.run(['wsl', GBAGFX, *args], capture_output=True, text=True)


# ---------------------------------------------------------------------------
# BUILD direction: PNG → 8bpp → 6bpp
# ---------------------------------------------------------------------------

def step_png_to_8bpp():
    """Convert PNGs → .8bpp using .gbapal files.

    Per-file rules:
      - If PNG has not changed (8bpp exists and is as new as the PNG): skip.
      - If PNG is newer than the .gbapal (or .gbapal is missing): regenerate
        the .gbapal from the PNG via gbagfx, then truncate to PAL_KEEP bytes.
      - Then convert PNG → 8bpp using the (possibly refreshed) .gbapal.
    """
    files = sorted(f for f in os.listdir(DIR_PNG) if f.endswith('.png'))
    total = len(files)
    ok = up_to_date = pal_regen = err = 0
    print(f'Step 2a: converting {total} PNGs → .8bpp …')
    for i, fname in enumerate(files, 1):
        stem     = fname[:-4]
        png_path = os.path.join(DIR_PNG,  fname)
        bpp_path = os.path.join(DIR_8BPP, stem + '.8bpp')
        pal_path = os.path.join(DIR_PAL,  stem + '.gbapal')
        png_mtime = os.path.getmtime(png_path)

        # Skip entirely if 8bpp is already up-to-date
        if os.path.exists(bpp_path) and os.path.getmtime(bpp_path) >= png_mtime:
            up_to_date += 1
            continue

        # Regenerate .gbapal if the PNG is newer than it (or it doesn't exist)
        if not os.path.exists(pal_path) or os.path.getmtime(pal_path) < png_mtime:
            r = run_gbagfx(win_to_wsl(png_path), win_to_wsl(pal_path))
            if r.returncode == 0:
                # Truncate freshly-generated palette to PAL_KEEP bytes
                data = open(pal_path, 'rb').read()[:PAL_KEEP]
                open(pal_path, 'wb').write(data)
                pal_regen += 1
            else:
                err += 1
                print(f'  [{i}/{total}] ERROR generating palette: {fname}')
                if r.stderr:
                    print(f'    {r.stderr.strip()}')
                continue

        result = run_gbagfx(
            win_to_wsl(png_path),
            win_to_wsl(bpp_path),
            '-mwidth', '10',
            '-palette', win_to_wsl(pal_path),
        )
        if result.returncode == 0:
            ok += 1
            if i % 200 == 0 or i == total:
                print(f'  [{i}/{total}] {fname}')
        else:
            err += 1
            print(f'  [{i}/{total}] ERROR: {fname}')
            if result.stderr:
                print(f'    {result.stderr.strip()}')
    print(f'  done — {ok} converted, {up_to_date} up-to-date, {pal_regen} palettes refreshed, {err} errors.')


def step_8bpp_to_6bpp():
    """Encode every .8bpp in DIR_8BPP to a .6bpp in DIR_6BPP."""
    files = sorted(f for f in os.listdir(DIR_8BPP) if f.endswith('.8bpp'))
    print(f'Step 2b: encoding {len(files)} .8bpp → .6bpp …')
    for fname in files:
        stem = fname[:-5]
        data = open(os.path.join(DIR_8BPP, fname), 'rb').read()
        open(os.path.join(DIR_6BPP, stem + '.6bpp'), 'wb').write(
            encode_8bpp_to_6bpp(data))
    print(f'  done — {len(files)} files written to {DIR_6BPP}')


# ---------------------------------------------------------------------------
# IMPORT direction: 6bpp → 8bpp → PNG  (kept for reference)
# ---------------------------------------------------------------------------

def step_6bpp_to_8bpp():
    files = sorted(f for f in os.listdir(DIR_6BPP) if f.endswith('.6bpp'))
    print(f'Import step 1a: decoding {len(files)} .6bpp → .8bpp …')
    for fname in files:
        stem = fname[:-5]
        data = open(os.path.join(DIR_6BPP, fname), 'rb').read()
        open(os.path.join(DIR_8BPP, stem + '.8bpp'), 'wb').write(
            decode_6bpp_to_8bpp(data))
    print(f'  done — {len(files)} files written.')


def step_8bpp_to_png():
    files = sorted(f for f in os.listdir(DIR_8BPP) if f.endswith('.8bpp'))
    total = len(files)
    ok = skip = err = 0
    print(f'Import step 1b: converting {total} .8bpp → PNGs …')
    for i, fname in enumerate(files, 1):
        stem     = fname[:-5]
        pal_path = os.path.join(DIR_PAL, stem + '.gbapal')
        if not os.path.exists(pal_path):
            skip += 1
            continue
        result = run_gbagfx(
            win_to_wsl(os.path.join(DIR_8BPP, fname)),
            win_to_wsl(os.path.join(DIR_PNG,  stem + '.png')),
            '-mwidth', '10',
            '-palette', win_to_wsl(pal_path),
        )
        if result.returncode == 0:
            ok += 1
            if i % 200 == 0 or i == total:
                print(f'  [{i}/{total}] {fname}')
        else:
            err += 1
            print(f'  [{i}/{total}] ERROR: {fname}')
            if result.stderr:
                print(f'    {result.stderr.strip()}')
    print(f'  done — {ok} converted, {skip} skipped, {err} errors.')


# ---------------------------------------------------------------------------
# Entry point — BUILD direction
# ---------------------------------------------------------------------------

def main():
    print('=== BUILD: PNG → 8bpp → 6bpp ===')
    step_png_to_8bpp()   # uses committed .gbapal files; skips up-to-date outputs
    step_8bpp_to_6bpp()
    print('\nBuild complete.')


if __name__ == '__main__':
    main()
