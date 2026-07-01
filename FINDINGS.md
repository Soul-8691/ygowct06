# Red-Eyes Darkness Metal Dragon (REDMD) — Findings

Working notes from reverse-engineering the parts of the engine this card's
implementation depends on. This is the up-to-date, authoritative summary —
some inline comments in `asm/new_code.s`/`src/new_code.c` predate later
findings here and haven't all been refreshed yet (noted below where that
matters). Everything here applies to the `rom-base` branch; `src/new_code.c`
and `asm/new_code.s` don't exist on `main`.

The card is slotted onto `KONAMI_GOBLIN_CALLIGRAPHER`'s ID (0x17D0 / 6096) —
a vanilla card with no original `gEffects1/2/3` entry, making it a safe,
inert slot to overwrite.

## Current live wiring

- `src/card.c`: both `CARD_GOBLIN_CALLIGRAPHER` rows — ATK 2800 / DEF 2400 /
  RACE_DRAGON / ATTR_DARK / TYPE_EFFECT. **Level is 1, not the real card's
  10** — deliberate, so it can still be Normal Summoned without 2 tributes.
  Restore to 10 only once that's no longer needed for testing (Normal Summon
  is *not* meant to be blocked — see "Open questions" below).
- `src/card_names_descriptions.c`: still says "Goblin Calligrapher" — not
  yet updated to the real name/text.
- `src/effects.c` (`gCardEffects3` row): King Dragun's real row, with slot 3
  swapped for our wrapper:
  `{ KONAMI_GOBLIN_CALLIGRAPHER, 0, { gCardEffectSearchSpecialSummon_0806FDEC, NULL, gCardEffectSpecialSummon_08062E1C, EngineRDMD_MarkSummonUsedThenAnimate, NULL } }`
- `src/AI_2.c`: `gCardAISpecialSummonDragonFromHandOrGraveyard` — the function that actually
  drives effect (2); see below.
- `src/AI.c`: unrelated row (`gCardAISpecialSummonDiscard_080BABA8`) restored
  after being accidentally deleted earlier — not part of REDMD's design,
  just a regression fix.
- `asm/new_code.s` `gEngineEffectSpecialSummon_0804B81C_New`: REDMD's card-ID
  check is **commented out** (disabled). Re-enabling it breaks both Normal
  and Special Summon — confirmed twice, see "Landmines" below.
- `asm/new_code.s` `gEngineEffectSpecialSummon_080A8C30_New`: REDMD's card-ID
  check fires **unconditionally** (whenever `gUnk_0201E4D0.card_id` matches,
  regardless of context — including while evaluating effect (2)). Routes to
  `_080A8F18_`, which calls `gEngineEffectBanishToSpecialSummon`
  (src/new_code.c) and, if it returns negative, falls through to a plain
  `movs r0, #0` instead of the shared tail's negative-result path (see
  "Landmines").
- Effect (1) (banish a Dragon to Special Summon from hand) — implemented in
  `gEngineEffectBanishToSpecialSummon` (src/new_code.c), confirmed working
  end-to-end including multi-Dragon target selection.
- Effect (2) (Special Summon a Dragon from hand/GY) — implemented via
  `gCardAISpecialSummonDragonFromHandOrGraveyard` (src/AI_2.c) registering real AI
  candidates, with King Dragun's own real execution chain resolving them.
  Confirmed working end-to-end, including real field placement.
- Neither effect has a dedicated "Special Summon" hand-menu option — see
  "Open questions".

## Confirmed real engine primitives (reusable)

These are genuine, traced behaviors of the original engine — safe to reuse
elsewhere, not invented:

- `sub_080EEDF8(cardId)` → returns `gCardStatsKonamiIDs[cardId-4007].race`
  (src/card.c, `KONAMI_BASE_ID=4007`).
- `gCardEffects3` slot 2 = read-only eligibility check, called speculatively/
  repeatedly before the player confirms anything. Slot 3 = the real,
  once-only commit. Confirmed via Cannon Soldier's real row
  (`gCardEffectTributeDamage_0805C3EC` / `gCardEffectTribute_080567A0`).
  Mixing these up corrupts the hand on every summon attempt.
- `sub_0808D88C(playerIdx, category, index)` — the real AI-candidate
  registration call. Category `0xB`=Hand (offset 0x48, count at `[3]`),
  `0xE`=Graveyard (offset 0x106, count at `[5]`). Confirmed from Cathedral
  of Nobles' `gCardAISearchSpecialSummon_08088B2C` (hand) and Skilled Dark
  Magician's `gCardAISpecialSummonGraveyard_0808A010` (GY).
- `gEngineEffectBoostATKBoostDEF_08047A80(s32 *request, s32 playerRelative, s32 zoneIndex)`
  — the real "remove from play" cost primitive used by Dark Core/Chaos
  Sorcerer/BLS (`gCardEffectBanishSpecialSummon_08076DE0`). Hardcodes
  destination `0xF` (Banished) internally. First param is a real
  `gCardEffects3`-style request pointer (zeroed `s32[6]`, byte `[2]` bit 0 =
  playerIdx) — **not** a raw playerIdx integer (passing one causes a silent
  failure several calls deeper, in `gEngineEffectDestroy_08046538`).
  `playerRelative=0` means "myself"; the zone index goes in the **third**
  argument. Synchronous — no async queue/wait hazard.
- `gEngineEffectSpecialSummon_080A7ACC` (XYZ-Dragon Cannon) — proves
  `sub_080969C4`'s pending-selection argument can be a real validation
  *callback* `(playerIdx, category, index)`, not just a plain `s32*`
  pointer (BESD's pattern). `EngineValidateDragonFieldZone` follows this
  callback shape.
- `gUnk_0201C510` — the real field-zone array. 5 zones/player, 5 `s32`
  words (20 bytes) per zone, `card:13` bitfield in the first word, base =
  `gUnk_0201C510 + playerIdx*0x868`. **Confirmed safe to read** (via Cannon
  Soldier's real tribute-target validator,
  `gEngineEffectTributeSpecialSummon_08033730`). **Not safe to write
  directly** — direct writes don't persist and corrupted the deck-browsing
  UI when tried.
- gPlayerCards zone offsets (all `s32`-indexed into `gPlayerCards[player][...]`,
  row stride `0x868`):
  - Hand: offset `0x48`, count at index `[3]`
  - Graveyard: offset `0x106`, count at index `[5]`
  - Banished: offset `0x174`, count at index `[7]`
  - `struct PlayerCard`'s `card:13` bitfield is read via
    `lsls r0,r0,#0x13 / lsrs r0,r0,#0x13` everywhere in the real engine.

## Storage / memory landmines (don't repeat these)

- **EWRAM vs ROM placement**: writable scratch globals declared in
  `asm/new_code.s` without an explicit `.bss` section switch sit in `.text`,
  which the linker places in ROM — writes to them are silent no-ops. (We hit
  this, "fixed" it with a `.bss` switch, then had to revert — see next
  point.)
- **`gUnk_0203EEB0` is not free space.** In this linker script, the gap
  between any two consecutive `gUnk_xxx` markers in the `ewram (NOLOAD)`
  section is that *previous* variable's own real, allocated footprint — not
  padding. `gUnk_0203EEB0`'s confirmed real usage is 0x404 bytes (one real
  routine, `sub_080F5F28`, asm/code_080F55A0.s:1299, reads/sorts/writes that
  much from its base as up to 128 8-byte records). Placing our own data at
  the *far end* of the full 4432-byte gap instead (last 64 bytes,
  `0x0203FFC0`-`0x0203FFFF`) got silently corrupted in practice while
  testing effect (2) — proving the buffer's real reach exceeds 0x404 bytes
  somewhere, just not by how much. **Fix that worked**: place data
  immediately after the confirmed 0x404-byte region instead
  (`gUnk_0203EEB0 + 0x404` = `0x0203F2B4`, see `linker.ld`) — confirmed via
  testing to fix effect (1)'s multi-Dragon target-selection persistence.
  `gEngNC_UsedEffectFlags`/`gEngNC_LastValidatedDragonZone` are back in
  `.bss` (real EWRAM) at this address. If this placement also gets
  corrupted under some other condition, the buffer's real reach is bigger
  than 0x404 and this needs to move again.
- The GBA stack (`sp_sys`/`sp_irq` in `asm/crt0.s`) lives in **IWRAM**
  (`IWRAM_END - 0x800` / `- 0x200`), not EWRAM — ruled out as a cause of the
  above corruption.
- Editing an existing disassembled function in place (in `asm/code_*.s`)
  shifts every subsequent address in that file. Always duplicate-and-extend
  into `asm/new_code.s` with unique local labels instead, and repoint the
  one real call site.

## Dispatcher landmines (don't repeat these either)

- `gEngineEffectSpecialSummon_0804B81C` (classifier, returns a per-card
  "bucket") has exactly 3 real callers:
  `gEngineEffectSpecialSummon_0804BA58` (~28 call sites across
  `code_0801563C.s`/`code_08088C9C.s`/`code_080A7650.s`),
  `gEngineEffectSpecialSummon_0804BAB8` (internal bookkeeping, includes a
  hardcoded "always eligible, skip the classifier" list that The Tricky,
  Cyber Dragon, etc. are on), and
  `gEngineEffectSpecialSummonFusionSummon_0804BB6C` (Fusion-specific).
  **Registering REDMD in this classifier breaks both Normal and Special
  Summon** — confirmed twice, including after also adding REDMD to
  `_0804BAB8`'s hardcoded list (which does *not* protect Normal Summon the
  way it seemed to for real cards — that theory was wrong). The real
  mechanism that lets a card like The Tricky keep Normal Summon while also
  registering for alt-summon was never found. Left disabled.
- `gEngineEffectSpecialSummon_080A8C30` (resolver dispatcher)'s true
  default/fallthrough case (`_080A8F84`, asm/code_080A7650.s:3324) calls
  `gEngineEffectSpecialSummonDiscard_080A5F7C`, a real "search the deck"
  style resolver. **Never call this original dispatcher with an
  unrecognized card ID** (ours never matches anything in its real binary
  search) — it falls all the way through to this deck-search call and
  corrupts state. This is exactly what happened when the effect-(1)
  ineligible-fallback path called it directly; fixed by returning a plain
  `0` instead.
- `_080A8FB0` (asm/code_080A7650.s:3344) is the shared tail nearly every
  branch in `_080A8C30` jumps to. It has special handling **only** for
  *negative* results: sets `gUnk_0201E4D0.unk12` bit 3, queues message
  opcode `0x29`, and returns `+1` (not the original negative value) to its
  own caller, which also clears `unk12` bit 1. A plain `0` flows through
  harmlessly to a "return 0" path instead. Never feed this tail a negative
  result for an unrelated/ineligible evaluation.

## Dead / superseded code still in the tree

- `gEngineEffectRedEyesDarknessMetalDragon_BanishSummon` /
  `_SummonDragon` and their `gCardEffectRedEyesDarknessMetalDragon_*`
  wrapper functions (src/new_code.c) — an earlier, fully-staged design for
  both effects, kept only as reference. Not wired into any table. Effect
  (1) now lives in `gEngineEffectBanishToSpecialSummon` instead; effect (2)
  is solved entirely via real AI-candidate registration
  (`gCardAISpecialSummonDragonFromHandOrGraveyard`), not a custom state machine.
  `gEngineEffectRedEyesDarknessMetalDragon_PendingZone`/`_PendingLocation`
  (the `s32` globals these dead functions write to) are likewise unused at
  runtime, despite still being placed in the dangerous `gUnk_0203EEB0`
  EWRAM gap via `linker.ld`'s `src/new_code.o(.bss)`/`(COMMON)` rules —
  harmless only because nothing live ever calls into them.
- `gEngineEffectSpecialSummon_0804B81C_RDMD` /
  `_080A8C30_RDMD` (asm/new_code.s) — an earlier duplicate-and-extend pair,
  confirmed **not** wired into any real call site (the `_New` copies are
  the live ones). Dead code.
- `EngineFindFaceUpMonsterByRace` / `EngineRemoveFieldMonsterFromPlay` /
  `EngineSpecialSummonFromHand` / `EngineSpecialSummonFromHandOrGY`
  (asm/new_code.s) — built against an **unverified placeholder** field-zone
  offset (`0x1D0`) before `gUnk_0201C510` was confirmed as the real field
  array. Not used by the current implementation; superseded.
- The big header comment at the top of `asm/new_code.s` (lines ~8-65) is
  **stale** — it describes an earlier state of both effects (hand-only
  effect 2, effect 1 fully commented out, etc.) that no longer matches the
  current code. This FINDINGS.md file is the up-to-date version; the header
  comment hasn't been refreshed yet.

## Open questions / remaining work

- **No dedicated "Special Summon" menu option.** The game has a real,
  separate "Special Summon" hand-menu item (distinct from "Summon") for
  cards like Archlord Zerato/BESD. REDMD currently has no path to that menu.
  What we know concretely about the real dispatch chain so far:
  - `gEngineEffectSpecialSummon_080AB200` (asm/code_080A7650.s:7814) only
    calls the resolver (`_080A8C30_New`) if `gUnk_0201E4D0.unk12` **bit 0**
    is set — a real, genuine gate, not unconditional (an earlier note in
    this doc claiming it fires unconditionally was wrong).
  - There's a whole real family of per-card-type "alt-summon setup"
    functions (Equip/Tribute/Banish/GY-style,
    asm/code_08088C9C.s:55720-56183, dispatched via
    `gEngineEffectSpecialSummon_080A4AF4`/`_08095FE0`-style candidate
    validation) that each set **bit 1**, not bit 0, then scan field zones
    for valid material. Bit 1 looks like "alt-summon eligibility was
    checked and a valid material exists", a different signal from bit 0
    ("resolve now").
  - `gEngineEffectSpecialSummon_080AB200`'s only static caller anywhere in
    the codebase is inside `gEngineEffectBoostATKBoostDEF_08094CD4`
    (asm/code_08088C9C.s:25157) — but that function itself has **zero**
    static callers anywhere (verified by grep for both its symbol name and
    raw address). Two research agents and direct tracing all failed to find
    how it's actually reached during real gameplay, despite the resolver
    chain demonstrably running in real testing. Likely reached via some
    dynamic/indirect mechanism not visible to a static text search.
  - **Tried and reverted**: forcing `unk12` bit 0 unconditionally for
    REDMD's card_id right before calling the real, unmodified `_080AB200`
    (a thin wrapper repointed at the one known call site). Result: worse,
    not better — REDMD couldn't be summoned at all (neither Normal nor
    Special), and with 2+ valid Dragons on the field, banishing now removed
    *both* instead of the one chosen. Conclusion: bit 0 is not safe to force
    in isolation — there's evidently a fuller real sequence (bit 1 set by
    the real setup family above, then some other real code transitioning to
    bit 0) that needs to be replicated completely, not just flipped as a
    single bit. Don't retry this exact approach without finding that real
    sequence first.
  - The classifier (`_0804B81C`) is the other obvious candidate for
    menu-visibility, but registering REDMD in it breaks Normal Summon (see
    landmines above). Confirmed explicitly: Normal Summon must stay
    unblocked; that's not a bug to fix.
- **No real turn-change/reset event found.** Both a targeted search and a
  background research agent looked for a global turn counter or a generic
  turn-change hook real once-per-turn cards reset against, and found
  neither — Cannon Soldier's Tribute effect, the only real "once per turn"
  example traced, doesn't appear to use one either (its slot 2 has no
  explicit once-per-turn gate beyond the slot-2/slot-3
  speculative-vs-committed split). Consequence: once
  `gEngNC_UsedEffectFlags` actually persisted in EWRAM (see above), nothing
  ever clears it again — it's "used forever," not "used this turn."
  Discovered the hard way: enabling the flag check in
  `gCardAISpecialSummonDragonFromHandOrGraveyard` made it permanently stop
  registering hand/GY candidates after the first use, and King Dragun's
  real resolution chain — finding zero pre-registered candidates — fell
  back to its own native behavior: searching the Deck. **Fix applied**: the
  `EngineUsedEffectThisTurn` check in `gCardAISpecialSummonDragonFromHandOrGraveyard`
  is commented out/removed for now. Effect (2) has no once-per-turn
  enforcement at all currently (can be activated repeatedly in the same
  turn) — a known regression from the real card's text, but strictly better
  than permanently breaking after one use. `EngineRDMD_MarkSummonUsedThenAnimate`
  still marks the flag on commit (now harmlessly inert) so the check can be
  restored with a one-line change once a real reset mechanism is found.
  Effect (1) (`gEngineEffectBanishToSpecialSummon`) never had this check to
  begin with, so it's unaffected.
- `src/card.c` Level still 1, not 10 (cosmetic/testing convenience — see
  above).
- `src/card_names_descriptions.c` still says "Goblin Calligrapher".
- "Summon" can still be selected with no valid Dragon on the field (effect
  (1)'s actual condition unmet) and silently does nothing — no error/cancel
  message. Not yet investigated.

---

# Fencing Fire Ferret (FFF) — Findings

Slotted onto `KONAMI_FLAME_VIPER` (0x122A / 4650, `CARD_FLAME_VIPER` = 529) — a vanilla
monster with no meaningful original effect. Effect text: "If destroyed and sent to GY:
destroy 1 face-up monster the opponent controls, then inflict 500 damage to your opponent."

## Current live wiring

- `src/card.c`: both `CARD_FLAME_VIPER` rows — ATK 1700 / DEF 600 / Level 4 /
  RACE_BEAST / ATTR_FIRE / TYPE_EFFECT.
- `src/effects.c` (`gCardEffects2` row, sorted between WITCH=4580 and CHIMERA=4756):
  ```c
  { KONAMI_FLAME_VIPER, 0, {
      gCardEffectFFF_GYResolve,             // slot-0: destroy registered target + 500 dmg
      gCardEffectTakeControlFlip_08052080,  // slot-1: validate face-up opponent monster
      NULL,
      NULL,
      gCardEffectDestroy_0808198C           // slot-4: enable GY targeting chain
  } }
  ```
- `asm/new_code.s`:
  - `gCardEffectFFF_GYTrigger` — dead code (auto-selects first face-up opponent
    monster, no targeting UI). Not wired into any table; kept as reference.
  - `gCardEffectFFF_GYResolve` — live slot-0. Calls
    `gEngineEffectDestroyBoostATK_0806460C` (reads the player-selected target
    registered by the engine during the targeting phase), then on success computes
    `opponentIdx = 1 - (self[2] & 1)` and calls
    `gEngineEffectDiscardDamage_080487B0(self, opponentIdx, 500)`.
  - `gEngineEffectGraveyardSendToGY_0804559C_New` — clone of the original
    `_0804559C` with FLAME_VIPER (0x122A) detected early in the binary-search
    tree and routed to `_080459A4` (the same path used by Sangan/Witch/etc.
    for gCardEffects2-style GY triggers).
- `asm/code_0801EF94.s`: 4 call sites changed from
  `gEngineEffectGraveyardSendToGY_0804559C` to
  `gEngineEffectGraveyardSendToGY_0804559C_New` (lines 82676, 83916, 84198, 84584).

## gCardEffects2 slot architecture (confirmed)

- **Slot-4** (`gCardEffectDestroy_0808198C`): called by the chain state machine
  (case 5 in the dispatch table at `_0804D258`). When slot-4 is present, the
  machine routes through case 5 → case 6 instead of jumping directly from case 4
  to case 6. Slot-4 calls `gEngineEffectDiscardDestroySpellTrap_08081900` or
  `gEngineEffectDestroy_080B5D98` depending on a global phase flag
  (`gUnk_0201E2A0`). This sets up the targeting context that allows slot-1 to be
  invoked for player selection. **Without slot-4, no targeting UI appears** — the
  engine skips straight to case 6 with no selection step.
- **Slot-1** (`gCardEffectTakeControlFlip_08052080`): called during the targeting
  phase for each `(playerIdx, zone)` pair. Returns 1 if the zone is a valid target,
  0 otherwise. This function performs:
  1. Zone ≤ 4 (monster zones only)
  2. Card present: `word[0] << 19 != 0`
  3. Opponent-only: `(self[2] & 1) != playerIdx`
  4. Face-up: `halfword[8] != 0` — halfword at offset 8 of the zone entry is 0 for
     face-down monsters and non-zero for face-up monsters
  5. Standard validity checks (`gEngineEffectSpecialSummonNegate_08036770`,
     `gEngineEffectSpecialSummonDestroy_08036450/0803670C`)
- **Slot-0** (`gCardEffectFFF_GYResolve`): resolution. The engine has already
  registered the player's selection before slot-0 is called.
  `gEngineEffectDestroyBoostATK_0806460C` reads that registration via
  `sub_08080D94` and destroys the target. Returns 1 on success; slot-0 only
  deals 500 damage if the destroy succeeded.

## GY trigger detection

`gEngineEffectGraveyardSendToGY_0804559C` has a hardcoded binary-search tree over
Konami IDs. Cards not in the tree return 0 (no GY effect). Adding FFF required
cloning the function as `_New` and inserting a check for 0x122A before the real
tree, branching to `_080459A4` — the entry point that eventually calls the chain
state machine for `gCardEffects2`-style effects (same path as Sangan/Witch). The
4 call sites in `code_0801EF94.s` that send cards to GY are redirected to `_New`.

## `halfword[8]` face-up encoding (confirmed)

Zone entry format (`gUnk_0201C510`, 20 bytes per zone):
- `word[0]` bits 12:0 = game card ID (0 = empty)
- `halfword[8]` (bytes 8–9) = 0 for face-down, non-zero for face-up (holds
  the relevant ATK or similar display value). The face-up check `ldrh r0,[entry,#8]; cmp r0,#0; beq skip` is the canonical engine pattern — used by
  `gCardEffectTakeControlFlip_08052080` (slot-1 here), the old
  `gCardEffectFFF_GYTrigger`, and several other real effect functions.

---

# My Body as a Shield (MBAS) — Findings

Slotted onto `KONAMI_GIGOBYTE` (0x1783 / 6019, `CARD_GIGOBYTE` = 1565) — a
vanilla monster with no original `gEffects1/2/3` entry and no AI entry.
Implemented as a **Quick-Play Spell** (`RACE_SPELL / ATTR_SPELL / TYPE_SPELL /
SPELLTYPE_QUICK_PLAY`) that costs 1500 LP and negates/destroys any activated
Spell, Trap, or on-field monster effect.

## Current live wiring

- `src/card.c`: both `CARD_GIGOBYTE` rows set to Quick-Play Spell
  (`RACE_SPELL / ATTR_SPELL / TYPE_SPELL / SPELLTYPE_QUICK_PLAY`).
- `src/effects.c` (`gCardEffects` / gEffects1 row):
  ```c
  { KONAMI_GIGOBYTE, 0, {
      gCardEffectNegateDestroy_08065698,     // slot 0: negate (same fn as MJ/7-Tools)
      NULL,
      gCardEffectNegateDestroy_0805D118_New, // slot 2: eligibility (spell/trap OR monster)
      gCardEffectMBaaS_PayLP1500,            // slot 3: pay 1500 LP
      NULL
  } }
  ```
  The table must remain sorted by Konami ID; MBAS's entry is placed
  accordingly.
- `src/AI.c` (`gAIEffects2`, size bumped to 70):
  `{ KONAMI_GIGOBYTE, 0, gCardAINegateDestroy_080B40D8 }`
- `asm/new_code.s`:
  - `MBaaS_MonsterEffectCheck` — local helper; copy of Divine Wrath's
    slot-2 (`gCardEffectNegateDiscard_080629C8`). Checks:
    1. target != NULL
    2. `gEngineEffectNegateReturnToHand_0804C16C(target_id) == 0`
    3. `sub_0804AD48(target_id) != 0` (card has activatable effects)
    4. `sub_0804AD70(target_id) != 0` (card's type/race is targetable)
    5. `target[2] & 0x3E != 0x1A` (not from hand zone)
    6. Calls `gCardEffectDiscard_0805C1E4(self, target)` and returns its
       result (inherited directly from DW's copy — MBAS pays LP, not a
       discard, so this is the one divergence from the real card's text).
  - `gCardEffectNegateDestroy_0805D118_New` — slot 2; copy of
    `gCardEffectNegateDestroy_0805D118` with MBAS's ID handled first,
    before the original routing table. For `KONAMI_GIGOBYTE`:
    - Runs the spell/trap pre-checks (zone ≤ 0xA, target[3] & 0x30 == 0,
      not already-negated) → if all pass, jumps to `_0805D732` (return 1).
    - If those fail, falls through to `_MBAAS_TryMonster` which calls
      `MBaaS_MonsterEffectCheck` and returns its result via `_0805D738`.
    For all other card IDs the function falls through to the original
    binary-search routing table unchanged.
  - `gCardEffectMBaaS_NegateDestroy` — dead code; an earlier standalone
    copy of `gCardEffectNegateDestroy_08065698`. Not wired into any table;
    the live slot-0 uses the original function pointer directly.
  - `gCardEffectMBaaS_PayLP1500` — slot 3; reads playerIdx from `self[2]`
    bit 0, hardcodes 1500 (`0x5DC`), calls `sub_08048750(playerIdx, 1500)`.
- `src/starter_decks.c`: `gStarterDeck[6]` pointer fields cast to `(u8 *)`
  to suppress the "initialization from incompatible pointer type" warning
  (the struct declares `u8 *pointer` but the arrays are `u16 [][2]`).

## Quick-response slot architecture (applies to MJ, 7-Tools, MBAS)

- **Slot 2** (`gCardEffectNegateDestroy_0805D118` family):
  - Called speculatively to ask "should this card be offered right now?"
  - Pre-checks (shared for all routed cards, `_0805D126`–`_0805D14A`):
    1. `target == NULL` → return 0
    2. `(target[2] >> 1) & 0x1F > 0xA` (zone > 10) → return 0
       — this means both spell/trap zones **and** monster zones 0–4
       all pass; the zone check does NOT restrict to spell/trap only.
    3. `target[3] & 0x30 != 0` → return 0 (already-resolved state flags)
    4. `gEngineEffectNegateReturnToHand_0804C16C(target_id) != 0` → return 0
       (e.g. another counter trap on the chain)
  - After pre-checks, dispatch is on **self's** Konami ID (not target's).
    Each card's branch does its own further target-type check before
    returning 1 (for Seven Tools: confirm target is a Trap; for Magic
    Jammer: confirm target is a Spell; for MBAS's `_New` variant: return 1
    unconditionally after the shared pre-checks).
- **Slot 3** (cost): called once on commit. For MBAS: deduct 1500 LP. For
  Seven Tools: call `gCardEffectDamage_0805635C` (which calls
  `gEngineEffectDamage_08055930` first — a routing function that also
  handles Spell Economics). For Magic Jammer: `gCardEffectDiscard_08056380`
  (discard from hand).
- **Slot 0** (`gCardEffectNegateDestroy_08065698`): the actual negate+destroy.
  - Sets `target[4] |= 0xE` (bits 1,2,3 — marks card as negated).
  - Extracts `playerIdx` and `zone` from `target[2]`, and `index` from
    `target[4:5]` via `(halfword << 17) >> 23` (= bits[14:6] of the
    halfword).
  - Calls `gEngineEffectDestroyBoostATK_08044DCC(playerIdx, zone, index)` —
    conditionally destroys the card AND always queues negate command 0x43
    via `sub_0803BD2C(0x43/0x8043, zone, index, 0)`.
  - Calls `gEngineEffectBoostATKBoostDEF_08047A14(self, playerIdx, zone)` —
    computes `mask = 1 << (playerIdx*16 + zone)`, passes to
    `gEngineEffectBoostATKBoostDEF_08047724`. Appears to be a
    broadcast/notification step, not an ATK/DEF write.

## Chain entry struct (confirmed layout)

6-byte struct in `gUnk_0201B590[]` (24-byte stride, one per chain entry):
```
offset 0 (u16): Konami ID of activating card
offset 2 (u8):  bit 0 = playerIdx; bits[5:1] = zone index (0–4 monster,
                5–9 S/T zone, higher = GY/hand/etc.)
offset 3 (u8):  flags — bits 4,5 checked in slot-2 pre-check (_0805D132)
offset 4 (u8):  negate flags — bits 1,2,3 set by slot-0 to mark negated;
                bit 5 checked by sub_08090988 to skip slot-0 altogether
offset 5 (u8):  chain index
```

## Chain resolution engine

`sub_080A09C8` (0x080A09C8) — multi-step state machine, called repeatedly:
- Step 0 (counter = 0): init, writes metadata to fixed offsets in
  `gUnk_0201B590`, increments step counter.
- Step 1 (counter = 1): calls `sub_08090988(r5, r6)` where
  `r5 = gUnk_0201B590[count * 24]` (current resolving card's chain entry)
  and `r6 = r5 - 24` (the card it's responding to).

`sub_08090988(self, target)` (0x08090988):
- Checks `self[4] & 0x20` (bit 5). If set → skip slot-0 (card was already
  negated by a higher-priority counter trap on the same chain).
- Otherwise: binary-searches `gCardEffects[]` for self's Konami ID via
  `sub_080904F4`, loads `effects[0]`, calls `slot0Fn(self, target)`.

`sub_0803BD2C(opcode, zone, index, extra)` (0x0803BD2C):
- Appends one command (8 bytes) to the queue at `gUnk_0201BCC0`.
- Guard: if `gUnk_0201E2A0[8] == 3`, silently skips the enqueue.
- The command queue is flushed between chain entry resolutions — slot-0
  for MBAS enqueues 0x43 (negate), the engine processes it and sets bit 5
  on the target's chain entry, so when Dark Hole's turn comes
  `sub_08090988` sees bit 5 set and skips its slot-0.

## Divine Wrath — functions for monster-effect negation

Needed to extend MBAS to also negate monster effects.

**Slot-2 eligibility: `gCardEffectNegateDiscard_080629C8`** (0x080629C8):
- Runs the same four pre-checks as the `_0805D118` family above.
- `sub_0804AD48(konamiId)` → wraps `sub_080EEE50`; returns 1 if the card
  has at least one activatable effect (count > 0), 0 otherwise.
- `sub_0804AD70(konamiId)` → wraps `sub_080EEEA8`; jump-table on
  `(result - 1)` for values 0–11; returns 0 for cases 1, 3, 8
  (races/types that can't be targeted), 1 for all others.
- Zone check: `target[2] & 0x3E != 0x1A` — excludes activations from
  hand/certain zones.
- Finally calls `gCardEffectDiscard_0805C1E4(self, target)` — checks
  whether the activating player has a card to discard (DW's cost).
  **MBAS skips this last check** (LP payment, not discard).

**Slot-0 resolution: `gCardEffectNegateDiscard_0807B0C8`** (0x0807B0C8):
- Sets `target[4] |= 0xE` (same as MJ/7-Tools).
- Calls `sub_08030DE8(zone_index_from_target[4:5])` → r5 = card location
  struct (zone type, position on board, etc.).
- If `zone (target[2] bits[5:1]) <= 0xA` (on field): calls
  `gEngineEffectDestroyBoostATK_08044DCC` to negate+destroy the monster.
- Checks `r5`'s lower byte for zone type (≤ 0xA vs. 0xB vs. other) then
  routes to `gEngineEffectBanishGraveyard_08048020` or
  `gEngineEffectBoostATKBoostDEF_08047970` to handle the destroyed
  monster's destination.

## Open items

- **`gCardEffectDiscard_0805C1E4` call in `MBaaS_MonsterEffectCheck`.**
  Inherited verbatim from DW's slot-2; for the real MBAS it's incorrect
  (MBAS has no discard cost). In practice it means MBAS cannot respond to
  a monster effect if the activating player has no cards in hand. Has not
  caused observed test failures, but is a known divergence from the real
  card's text.
