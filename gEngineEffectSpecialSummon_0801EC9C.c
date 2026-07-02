/*
 * gEngineEffectSpecialSummon_0801EC9C.c
 * Corrected C interpretation of target.s / gEngineEffectSpecialSummon_0801EC9C.
 *
 * Changes from code.c:
 *   [FIX-1] All three array globals (gUnk_020230F0, gUnk_0201C4EC, gUnk_02023130)
 *           use explicit (u8*) casts so integer byte-offsets are not scaled by
 *           sizeof(s32). The original code.c let C pointer arithmetic silently
 *           multiply every offset by 4.
 *   [FIX-2] xoredId (was temp_r5) changed from u16 to u32. The asm loads a full
 *           word (ldr r5,[r0,#4]) then XORs with r7. Declaring u16 truncates the
 *           upper 16 bits silently.
 *   [FIX-3] Case 0x10 halfword write now uses a (u16*) cast. The asm uses strh,
 *           not str; code.c wrote a full 32-bit word.
 *   [FIX-4] Outer loop exit rewritten as a forward condition instead of an inverted
 *           empty-if block.
 *   [STYLE] Removed the goto-into-another-case's-if-branch pattern (goto block_32).
 *           Cases 0x06 and 0x20 now call gEngineEffectSpecialSummon_080C6A20 directly,
 *           mirroring the shared _0801EF42/_0801EF48 tail in the asm.
 */

/* ---- extern function declarations (unchanged from code.c) ---- */
s32 gEngineEffectBoostATKBoostDEF_080C8F48(u16);
s32 gEngineEffectSpecialSummonBoostATK_080CBF58(u16);
s32 gEngineEffectSpecialSummonDamage_080C39FC(u16, u16, u16);
s32 gEngineEffectSpecialSummonDamage_080C412C(u16, u16, u32);
s32 gEngineEffectSpecialSummonNegate_080C8D30(void);
s32 gEngineEffectSpecialSummonPreventAttack_080C8BF0(void);
s32 gEngineEffectSpecialSummonSendToGY_08096B3C(u16, s32, u32);
s32 gEngineEffectSpecialSummonSendToGY_080C89E8(void);
s32 gEngineEffectSpecialSummon_080C4220(u16, u16);
s32 gEngineEffectSpecialSummon_080C6A20(u16, s32, u32);
s32 gEngineEffectSpecialSummon_080C8904(void);
s32 gEngineEffectSpecialSummon_080CBF0C(void);
u16 sub_08094678(u16, u16);
s32 sub_08096974(void);
s32 sub_080BC794(u16, u16, u32);
s32 sub_080C2840(u16);
s32 sub_080C2880(u16, u16, u32);
s32 sub_080C291C(u16, u16, u32);
s32 sub_080C3D00(u16, u16);
s32 sub_080C40E0(u16, u16, u32);
s32 sub_080C4EA0(u16, u32);
s32 sub_080C678C(void);
s32 sub_080C7950(u16, u16, u32);
s32 sub_080CA5F8(u16, u16);

/*
 * [FIX-1] These globals are treated as byte-addressed arrays at call sites.
 * They remain declared as scalars here, but every access uses (u8*) casts
 * to prevent C pointer arithmetic from multiplying byte offsets by sizeof(s32).
 * See individual access sites below.
 */
extern s32 gUnk_0201C4EC;  /* base of a word-array; player slot at +player*0x868 */
extern s32 gUnk_020230F0;  /* word-array; element i at byte offset i*4 */
extern s32 gUnk_02023130;  /* mixed u16 fields; accessed at various byte offsets */
extern struct Unk_0201E2A0 gUnk_0201E2A0;

/*
 * gEngineEffectSpecialSummon_0801EC9C
 *
 * arg0: operation selector (1-indexed). The asm subtracts 1 and range-checks
 *       against 60 before indexing the jump table.  Values outside [1..61]
 *       return 0 immediately.
 * arg1: operation-specific u16 parameter (saved as r6 throughout).
 * arg2: operation-specific u16 parameter (saved as r7 throughout).
 * arg3: operation-specific u32 parameter (saved as r4 throughout).
 *
 * Returns 1 on success / handled, 0 on failure / no-op.
 *
 * NOTE: The switch indices below are arg0-1 (0-indexed), matching the asm
 * jump table.  Ghidra shows the same cases 1-indexed (e.g. Ghidra "case 3"
 * == this file's "case 0x2").
 */
s32 gEngineEffectSpecialSummon_0801EC9C(s32 arg0, u16 arg1, u16 arg2, u32 arg3)
{
    u32 index;

    /*
     * Range check: asm does `subs r0, #1; cmp r0, #0x3c; bls table; b return0`.
     * Values arg0 <= 0 or arg0 > 61 return 0.
     */
    index = (u32)(arg0 - 1);
    if (index > 0x3C)
        return 0;

    switch (index)
    {
    /* -----------------------------------------------------------------------
     * Case 0x17 (arg0=24): call sub_080C40E0 then fall through to return 1.
     * _0801EDB8 falls directly into _0801EDC2 in the asm.
     * ----------------------------------------------------------------------- */
    case 0x17:
        sub_080C40E0(arg1, arg2, arg3);
        /* fallthrough */

    /* -----------------------------------------------------------------------
     * Return-1 no-ops: these cases have no action other than returning 1.
     * _0801EDC2: movs r0, #1; b _0801EF86.
     * ----------------------------------------------------------------------- */
    case 0x09:
    case 0x1B:
    case 0x1C:
    case 0x1D:
    case 0x1E:
    case 0x21:
    case 0x26:
    case 0x27:
    case 0x28:
    case 0x29:
    case 0x2A:
    case 0x2B:
    case 0x2C:
    case 0x34:
    case 0x38:
        return 1;

    /* -----------------------------------------------------------------------
     * Case 0x18 (arg0=25): _0801EDC6
     * Note argument order: arg2, arg3 (not arg1, arg2).
     * ----------------------------------------------------------------------- */
    case 0x18:
        sub_080C4EA0(arg2, arg3);
        return 1;

    /* Case 0x1A (arg0=27): _0801EDD0 */
    case 0x1A:
        gEngineEffectSpecialSummonDamage_080C412C(arg1, arg2, arg3);
        return 1;

    /* Case 0x19 (arg0=26): _0801EDDC — only takes arg1, arg2 */
    case 0x19:
        sub_080C3D00(arg1, arg2);
        return 1;

    /* -----------------------------------------------------------------------
     * Cases 0x13 and 0x15 (arg0=20, 22): _0801EDE6
     * The asm zero-extends arg1 and arg2 to 16 bits explicitly with lsls/lsrs
     * before the calls, and zero-extends sub_08094678's return value the same
     * way before passing it as the third argument.
     * ----------------------------------------------------------------------- */
    case 0x13:
    case 0x15:
        gEngineEffectSpecialSummonDamage_080C39FC(
            (u16)arg1,
            (u16)arg2,
            (u16)sub_08094678(arg1, arg2));  /* return value zero-extended to u16 */
        return 1;

    /* Case 0x08 (arg0=9): _0801EE06 */
    case 0x08:
        gEngineEffectSpecialSummonPreventAttack_080C8BF0();
        sub_080C2840(arg1);
        return 1;

    /* Case 0x0B (arg0=12): _0801EE12 */
    case 0x0B:
        sub_080C291C(arg1, arg2, arg3);
        return 1;

    /* Case 0x0A (arg0=11): _0801EE1E */
    case 0x0A:
        sub_080C2880(arg1, arg2, arg3);
        return 1;

    /* Case 0x30 (arg0=49): _0801EE2A */
    case 0x30:
        sub_080C7950(arg1, arg2, arg3);
        return 1;

    /* Case 0x0C (arg0=13): _0801EE36 — only takes arg1, arg2 */
    case 0x0C:
        sub_080CA5F8(arg1, arg2);
        return 1;

    /* -----------------------------------------------------------------------
     * Case 0x31 (arg0=50): _0801EE40
     * Calls gEngineEffectSpecialSummonBoostATK_080CBF58(arg2) then jumps to
     * _0801EF84 (return 0).  Note: arg2 passed as u16, NOT arg1.
     * Falls through to default (return 0) — NOT to return 1.
     * ----------------------------------------------------------------------- */
    case 0x31:
        gEngineEffectSpecialSummonBoostATK_080CBF58(arg2);
        /* fallthrough to return 0 */

    /* -----------------------------------------------------------------------
     * Return-0 cases: indices 7, 14, 37, 53 (arg0 = 8,15,38,54) each point
     * to _0801EF84 in the jump table.  They are not explicitly listed and
     * fall into default.  Case 0x31 above also falls here.
     * Out-of-range values (index > 60) are caught by the range check at top.
     * ----------------------------------------------------------------------- */
    default:
        return 0;

    /* -----------------------------------------------------------------------
     * Case 0x02 (arg0=3): _0801EE48 — GY-scan special summon.
     *
     * The most complex case.  Two execution paths:
     *
     * Fast path (sub_08096974 returns 1):
     *   Directly summon from slot 0xD using the base ID.
     *
     * Slow path (sub_08096974 != 1):
     *   Outer loop iterates twice (outer = 0 and 1).  Each iteration XORs
     *   gUnk_0201E2A0.unk4 with the outer counter to get a "player-relative"
     *   ID.  Then:
     *     Inner loop 1: scan field zones 0–10 (0xA inclusive).
     *     Inner loop 2: scan GY entries 0..(count-1) using slot 0xB.
     *   Both inner loops check bit 0x800 of the call's return value.
     *   On a hit: summon and send to GY, then return 1 immediately.
     *   On a complete miss for this xoredId: clear gUnk_020230F0[xoredId].
     * ----------------------------------------------------------------------- */
    case 0x02:
    {
        if (sub_08096974() == 1)
        {
            /* Fast path: _0801EE48 → b _0801EF48 (shared with cases 0x06/0x20).
             * arg1=gUnk_0201E2A0.unk4, arg2=0xD (GY-like slot), arg3=0. */
            gEngineEffectSpecialSummon_080C6A20(
                (u16)gUnk_0201E2A0.unk4,  /* r0 = word at struct+4, passed as u16 */
                0xD,                       /* r1 = slot 13 */
                0);                        /* r2 = 0 */
            return 1;
        }

        /* Slow path: _0801EE60 — initialise outer loop.
         * r8 = 0x800 mask; sl = 1 (used for & 1 player extraction);
         * sb = &gUnk_020230F0 (cached pointer to the clear-on-miss array). */
        {
            u32 outer;    /* r7: 0 and 1 — XOR selector and loop counter */
            u32 xoredId;  /* r5: gUnk_0201E2A0.unk4 ^ outer
                           * [FIX-2] u32, not u16: loaded with ldr (full word),
                           * then used for byte-offset scaling below. */
            s32 zone;     /* r4: field zone counter (0–10) in inner loop 1 */
            u32 gyIdx;    /* r4: GY entry index in inner loop 2 (same register, re-used) */
            u32 gyCount;  /* r0: GY card count for this player */

            for (outer = 0; outer <= 1; outer++)   /* [FIX-4] was inverted empty-if */
            {
                /* _0801EE70: reload and XOR every iteration — gUnk_0201E2A0.unk4
                 * may change between iterations so it is re-read from memory. */
                xoredId = (u32)gUnk_0201E2A0.unk4 ^ outer;

                /* ---- Inner loop 1: scan field zones 0–10 ---- */
                /* _0801EE78 */
                for (zone = 0; zone <= 0xA; zone++)
                {
                    if (gEngineEffectSpecialSummonSendToGY_08096B3C(
                            (u16)xoredId, zone, 0U) & 0x800)
                    {
                        /* Hit: _0801EF6C → _0801EF7A.
                         * r0=xoredId, r1=zone(current), r2=0. */
                        gEngineEffectSpecialSummon_080C6A20((u16)xoredId, zone, 0U);
                        gEngineEffectSpecialSummonSendToGY_080C89E8();
                        return 1;
                    }
                }

                /* ---- Inner loop 2: scan GY (slot 0xB) ---- */
                /*
                 * Read the GY card count for the player indicated by xoredId&1.
                 * [FIX-1] gUnk_0201C4EC is a word (s32) base; player 0 is at
                 * byte offset 0, player 1 is at byte offset 0x868.
                 * C pointer arithmetic `s32* + n` would advance n*4 bytes, so
                 * we cast to u8* first and add the raw byte offset manually.
                 * Ghidra writes this as (&DAT_0201c4ec)[(xoredId&1) * 0x21A]
                 * where 0x21A == 0x868/4 — element-indexed to get the same bytes.
                 */
                gyCount = *(u32*)((u8*)&gUnk_0201C4EC + (xoredId & 1) * 0x868);

                /* _0801EEAA */
                for (gyIdx = 0; gyIdx < gyCount; gyIdx++)
                {
                    /*
                     * The asm re-reads the count pointer each iteration via r6
                     * (which caches &gUnk_0201C4EC + player*0x868). The C for-loop
                     * condition re-evaluates gyCount which was already computed, so
                     * this is equivalent unless the count can change mid-loop.
                     * If it can, replace `gyCount` with a re-read here.
                     */
                    if (gEngineEffectSpecialSummonSendToGY_08096B3C(
                            (u16)xoredId, 0xB, gyIdx) & 0x800)
                    {
                        /* Hit: _0801EF74 → _0801EF7A.
                         * r0=xoredId, r1=0xB (GY slot), r2=gyIdx. */
                        gEngineEffectSpecialSummon_080C6A20((u16)xoredId, 0xB, gyIdx);
                        gEngineEffectSpecialSummonSendToGY_080C89E8();
                        return 1;
                    }
                }

                /* No match for this xoredId: clear the slot. _0801EEC4.
                 * [FIX-1] asm: lsls r0,r5,#2; add r0,sb; str r1,[r0]
                 * = *(u32*)(&gUnk_020230F0 + xoredId*4 bytes) = 0.
                 * code.c wrote `*((temp_r5 * 4) + &gUnk_020230F0) = 0` which
                 * scales by 4 again (16× total). Cast to u8* to get byte offset. */
                *(u32*)((u8*)&gUnk_020230F0 + xoredId * 4) = 0;
            }
        }
        return 1;
    }

    /* Case 0x05 (arg0=6): _0801EEE4 */
    case 0x05:
        gEngineEffectBoostATKBoostDEF_080C8F48(arg1);
        return 1;

    /* -----------------------------------------------------------------------
     * Case 0x10 (arg0=17): _0801EEEC
     *
     * Write 1 (as a halfword) to gUnk_02023130[0x50 + arg1*0xA0 + arg2*2].
     * Then read gUnk_02023130[0x4C + arg1*2] (halfword) as second arg to
     * gEngineEffectSpecialSummon_080C4220.
     * Then fall through to sub_080BC794.
     *
     * Byte-offset derivation for the strh target (_0801EEEC):
     *   r1 = arg2 * 2
     *   r0 = arg1*4 + arg1 = arg1*5; lsls r0,r0,#5 = arg1*5*32 = arg1*0xA0
     *   r1 = arg2*2 + arg1*0xA0
     *   r0 = &gUnk_02023130 + 0x50
     *   r1 = &gUnk_02023130 + 0x50 + arg1*0xA0 + arg2*2
     *   strh r0, [r1]
     * ----------------------------------------------------------------------- */
    case 0x10:
        /*
         * [FIX-1] + [FIX-3] code.c: `*((arg2*2) + (arg1*0xA0) + (&gUnk_02023130+0x50)) = 1`
         * — wrong on two counts: pointer arithmetic scales by 4, AND it writes
         * a full word (s32) instead of a halfword (strh).
         * Fix: cast base to u8* for byte offsets, and cast target to u16* for halfword.
         */
        *(u16*)((u8*)&gUnk_02023130 + 0x50 + (u32)arg1 * 0xA0 + (u32)arg2 * 2) = 1;

        /*
         * Read halfword from gUnk_02023130 + 0x4C + arg1*2.
         * [FIX-1] code.c: `*((arg1*2) + (&gUnk_02023130 + 0x4C))` — same 4× error.
         * Ghidra: `(&DAT_0202317c)[param_2]` where 0x7C == 0x4C + base delta,
         * treating it as a u16 array so C scaling provides the *2. Same result.
         */
        gEngineEffectSpecialSummon_080C4220(
            arg1,
            *(u16*)((u8*)&gUnk_02023130 + 0x4C + (u32)arg1 * 2));

        sub_080C678C();
        gEngineEffectSpecialSummon_080CBF0C();
        /* fallthrough: _0801EEEC branches to _0801EF60 (sub_080BC794 group) */

    /* -----------------------------------------------------------------------
     * sub_080BC794 group: _0801EF60
     * All of these cases call sub_080BC794(arg1,arg2,arg3) then return 1.
     * Case 0x10 falls through to here after its strh + two calls.
     * ----------------------------------------------------------------------- */
    case 0x00:
    case 0x01:
    case 0x03:
    case 0x04:
    case 0x0D:
    case 0x0F:
    case 0x12:
    case 0x14:
    case 0x16:
    case 0x1F:
    case 0x22:
    case 0x24:
    case 0x2D:
    case 0x2E:
    case 0x2F:
    case 0x32:
    case 0x33:
    case 0x36:
    case 0x37:
    case 0x39:
    case 0x3A:
    case 0x3B:
    case 0x3C:
        sub_080BC794(arg1, arg2, arg3);
        return 1;

    /* -----------------------------------------------------------------------
     * Case 0x11 (arg0=18): _0801EF20
     * Reads gUnk_02023130[0x4C + arg1*2] (halfword) and passes it to
     * gEngineEffectSpecialSummon_080C4220 as second argument.
     * Same read as case 0x10, but without the strh write or fallthrough.
     * ----------------------------------------------------------------------- */
    case 0x11:
        /* [FIX-1] Same u8* cast needed as in case 0x10 read above. */
        gEngineEffectSpecialSummon_080C4220(
            arg1,
            *(u16*)((u8*)&gUnk_02023130 + 0x4C + (u32)arg1 * 2));
        return 1;

    /* -----------------------------------------------------------------------
     * Case 0x20 (arg0=33): _0801EF38
     * Calls sub_080BC794, then falls through to case 0x06.
     * _0801EF38 falls directly into _0801EF42 in the asm.
     * ----------------------------------------------------------------------- */
    case 0x20:
        sub_080BC794(arg1, arg2, arg3);
        /* fallthrough */

    /* -----------------------------------------------------------------------
     * Case 0x06 (arg0=7): _0801EF42 → _0801EF48 (shared with case 0x2 fast path)
     *
     * [STYLE] code.c used `goto block_32` to jump into the middle of case 0x2's
     * if-branch.  In the asm, _0801EF42/_0801EF48 is a standalone tail used by
     * three callers.  Inlining the call here is equivalent and clearer.
     * Case 0x2's fast path also calls gEngineEffectSpecialSummon_080C6A20 via
     * this same tail label; that path is handled inline in case 0x2 above.
     * ----------------------------------------------------------------------- */
    case 0x06:
        gEngineEffectSpecialSummon_080C6A20(arg1, (s32)arg2, arg3);
        return 1;

    /* -----------------------------------------------------------------------
     * Case 0x23 (arg0=36): _0801EF4E
     * Four calls, no arguments, in sequence.
     * ----------------------------------------------------------------------- */
    case 0x23:
        gEngineEffectSpecialSummon_080CBF0C();
        gEngineEffectSpecialSummonNegate_080C8D30();
        gEngineEffectSpecialSummonPreventAttack_080C8BF0();
        gEngineEffectSpecialSummon_080C8904();
        return 1;
    }
}
