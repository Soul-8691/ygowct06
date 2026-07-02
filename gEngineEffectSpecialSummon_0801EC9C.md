# gEngineEffectSpecialSummon_0801EC9C — Analysis Notes

## Function Overview

```c
s32 gEngineEffectSpecialSummon_0801EC9C(s32 arg0, u16 arg1, u16 arg2, u32 arg3)
```

General-purpose special-summon effect dispatcher. `arg0` selects the operation; `arg1`, `arg2`, and `arg3` are operation-specific parameters. Returns 1 on success, 0 on failure or no-op.

### Range check

The asm does `subs r0, #1; cmp r0, #0x3c; bls table; b return0`. The switch operates on `arg0 - 1`, range 0–60 (arg0 1–61). Out of range returns 0. The auto-decompiled `code.c` uses `switch(temp_r0)` (0-indexed), while Ghidra shows `switch(param_1)` with 1-indexed case values — both are correct.

### Switch map (arg0-1 index → destination)

| Index (arg0-1) | arg0 | Destination | Action |
|---|---|---|---|
| 0,1,3,4,13,15,18,22,31,34,36,45,46,47,50,51,54,55,57–60 | — | `_0801EF60` | `sub_080BC794(arg1,arg2,arg3)` → return 1 |
| 7,14,37,53 | — | `_0801EF84` | return 0 |
| 9,27–30,33,38–44,52,56 | — | `_0801EDC2` | return 1 (no-op) |
| 2 | 3 | `_0801EE48` | GY-scan special summon (complex, see below) |
| 5 | 6 | `_0801EEE4` | `gEngineEffectBoostATKBoostDEF_080C8F48(arg1)` |
| 6 | 7 | `_0801EF42` | `gEngineEffectSpecialSummon_080C6A20(arg1,arg2,arg3)` |
| 8 | 9 | `_0801EE06` | `gEngineEffectSpecialSummonPreventAttack_080C8BF0(); sub_080C2840(arg1)` |
| 10 | 11 | `_0801EE1E` | `sub_080C2880(arg1,arg2,arg3)` |
| 11 | 12 | `_0801EE12` | `sub_080C291C(arg1,arg2,arg3)` |
| 12 | 13 | `_0801EE36` | `sub_080CA5F8(arg1,arg2)` |
| 16 | 17 | `_0801EEEC` | strh write to `gUnk_02023130`, then falls to `sub_080BC794` |
| 17 | 18 | `_0801EF20` | `gEngineEffectSpecialSummon_080C4220(arg1, gUnk_02023130[…])` |
| 19,21 | 20,22 | `_0801EDE6` | `gEngineEffectSpecialSummonDamage_080C39FC(arg1,arg2,sub_08094678(arg1,arg2))` |
| 23 | 24 | `_0801EDB8` | `sub_080C40E0(arg1,arg2,arg3)` → fallthrough to return 1 |
| 24 | 25 | `_0801EDC6` | `sub_080C4EA0(arg2,arg3)` |
| 25 | 26 | `_0801EDDC` | `sub_080C3D00(arg1,arg2)` |
| 26 | 27 | `_0801EDD0` | `gEngineEffectSpecialSummonDamage_080C412C(arg1,arg2,arg3)` |
| 32 | 33 | `_0801EF38` | `sub_080BC794(arg1,arg2,arg3)` then fallthrough to case 6 tail |
| 35 | 36 | `_0801EF4E` | `gEngineEffectSpecialSummon_080CBF0C(); Negate(); PreventAtk(); 080C8904()` |
| 48 | 49 | `_0801EE2A` | `sub_080C7950(arg1,arg2,arg3)` |
| 49 | 50 | `_0801EE40` | `gEngineEffectSpecialSummonBoostATK_080CBF58(arg2)` → return 0 |

---

## Case 0x2 (arg0 = 3) Detail

The most complex case. Tries to summon a monster from the field or GY.

**Fast path** (`sub_08096974()` returns 1): call `gEngineEffectSpecialSummon_080C6A20(gUnk_0201E2A0.unk4, 0xD, 0)` and return 1.

**Slow path**: scan two XOR'd versions of `gUnk_0201E2A0.unk4` (outer = 0 and 1), for each:
1. Scan field zones 0–10 via `gEngineEffectSpecialSummonSendToGY_08096B3C(xoredId, zone, 0)`. If bit 0x800 set → match found: call `gEngineEffectSpecialSummon_080C6A20(xoredId, zone, 0)` + `gEngineEffectSpecialSummonSendToGY_080C89E8()` → return 1.
2. Read GY count from `gUnk_0201C4EC` at byte offset `(xoredId & 1) * 0x868`. Scan GY indices 0..count-1 via `gEngineEffectSpecialSummonSendToGY_08096B3C(xoredId, 0xB, gyIdx)`. On match: same tail but with args `(xoredId, 0xB, gyIdx)`.
3. No match: `*(u32*)((u8*)&gUnk_020230F0 + xoredId * 4) = 0` (clear slot), continue outer loop.

After both outer iterations with no match: fall through to return 1.

---

## Bugs in code.c

### Bug 1 — Pointer arithmetic 4× wrong for all three global arrays

The asm uses the loaded symbol address as a raw byte base and adds integer byte offsets with `adds r0, r1, r2`. C pointer arithmetic does not work this way: `(s32*)p + n` advances `n * sizeof(s32) = n * 4` bytes, not `n` bytes.

**`gUnk_0201C4EC`** (lines 116, 120 in code.c):
- Asm byte offset: `(temp_r5 & 1) * 0x868`
- code.c: `*(temp_r1 + &gUnk_0201C4EC)` → byte offset `temp_r1 * 4 = (temp_r5 & 1) * 0x21A0` (4× too large)
- Correct: `*(s32*)((u8*)&gUnk_0201C4EC + (xoredId & 1) * 0x868)`
- Ghidra uses element index `(uVar6 & 1) * 0x21A` (= 0x868 / 4), letting C array scaling provide the factor of 4. Same result.

**`gUnk_020230F0`** (line 130 in code.c):
- Asm byte offset: `xoredId * 4` (via `lsls r0, r5, #2`)
- code.c: `*((temp_r5 * 4) + &gUnk_020230F0)` → byte offset `temp_r5 * 4 * 4 = xoredId * 16` (4× too large)
- Correct: `*(s32*)((u8*)&gUnk_020230F0 + xoredId * 4)` or equivalently `((s32*)&gUnk_020230F0)[xoredId]`
- Ghidra: `(&DAT_020230f0)[uVar6]` — uses the variable directly as element index.

**`gUnk_02023130`** (lines 153, 154, 183 in code.c):
- Asm accesses: `&gUnk_02023130 + 0x4C + arg1*2` (u16 read) and `&gUnk_02023130 + 0x50 + arg1*0xA0 + arg2*2` (u16 write)
- code.c `&gUnk_02023130 + 0x4C` → advances `0x4C * 4 = 0x130` bytes (4× too large); `arg1 * 2` → `arg1 * 8` bytes (4× too large); `arg1 * 0xA0` → `arg1 * 0x280` bytes (4× too large).
- Correct: `*(u16*)((u8*)&gUnk_02023130 + 0x4C + (u32)arg1 * 2)` for read; `*(u16*)((u8*)&gUnk_02023130 + 0x50 + (u32)arg1 * 0xA0 + (u32)arg2 * 2) = 1` for write.
- Ghidra correctly names the base addresses: `DAT_0202317c` = 0x02023130+0x4C and `DAT_02023180` = 0x02023130+0x50, using `undefined2 *` casts.

### Bug 2 — `temp_r5` declared as `u16` instead of `u32`

Line 36 in code.c: `u16 temp_r5`. The asm loads `gUnk_0201E2A0.unk4` with `ldr r5, [r0, #4]` (32-bit word load) then XORs with r7. The result occupies a full 32-bit register and is used for both the `& 1` player-index extraction and the `* 4` byte-offset scaling for `gUnk_020230F0`. Declaring as u16 silently truncates the upper 16 bits. Should be `u32`.

### Bug 3 — Case 0x10 halfword write treated as 32-bit store

Line 153 in code.c: `*((arg2 * 2) + (arg1 * 0xA0) + (&gUnk_02023130 + 0x50)) = 1` dereferences through an `s32*` (32-bit store). The asm uses `strh r0, [r1]` — a 16-bit halfword write. Needs a `*(u16*)` cast. Ghidra correctly uses `*(undefined2 *)`.

### Bug 4 — Inverted empty-if for outer loop continuation

Lines 132–136 in code.c:
```c
if (var_r7 > 1) {

} else {
    goto loop_18;
}
```
The asm is `adds r7, #1; cmp r7, #1; ble _0801EE70`. The empty-if body is dead; it exists solely to fall through. Should be:
```c
if (++outer <= 1) goto loop_18;
```

### Style issue — `goto block_32` jumps into another case's if-branch

code.c defines `block_32` inside case 0x2's if-branch and has cases 0x6 and 0x20 `goto block_32`, jumping into the middle of another case. Valid C, but architecturally misleading. In the asm, `_0801EF42`/`_0801EF48` is a shared tail separate from `_0801EE48` (case 0x2). Cleaner to inline the call at each site.

---

## Ghidra Comparison Notes

- Ghidra presents `switch(param_1)` with 1-indexed case values (the original arg0), while code.c switches on `temp_r0 = arg0 - 1` (0-indexed). Both are correct; neither is more accurate — the asm does `subs r0, #1` before the table lookup.
- Ghidra avoids the pointer arithmetic bug for `gUnk_0201C4EC` by computing the element index as `(uVar6 & 1) * 0x21A` (= 0x868/4), letting C array scaling reintroduce the factor of 4.
- Ghidra uses a do-while for inner loop 1 (`do { ... } while (iVar2 < 0xb)`); the asm is a while loop; code.c uses a pre-checked while. All three are equivalent.
- Ghidra misses the outer loop `gUnk_020230F0` clear — line 42 writes `(&DAT_020230f0)[uVar6] = 0` but the indexing is correct (element index `uVar6` if it's a `s32[]`).
- Ghidra elides the `gEngineEffectSpecialSummonSendToGY_080C89E8()` call after a GY match by grouping the inner loops via a `goto LAB_0801ef7a` shared label, which is accurate.
- Ghidra's case 0x11 (`_0801EEEC`) and case 0x12 (`_0801EF20`) numbering (1-indexed) aligns with the jump table: 0x11 = index 16 = `_0801EEEC`, 0x12 = index 17 = `_0801EF20`. code.c uses 0x10 and 0x11 respectively (0-indexed). Double-check when cross-referencing.
