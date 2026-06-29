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
  cards like Archlord Zerato/BESD. REDMD currently has no path to that
  menu — effect (1) only fires because `gEngineEffectSpecialSummon_080AB200`
  is itself called from a generic, unconditional per-tick dispatcher
  (`gEngineEffectBoostATKBoostDEF_08094CD4`, asm/code_08088C9C.s:25157)
  that happens to also run while Normal Summon's own bookkeeping has
  `gUnk_0201E4D0.card_id` set to ours. What actually controls "Special
  Summon" menu-item visibility was not found this session (the classifier
  is the obvious candidate, but registering REDMD in it breaks Normal
  Summon — see landmines above). Confirmed explicitly: Normal Summon must
  stay unblocked; that's not a bug to fix.
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
