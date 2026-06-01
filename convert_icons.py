#!/usr/bin/env python3
"""
1. Convert every .8bpp in graphics/8bpp/cards/icons/ -> .png in graphics/png/cards/icons/
   using gbagfx (WSL):
     large  icons  -mwidth 4  palette icons/icons.gbapal
     small  icons  -mwidth 3  palette icons/icons.gbapal

2. Regenerate src/card_icons.c with INCBIN_U32 entries.
   Variable naming:
     gCardIconLarge<Stem>_<index>
     gCardIconSmallStraight<Stem>_<index>   (straight before side)
     gCardIconSmallSide<Stem>_<index>
"""

import os, re, subprocess

BASE      = os.path.dirname(os.path.abspath(__file__))
BPP8_DIR  = os.path.join(BASE, 'graphics', '8bpp',  'cards', 'icons')
PNG_DIR   = os.path.join(BASE, 'graphics', 'png',   'cards', 'icons')
PAL_PATH  = os.path.join(BASE, 'graphics', 'pal', 'cards', 'icons', 'icons.gbapal')
IDX_FILE  = os.path.join(BASE, 'card_graphics_indexes.txt')
ICONS_C   = os.path.join(BASE, 'src', 'card_icons.c')

os.makedirs(PNG_DIR, exist_ok=True)


def to_native(path: str) -> str:
    """On Windows convert to /mnt/x/... for WSL; on Linux return as-is."""
    if os.name == 'nt':
        path = path.replace('\\', '/')
        if len(path) >= 2 and path[1] == ':':
            return f'/mnt/{path[0].lower()}{path[2:]}'
    return path


if os.name == 'nt':
    _BIN = to_native(os.path.join(BASE, 'tools', 'gbagfx', 'gbagfx'))
    def gbagfx(*args):
        return subprocess.run(['wsl', _BIN, *args], capture_output=True, text=True)
else:
    _BIN = os.path.join(BASE, 'tools', 'gbagfx', 'gbagfx')
    def gbagfx(*args):
        return subprocess.run([_BIN, *args], capture_output=True, text=True)


# alias for path conversion
win_to_wsl = to_native
PAL_WSL    = to_native(PAL_PATH)


def safe(name: str) -> str:
    _ILLEGAL = set(r'\/:*?"<>|')
    return ''.join('_' if c in _ILLEGAL else c for c in name).strip()


def c_ident(prefix: str, card_name: str, index: int) -> str:
    """gCardIconLargeBlue_Eyes_White_Dragon_1  etc."""
    stem = re.sub(r'[^A-Za-z0-9]', '_', card_name)
    stem = re.sub(r'_+', '_', stem).strip('_')
    return f'{prefix}{stem}_{index}'


def build():
    """BUILD direction: PNG -> .8bpp (default, called by make)."""
    os.makedirs(BPP8_DIR, exist_ok=True)
    files = sorted(f for f in os.listdir(PNG_DIR) if f.endswith('.png'))
    total = len(files)
    ok = up_to_date = err = 0
    print(f'BUILD: converting {total} icon PNGs -> .8bpp ...')

    for i, fname in enumerate(files, 1):
        stem     = fname[:-4]
        is_large = stem.endswith('_large')
        mwidth   = '4' if is_large else '3'
        png_path = os.path.join(PNG_DIR,  fname)
        bpp_path = os.path.join(BPP8_DIR, stem + '.8bpp')
        png_mtime = os.path.getmtime(png_path)

        if os.path.exists(bpp_path) and os.path.getmtime(bpp_path) >= png_mtime:
            up_to_date += 1
            continue

        result = gbagfx(
            win_to_wsl(png_path),
            win_to_wsl(bpp_path),
            '-mwidth', mwidth,
        )
        if result.returncode == 0:
            ok += 1
        else:
            err += 1
            if err <= 5:
                print(f'  [{i}/{total}] ERROR {fname}: {result.stderr.strip()[:80]}')

        if i % 1000 == 0 or i == total:
            print(f'  [{i}/{total}] ok={ok} up-to-date={up_to_date} err={err}')

    print(f'Done: {ok} converted, {up_to_date} up-to-date, {err} errors.')


def import_icons():
    """IMPORT direction: .8bpp -> PNG (run manually to export from ROM data)."""
    files = sorted(f for f in os.listdir(BPP8_DIR) if f.endswith('.8bpp'))
    total = len(files)
    ok = err = 0
    print(f'IMPORT: converting {total} icon .8bpp -> .png ...')

    for i, fname in enumerate(files, 1):
        stem     = fname[:-5]
        is_large = fname.endswith('_large.8bpp')
        mwidth   = '4' if is_large else '3'
        bpp_path = os.path.join(BPP8_DIR, fname)
        png_path = os.path.join(PNG_DIR,  stem + '.png')

        result = gbagfx(
            win_to_wsl(bpp_path),
            win_to_wsl(png_path),
            '-mwidth', mwidth,
            '-palette', PAL_WSL,
        )
        if result.returncode == 0:
            ok += 1
        else:
            err += 1
            if err <= 5:
                print(f'  [{i}/{total}] ERROR {fname}: {result.stderr.strip()[:80]}')

        if i % 1000 == 0 or i == total:
            print(f'  [{i}/{total}] ok={ok} err={err}')

    print(f'Done: {ok} ok, {err} errors.')


def main():
    import sys
    if '--import' in sys.argv:
        import_icons()
    else:
        build()   # default: PNG -> 8bpp (--build or no argument)


if __name__ == '__main__':
    main()
