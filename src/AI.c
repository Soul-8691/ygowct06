#include "AI.h"

// Forward declarations for AI effect functions
extern void gCardAIBanishDamage_080B1E04(void);
extern void gCardAIBanishDestroy_080B2694(void);
extern void gCardAIBanishDiscard_080B2A54(void);
extern void gCardAIBanishEndPhase_080B4878(void);
extern void gCardAIBanishGraveyard_080B4030(void);
extern void gCardAIBanishGraveyard_080B7CD8(void);
extern void gCardAIBanishGraveyard_080B8270(void);
extern void gCardAIBanishSendToGY_080B28AC(void);
extern void gCardAIBattlePhase_080B7F64(void);
extern void gCardAIBoostATKBoostDEF_080B21F8(void);
extern void gCardAIBoostATKBoostDEF_080B47F4(void);
extern void gCardAIBoostATKBoostDEF_080B84D8(void);
extern void gCardAIBoostATKBoostDEF_080B851C(void);
extern void gCardAIBoostATKBoostDEF_080B95A4(void);
extern void gCardAIBoostATKDamage_080B193C(void);
extern void gCardAIBoostATKEndPhase_080B398C(void);
extern void gCardAIBoostATKReduceATK_080B9310(void);
extern void gCardAIBoostATKReduceATK_080B98BC(void);
extern void gCardAIChangePositionBoostDEF_080B20D0(void);
extern void gCardAIChangePositionDestroy_080B2EEC(void);
extern void gCardAIChangePositionDestroy_080B90D0(void);
extern void gCardAIChangePositionStandbyPhase_080B25D4(void);
extern void gCardAIChangePosition_080B28F8(void);
extern void gCardAIChangePosition_080B4464(void);
extern void gCardAIChangePosition_080B7D6C(void);
extern void gCardAIChangePosition_080B8164(void);
extern void gCardAIChangePosition_080B8F68(void);
extern void gCardAIChangePosition_080B9090(void);
extern void gCardAIChangePosition_080B9B3C(void);
extern void gCardAIChangePosition_080B9ED0(void);
extern void gCardAIDamageBattlePhase_080BA6AC(void);
extern void gCardAIDamageChangePosition_080B7A48(void);
extern void gCardAIDamageChangePosition_080BAD6C(void);
extern void gCardAIDamageDirectAttack_080BA774(void);
extern void gCardAIDamageGraveyard_080B27E4(void);
extern void gCardAIDamagePreventAttack_080B9D08(void);
extern void gCardAIDamageTribute_080B8090(void);
extern void gCardAIDamageTribute_080BA090(void);
extern void gCardAIDamageTribute_080BA134(void);
extern void gCardAIDamageTribute_080BA20C(void);
extern void gCardAIDamage_080B2028(void);
extern void gCardAIDamage_080B2BB0(void);
extern void gCardAIDamage_080B778C(void);
extern void gCardAIDamage_080B77F8(void);
extern void gCardAIDamage_080B7E2C(void);
extern void gCardAIDamage_080B81D0(void);
extern void gCardAIDestroyAllDamage_080B7FB4(void);
extern void gCardAIDestroyAllDamage_080BA1D4(void);
extern void gCardAIDestroyAllDiscard_080B8658(void);
extern void gCardAIDestroyAllRitualSummon_080BA488(void);
extern void gCardAIDestroyAllStandbyPhase_080B1DD4(void);
extern void gCardAIDestroyAllTribute_080B29B4(void);
extern void gCardAIDestroyAll_080B7760(void);
extern void gCardAIDestroyAll_080B860C(void);
extern void gCardAIDestroyBattlePhase_080B9C50(void);
extern void gCardAIDestroyBoostATK_080B79F8(void);
extern void gCardAIDestroyBoostATK_080B96C4(void);
extern void gCardAIDestroyBoostATK_080BAA2C(void);
extern void gCardAIDestroyChangePosition_080B8698(void);
extern void gCardAIDestroyChangePosition_080BA5C4(void);
extern void gCardAIDestroyCounter_080BA518(void);
extern void gCardAIDestroyDamage_080B1EF0(void);
extern void gCardAIDestroyDamage_080B1FB8(void);
extern void gCardAIDestroyDamage_080B1FD4(void);
extern void gCardAIDestroyDamage_080BA84C(void);
extern void gCardAIDestroyEndPhase_080BA29C(void);
extern void gCardAIDestroyEquip_080B19D0(void);
extern void gCardAIDestroyEquip_080B76C8(void);
extern void gCardAIDestroyEquip_080B981C(void);
extern void gCardAIDestroyPreventAttack_080B1D74(void);
extern void gCardAIDestroyRNG_080BAAC8(void);
extern void gCardAIDestroySpecialSummon_080B2480(void);
extern void gCardAIDestroySpellTrapBoostATK_080BA678(void);
extern void gCardAIDestroySpellTrapDamage_080B1E80(void);
extern void gCardAIDestroySpellTrapDestroyAll_080B7934(void);
extern void gCardAIDestroySpellTrap_080B1E18(void);
extern void gCardAIDestroySpellTrap_080B4728(void);
extern void gCardAIDestroySpellTrap_080B7838(void);
extern void gCardAIDestroySpellTrap_080B7858(void);
extern void gCardAIDestroyStandbyPhase_080B80BC(void);
extern void gCardAIDestroyStandbyPhase_080B849C(void);
extern void gCardAIDestroyTribute_080BA24C(void);
extern void gCardAIDestroy_080B1C80(void);
extern void gCardAIDestroy_080B23D8(void);
extern void gCardAIDestroy_080B76A8(void);
extern void gCardAIDestroy_080B8A54(void);
extern void gCardAIDirectAttackTribute_080BA890(void);
extern void gCardAIDirectAttack_080B9FC0(void);
extern void gCardAIDirectAttack_080BA8E4(void);
extern void gCardAIDiscardDamage_080B1998(void);
extern void gCardAIDiscardDamage_080B4280(void);
extern void gCardAIDiscardDestroyAll_080B2C10(void);
extern void gCardAIDiscardDestroyAll_080B85D4(void);
extern void gCardAIDiscardDestroyAll_080B870C(void);
extern void gCardAIDiscardDestroy_080B2A10(void);
extern void gCardAIDiscardEndPhase_080B4970(void);
extern void gCardAIDiscardEndPhase_080B88C4(void);
extern void gCardAIDiscardGraveyard_080B4678(void);
extern void gCardAIDiscardReturnToHand_080B803C(void);
extern void gCardAIDiscardReturnToHand_080B9E34(void);
extern void gCardAIDiscard_080BA914(void);
extern void gCardAIDrawDiscard_080B8074(void);
extern void gCardAIDrawDiscard_080B93F0(void);
extern void gCardAIDrawDiscard_080B98F0(void);
extern void gCardAIDrawGraveyard_080B9C28(void);
extern void gCardAIDrawSpecialSummon_080B46CC(void);
extern void gCardAIDraw_080B99B0(void);
extern void gCardAIEndPhaseDestroyAll_080B9D50(void);
extern void gCardAIEndPhase_080B9398(void);
extern void gCardAIEquipBoostATK_080B9734(void);
extern void gCardAIEquipPreventAttack_080B9868(void);
extern void gCardAIEquipSendToGY_080B9770(void);
extern void gCardAIEquip_080B978C(void);
extern void gCardAIGainLPDamage_080B1D24(void);
extern void gCardAIGainLPStandbyPhase_080B20B4(void);
extern void gCardAIGainLP_080B207C(void);
extern void gCardAIGainLP_080B777C(void);
extern void gCardAIGraveyardDestroy_080B76A4(void);
extern void gCardAIGraveyardSearch_080B95C8(void);
extern void gCardAIGraveyard_080B3FA8(void);
extern void gCardAIGraveyard_080B8EAC(void);
extern void gCardAINegateDamage_080B1BF4(void);
extern void gCardAINegateDamage_080B4240(void);
extern void gCardAINegateDestroy_080B4098(void);
extern void gCardAINegateDestroy_080B40B8(void);
extern void gCardAINegateDestroy_080B40D8(void);
extern void gCardAINegateDestroy_080B41B4(void);
extern void gCardAINegateDestroy_080B4304(void);
extern void gCardAINegateDiscard_080B4930(void);
extern void gCardAINegate_080B41DC(void);
extern void gCardAIPreventAttack_080B2D98(void);
extern void gCardAIPreventAttack_080B8138(void);
extern void gCardAIRNG_080BA3CC(void);
extern void gCardAIReduceATKEquip_080B9514(void);
extern void gCardAIReturnToHand_080B7878(void);
extern void gCardAIRitualSummonTribute_080B85B0(void);
extern void gCardAISearchDamage_080BADF4(void);
extern void gCardAISearchDiscard_080B9BB8(void);
extern void gCardAISearchDiscard_080B9F5C(void);
extern void gCardAISearchDiscard_080BA708(void);
extern void gCardAISearchDiscard_080BA71C(void);
extern void gCardAISearchSendToGY_080B94FC(void);
extern void gCardAISearchSpecialSummon_080B4850(void);
extern void gCardAISearchSpecialSummon_080B8398(void);
extern void gCardAISearch_080B9D8C(void);
extern void gCardAISendToGYBoostATK_080BA018(void);
extern void gCardAISendToGYBoostATK_080BA194(void);
extern void gCardAISendToGYDamage_080B8208(void);
extern void gCardAISendToGYDestroy_080B2C70(void);
extern void gCardAISendToGYDestroy_080B2DCC(void);
extern void gCardAISendToGYDestroy_080B2E64(void);
extern void gCardAISendToGYGainLP_080B4378(void);
extern void gCardAISpecialSummonBanish_080B235C(void);
extern void gCardAISpecialSummonBanish_080B9ABC(void);
extern void gCardAISpecialSummonBanish_080BA7E0(void);
extern void gCardAISpecialSummonBoostATK_080BAAA8(void);
extern void gCardAISpecialSummonBoostATK_080BAB3C(void);
extern void gCardAISpecialSummonChangePosition_080B2EB0(void);
extern void gCardAISpecialSummonChangePosition_080B4518(void);
extern void gCardAISpecialSummonChangePosition_080B7BB8(void);
extern void gCardAISpecialSummonChangePosition_080B82E8(void);
extern void gCardAISpecialSummonChangePosition_080B8B64(void);
extern void gCardAISpecialSummonChangePosition_080B8D6C(void);
extern void gCardAISpecialSummonChangePosition_080BABD4(void);
extern void gCardAISpecialSummonDamage_080B76E4(void);
extern void gCardAISpecialSummonDamage_080B9EB4(void);
extern void gCardAISpecialSummonDamage_080BA388(void);
extern void gCardAISpecialSummonDamage_080BA948(void);
extern void gCardAISpecialSummonDestroyAll_080B226C(void);
extern void gCardAISpecialSummonDestroyAll_080B23B4(void);
extern void gCardAISpecialSummonDestroyAll_080B9B7C(void);
extern void gCardAISpecialSummonDestroySpellTrap_080B8568(void);
extern void gCardAISpecialSummonDestroy_080B1C3C(void);
extern void gCardAISpecialSummonDestroy_080B2D38(void);
extern void gCardAISpecialSummonDestroy_080B4610(void);
extern void gCardAISpecialSummonDestroy_080BA628(void);
extern void gCardAISpecialSummonDiscard_080B1B24(void);
extern void gCardAISpecialSummonDiscard_080B2AFC(void);
extern void gCardAISpecialSummonDiscard_080B7744(void);
extern void gCardAISpecialSummonDiscard_080B8638(void);
extern void gCardAISpecialSummonDiscard_080BA1F0(void);
extern void gCardAISpecialSummonDiscard_080BA400(void);
extern void gCardAISpecialSummonDiscard_080BA450(void);
extern void gCardAISpecialSummonDiscard_080BABA8(void);
extern void gCardAISpecialSummonEquip_080B97B4(void);
extern void gCardAISpecialSummonFusionSummon_080B8500(void);
extern void gCardAISpecialSummonFusionSummon_080BAB1C(void);
extern void gCardAISpecialSummonFusion_080B9F08(void);
extern void gCardAISpecialSummonGraveyard_080B771C(void);
extern void gCardAISpecialSummonGraveyard_080B8BB8(void);
extern void gCardAISpecialSummonGraveyard_080B8C8C(void);
extern void gCardAISpecialSummonNegate_080B4204(void);
extern void gCardAISpecialSummonNegate_080BACFC(void);
extern void gCardAISpecialSummonPreventAttack_080B8C54(void);
extern void gCardAISpecialSummonPreventAttack_080B8E2C(void);
extern void gCardAISpecialSummonPreventAttack_080B9BF0(void);
extern void gCardAISpecialSummonPreventAttack_080B9EF0(void);
extern void gCardAISpecialSummonPreventAttack_080BACCC(void);
extern void gCardAISpecialSummonReturnToHand_080B7A68(void);
extern void gCardAISpecialSummonRevive_080B7B18(void);
extern void gCardAISpecialSummonRevive_080B9CDC(void);
extern void gCardAISpecialSummonRevive_080BA358(void);
extern void gCardAISpecialSummonRitualSummon_080BAA88(void);
extern void gCardAISpecialSummonSendToGY_080B1A74(void);
extern void gCardAISpecialSummonSendToGY_080B2B44(void);
extern void gCardAISpecialSummonSendToGY_080B2CE0(void);
extern void gCardAISpecialSummonSendToGY_080B8290(void);
extern void gCardAISpecialSummonSendToGY_080B8484(void);
extern void gCardAISpecialSummonSendToGY_080B9D28(void);
extern void gCardAISpecialSummonSendToGY_080B9E6C(void);
extern void gCardAISpecialSummonSendToGY_080BA53C(void);
extern void gCardAISpecialSummonSendToGY_080BA988(void);
extern void gCardAISpecialSummonSendToGY_080BA9A8(void);
extern void gCardAISpecialSummonSendToGY_080BA9F4(void);
extern void gCardAISpecialSummonSendToGY_080BAD10(void);
extern void gCardAISpecialSummonTribute_080B82B4(void);
extern void gCardAISpecialSummonTribute_080BAAE8(void);
extern void gCardAISpecialSummon_080B2AC8(void);
extern void gCardAISpecialSummon_080B83E4(void);
extern void gCardAISpecialSummon_080B8E68(void);
extern void gCardAISpecialSummon_080B9D70(void);
extern void gCardAIStandbyPhaseBattlePhase_080B2A98(void);
extern void gCardAIStandbyPhase_080B25F0(void);
extern void gCardAITakeControlChangePosition_080B8330(void);
extern void gCardAITakeControlChangePosition_080B91F8(void);
extern void gCardAITakeControlDestroy_080B8B38(void);
extern void gCardAITakeControlEndPhase_080B8720(void);
extern void gCardAITakeControlGainLP_080B8A84(void);
extern void gCardAITributeBattlePhase_080B885C(void);
extern void gCardAITribute_080B18E0(void);
extern void gCardAITribute_080B8A24(void);
extern void gCardAIUnknown_080B1900(void);
extern void gCardAIUnknown_080B2734(void);
extern void gCardAIUnknown_080B2B80(void);
extern void gCardAIUnknown_080B2C50(void);
extern void gCardAIUnknown_080B4820(void);
extern void gCardAIUnknown_080B77DC(void);
extern void gCardAIUnknown_080B7EB8(void);
extern void gCardAIUnknown_080B7F94(void);
extern void gCardAIUnknown_080B8004(void);

// gAIEffects  (222 entries)
const struct CardAIEffect gAIEffects[222] = {
//  KonamiId                                             pad  Effect
    { KONAMI_SAKURETSU_ARMOR                            , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_MAGIC_ARM_SHIELD                           , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_SHIFT                                      , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_DARK_SPIRIT_OF_THE_SILENT                  , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_WABOKU                                     , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_HALLOWED_LIFE_BARRIER                      , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_TRANSCENDENT_WINGS                         , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_THE_FLUTE_OF_SUMMONING_KURIBOH             , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_MIRROR_FORCE                               , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_DARK_MIRROR_FORCE                          , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_WIDESPREAD_RUIN                            , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_DES_COUNTERBLOW                            , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_FAIRY_BOX                                  , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_MIRROR_WALL                                , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_NEGATE_ATTACK                              , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_MAGIC_CYLINDER                             , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_DRAINING_SHIELD                            , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_ENCHANTED_JAVELIN                          , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_NIGHTMARE_WHEEL                            , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_SHADOW_SPELL                               , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_SPELLBINDING_CIRCLE                        , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_GRAVITY_BIND                               , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_WALL_OF_REVEALING_LIGHT                    , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_SCAPEGOAT                                  , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_SOUL_RESURRECTION                          , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_CALL_OF_THE_HAUNTED                        , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_ARCHFIEND_S_ROAR                           , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_MAGICAL_HATS                               , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_KUNAI_WITH_CHAIN                           , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_ORDEAL_OF_A_TRAVELER                       , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_JAM_DEFENDER                               , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_TOON_DEFENSE                               , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_ASTRAL_BARRIER                             , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_DE_FUSION                                  , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_BOOK_OF_MOON                               , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_COMPULSORY_EVACUATION_DEVICE               , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_MONSTER_RECOVERY                           , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_CURSE_OF_ANUBIS                            , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_ATTACK_REFLECTOR_UNIT                      , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_HERO_BARRIER                               , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_STAUNCH_DEFENDER                           , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_HERO_HEYRO                                 , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_CALAMITY_OF_THE_WICKED                     , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_DIMENSION_WALL                             , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_BEGONE_KNAVE                               , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_SPIRIT_BARRIER                             , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_METAL_REFLECT_SLIME                        , 0, gCardAIChangePositionDestroy_080B2EEC         },
    { KONAMI_GRACEFUL_DICE                              , 0, gCardAIBoostATKEndPhase_080B398C              },
    { KONAMI_SKULL_DICE                                 , 0, gCardAIBoostATKEndPhase_080B398C              },
    { KONAMI_REINFORCEMENTS                             , 0, gCardAIBoostATKEndPhase_080B398C              },
    { KONAMI_RUSH_RECKLESSLY                            , 0, gCardAIBoostATKEndPhase_080B398C              },
    { KONAMI_MASK_OF_WEAKNESS                           , 0, gCardAIBoostATKEndPhase_080B398C              },
    { KONAMI_CASTLE_WALLS                               , 0, gCardAIBoostATKEndPhase_080B398C              },
    { KONAMI_THE_RELIABLE_GUARDIAN                      , 0, gCardAIBoostATKEndPhase_080B398C              },
    { KONAMI_SNAKE_FANG                                 , 0, gCardAIBoostATKEndPhase_080B398C              },
    { KONAMI_DEAL_OF_PHANTOM                            , 0, gCardAIBoostATKEndPhase_080B398C              },
    { KONAMI_COLLAPSE                                   , 0, gCardAIBoostATKEndPhase_080B398C              },
    { KONAMI_THE_BIG_MARCH_OF_ANIMALS                   , 0, gCardAIBoostATKEndPhase_080B398C              },
    { KONAMI_BARK_OF_DARK_RULER                         , 0, gCardAIBoostATKEndPhase_080B398C              },
    { KONAMI_BLAST_WITH_CHAIN                           , 0, gCardAIBoostATKEndPhase_080B398C              },
    { KONAMI_RISING_ENERGY                              , 0, gCardAIBoostATKEndPhase_080B398C              },
    { KONAMI_UNITY                                      , 0, gCardAIBoostATKEndPhase_080B398C              },
    { KONAMI_ENERGY_DRAIN                               , 0, gCardAIBoostATKEndPhase_080B398C              },
    { KONAMI_PYRAMID_ENERGY                             , 0, gCardAIBoostATKEndPhase_080B398C              },
    { KONAMI_MICRO_RAY                                  , 0, gCardAIBoostATKEndPhase_080B398C              },
    { KONAMI_COVERING_FIRE                              , 0, gCardAIBoostATKEndPhase_080B398C              },
    { KONAMI_LIMITER_REMOVAL                            , 0, gCardAIBoostATKEndPhase_080B398C              },
    { KONAMI_SANGA_OF_THE_THUNDER                       , 0, gCardAIUnknown_080B1900                       },
    { KONAMI_KAZEJIN                                    , 0, gCardAIUnknown_080B1900                       },
    { KONAMI_SUIJIN                                     , 0, gCardAIUnknown_080B1900                       },
    { KONAMI_INJECTION_FAIRY_LILY                       , 0, gCardAIBoostATKDamage_080B193C                },
    { KONAMI_KURIBOH                                    , 0, gCardAIDiscardDamage_080B1998                 },
    { KONAMI_WINGED_KURIBOH_LV10                        , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_PINEAPPLE_BLAST                            , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_HOUSE_OF_ADHESIVE_TAPE                     , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_EATGABOON_NONE                             , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_TRAP_HOLE                                  , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_TRAGEDY                                    , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_DESROOK_ARCHFIEND                          , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_ADHESION_TRAP_HOLE                         , 0, gCardAISpecialSummon_080B2AC8                 },
    { KONAMI_NUMINOUS_HEALER                            , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_ATTACK_AND_RECEIVE                         , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_APPROPRIATE                                , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_FORCED_REQUISITION                         , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_SHADOW_OF_EYES                             , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_ROPE_OF_SPIRIT                             , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_SPIRIT_RYU                                 , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_CHTHONIAN_POLYMER                          , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_HIDDEN_SOLDIER                             , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_DESTRUCTION_PUNCH                          , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_CROSS_COUNTER                              , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_CLAY_CHARGE                                , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_NUTRIENT_Z                                 , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_DROP_OFF                                   , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_GUST                                       , 0, gCardAIDestroy_080B76A8                       },
    { KONAMI_DRIVING_SNOW                               , 0, gCardAIDestroy_080B76A8                       },
    { KONAMI_MICHIZURE                                  , 0, gCardAIDestroy_080B76A8                       },
    { KONAMI_MISPOLYMERIZATION                          , 0, gCardAIDestroyAll_080B7760                    },
    { KONAMI_ROPE_OF_LIFE                               , 0, gCardAISpecialSummonDiscard_080B1B24          },
    { KONAMI_TIME_MACHINE                               , 0, gCardAISpecialSummonSendToGY_080B1A74         },
    { KONAMI_SEBEK_S_BLESSING                           , 0, gCardAIGainLPDamage_080B1D24                  },
    { KONAMI_CHAIN_DESTRUCTION                          , 0, gCardAISpecialSummonDestroyAll_080B226C       },
    { KONAMI_CHAIN_DISAPPEARANCE                        , 0, gCardAISpecialSummonBanish_080B235C           },
    { KONAMI_BOTTOMLESS_TRAP_HOLE                       , 0, gCardAISpecialSummonBanish_080B235C           },
    { KONAMI_TORRENTIAL_TRIBUTE                         , 0, gCardAISpecialSummonDestroyAll_080B23B4       },
    { KONAMI_NON_AGGRESSION_AREA                        , 0, gCardAISpecialSummonDiscard_080B2AFC          },
    { KONAMI_MYSTICAL_SPACE_TYPHOON                     , 0, gCardAIDestroySpellTrap_080B1E18              },
    { KONAMI_DUST_TORNADO                               , 0, gCardAIDestroySpellTrapDamage_080B1E80        },
    { KONAMI_TOKEN_FEASTEVIL                            , 0, gCardAIDestroy_080B76A8                       },
    { KONAMI_TOKEN_THANKSGIVING                         , 0, gCardAIDestroy_080B76A8                       },
    { KONAMI_THUNDER_OF_RULER                           , 0, gCardAIStandbyPhaseBattlePhase_080B2A98       },
    { KONAMI_ULTIMATE_OFFERING                          , 0, gCardAIDestroySpecialSummon_080B2480          },
    { KONAMI_CURSE_OF_FIEND_NONE                        , 0, gCardAIChangePositionStandbyPhase_080B25D4    },
    { KONAMI_SOLOMON_S_LAWBOOK                          , 0, gCardAIStandbyPhase_080B25F0                  },
    { KONAMI_TAUNT                                      , 0, gCardAIUnknown_080B2B80                       },
    { KONAMI_GATEWAY_TO_DARK_WORLD                      , 0, gCardAISpecialSummonDestroy_080B2D38          },
    { KONAMI_SKULL_ZOMA                                 , 0, gCardAISpecialSummonDestroy_080B2D38          },
    { KONAMI_A_HERO_EMERGES                             , 0, gCardAISpecialSummonSendToGY_080B2B44         },
    { KONAMI_HERO_SIGNAL                                , 0, gCardAISpecialSummonGraveyard_080B771C        },
    { KONAMI_DAMAGE_CONDENSER                           , 0, gCardAISpecialSummonGraveyard_080B771C        },
    { KONAMI_INFERNO_RECKLESS_SUMMON                    , 0, gCardAISpecialSummonChangePosition_080B2EB0   },
    { KONAMI_THREATENING_ROAR                           , 0, gCardAIPreventAttack_080B2D98                 },
    { KONAMI_OPTION_HUNTER                              , 0, gCardAISendToGYDestroy_080B2E64               },
    { KONAMI_CHTHONIAN_BLAST                            , 0, gCardAISendToGYDestroy_080B2DCC               },
    { KONAMI_READY_FOR_INTERCEPTING                     , 0, gCardAIChangePosition_080B28F8                },
    { KONAMI_BOOK_OF_MOON                               , 0, gCardAIChangePosition_080B28F8                },
    { KONAMI_REVERSAL_OF_GRAVES                         , 0, gCardAIDamageGraveyard_080B27E4               },
    { KONAMI_EMBODIMENT_OF_APOPHIS                      , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_STRONGHOLD                                 , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_ROBBIN_GOBLIN                              , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_ROBBIN_ZOMBIE                              , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_BACKUP_SOLDIER                             , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_LIGHT_OF_INTERVENTION                      , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_GAMBLE                                     , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_TORNADO_WALL                               , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_DESTINY_BOARD                              , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_THE_FIRST_SARCOPHAGUS                      , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_SOLEMN_WISHES                              , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_RESPECT_PLAY                               , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_SKULL_INVITATION                           , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_CRUSH_CARD                                 , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_DECK_DEVASTATION_VIRUS                     , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_MAGICAL_THORN                              , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_MINOR_GOBLIN_OFFICIAL                      , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_LIGHTFORCE_SWORD                           , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_DNA_SURGERY                                , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_NEEDLE_WALL                                , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_VENGEFUL_BOG_SPIRIT                        , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_HUMAN_WAVE_TACTICS                         , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_LABYRINTH_OF_NIGHTMARE                     , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_BAD_REACTION_TO_SIMOCHI                    , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_SELF_DESTRUCT_BUTTON                       , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_HIDDEN_BOOK_OF_SPELL                       , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_MIND_WIPE                                  , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_FROZEN_SOUL                                , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_BACKFIRE                                   , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_PYRAMID_OF_LIGHT                           , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_THE_FORCES_OF_DARKNESS                     , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_LIFE_ABSORBING_MACHINE                     , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_INFERNO_TEMPEST                            , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_A_RIVAL_APPEARS                            , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_SPATIAL_COLLAPSE                           , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_RAY_OF_HOPE                                , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_TOWER_OF_BABEL                             , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_ANTI_SPELL_FRAGRANCE                       , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_FATAL_ABACUS                               , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_MIRACLE_RESTORING                          , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_ARSENAL_ROBBER                             , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_BLASTING_THE_RUINS                         , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_HEAVY_SLUMP                                , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_SIMULTANEOUS_LOSS                          , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_FIRE_DARTS                                 , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_MAGICAL_EXPLOSION                          , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_PIKERU_S_SECOND_SIGHT                      , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_ENERVATING_MIST                            , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_FINAL_ATTACK_ORDERS                        , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_RITE_OF_SPIRIT                             , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_TRAP_DUSTSHOOT                             , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_OMINOUS_FORTUNETELLING                     , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_ROCK_BOMBARDMENT                           , 0, gCardAISpecialSummonGraveyard_080B771C        },
    { KONAMI_A_DEAL_WITH_DARK_RULER                     , 0, gCardAISpecialSummonGraveyard_080B771C        },
    { KONAMI_MAGICIAN_S_CIRCLE                          , 0, gCardAISpecialSummonGraveyard_080B771C        },
    { KONAMI_ROLL_OUT                                   , 0, gCardAISpecialSummonGraveyard_080B771C        },
    { KONAMI_ACID_TRAP_HOLE                             , 0, gCardAIDestroy_080B76A8                       },
    { KONAMI_REALLY_ETERNAL_REST                        , 0, gCardAIDestroyAll_080B7760                    },
    { KONAMI_DISARMAMENT                                , 0, gCardAIDestroyAll_080B7760                    },
    { KONAMI_WEED_OUT                                   , 0, gCardAIDestroyAll_080B7760                    },
    { KONAMI_MAGICAL_DIMENSION                          , 0, gCardAISpecialSummonDestroy_080B1C3C          },
    { KONAMI_FIEND_COMEDIAN                             , 0, gCardAIBanishSendToGY_080B28AC                },
    { KONAMI_SKILL_DRAIN                                , 0, gCardAINegateDamage_080B1BF4                  },
    { KONAMI_TIME_SEAL                                  , 0, gCardAIUnknown_080B2734                       },
    { KONAMI_BATTLE_SCARRED                             , 0, gCardAIDestroyDamage_080B1FB8                 },
    { KONAMI_MASK_OF_RESTRICT                           , 0, gCardAITribute_080B18E0                       },
    { KONAMI_COLLECTED_POWER                            , 0, gCardAIDestroyEquip_080B19D0                  },
    { KONAMI_EARTHSHAKER_NONE                           , 0, gCardAIDestroy_080B1C80                       },
    { KONAMI_THE_REGULATION_OF_TRIBE                    , 0, gCardAIDestroyPreventAttack_080B1D74          },
    { KONAMI_BLIND_DESTRUCTION                          , 0, gCardAIDestroyAllStandbyPhase_080B1DD4        },
    { KONAMI_GRAVEROBBER_S_RETRIBUTION                  , 0, gCardAIBanishDamage_080B1E04                  },
    { KONAMI_RING_OF_DESTRUCTION                        , 0, gCardAIDestroyDamage_080B1EF0                 },
    { KONAMI_DESTRUCTION_RING                           , 0, gCardAIDestroyDamage_080B1FD4                 },
    { KONAMI_JUST_DESSERTS                              , 0, gCardAIDamage_080B2028                        },
    { KONAMI_GIFT_OF_THE_MYSTICAL_ELF                   , 0, gCardAIGainLP_080B207C                        },
    { KONAMI_CEMETARY_BOMB                              , 0, gCardAIDamage_080B2BB0                        },
    { KONAMI_SECRET_BARREL                              , 0, gCardAIDamage_080B2BB0                        },
    { KONAMI_SOLAR_RAY                                  , 0, gCardAIDamage_080B2BB0                        },
    { KONAMI_CEASEFIRE                                  , 0, gCardAIChangePositionBoostDEF_080B20D0        },
    { KONAMI_THE_SPELL_ABSORBING_LIFE                   , 0, gCardAIChangePositionBoostDEF_080B20D0        },
    { KONAMI_AQUA_CHORUS                                , 0, gCardAIBoostATKBoostDEF_080B21F8              },
    { KONAMI_TWO_PRONGED_ATTACK                         , 0, gCardAIDestroy_080B23D8                       },
    { KONAMI_SKULL_LAIR                                 , 0, gCardAIBanishDestroy_080B2694                 },
    { KONAMI_THE_EYE_OF_TRUTH                           , 0, gCardAIGainLPStandbyPhase_080B20B4            },
    { KONAMI_RAIGEKI_BREAK                              , 0, gCardAIDiscardDestroy_080B2A10                },
    { KONAMI_BURST_BREATH                               , 0, gCardAIDestroyAllTribute_080B29B4             },
    { KONAMI_PHOENIX_WING_WIND_BLAST                    , 0, gCardAIDiscardDestroy_080B2A10                },
    { KONAMI_KARMA_CUT                                  , 0, gCardAIBanishDiscard_080B2A54                 },
    { KONAMI_ASSAULT_ON_GHQ                             , 0, gCardAISendToGYDestroy_080B2C70               },
    { KONAMI_THE_LEAGUE_OF_UNIFORM_NOMENCLATURE         , 0, gCardAISpecialSummonSendToGY_080B2CE0         },
    { KONAMI_NEXT_TO_BE_LOST                            , 0, gCardAISpecialSummonSendToGY_080B2CE0         },
    { KONAMI_MIND_HAXORZ                                , 0, gCardAIDestroySpellTrapDamage_080B1E80        },
    { KONAMI_MALICE_DISPERSION                          , 0, gCardAIDiscardDestroyAll_080B2C10             },
    { KONAMI_SPELL_PURIFICATION                         , 0, gCardAIDiscardDestroyAll_080B2C10             },
    { KONAMI_XING_ZHEN_HU                               , 0, gCardAIUnknown_080B2C50                       },
};

// gAIEffects2  (69 entries)
const struct CardAIEffect gAIEffects2[69] = {
//  KonamiId                                             pad  Effect
    { KONAMI_WHITE_HOLE_NONE                            , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_ANTI_RAIGEKI_NONE                          , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_CALL_OF_THE_GRAVE_NONE                     , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_GRYPHON_WING_NONE                          , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_FAKE_TRAP_NONE                             , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_BIG_BURN                                   , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_BLUE_EYES_SHINING_DRAGON                   , 0, gCardAINegateDestroy_080B4098                 },
    { KONAMI_HORUS_THE_BLACK_FLAME_DRAGON_LV8           , 0, gCardAINegateDestroy_080B4098                 },
    { KONAMI_SORCERER_OF_DARK_MAGIC                     , 0, gCardAINegateDestroy_080B4098                 },
    { KONAMI_DARK_BALTER_THE_TERRIBLE                   , 0, gCardAINegateDestroy_080B4098                 },
    { KONAMI_RYU_SENSHI                                 , 0, gCardAINegateDestroy_080B4098                 },
    { KONAMI_MYSTICAL_SPACE_TYPHOON                     , 0, gCardAIDestroySpellTrap_080B4728              },
    { KONAMI_DUST_TORNADO                               , 0, gCardAIDestroySpellTrap_080B4728              },
    { KONAMI_GRAVEROBBER                                , 0, gCardAIGraveyard_080B3FA8                     },
    { KONAMI_DISAPPEAR                                  , 0, gCardAIBanishGraveyard_080B4030               },
    { KONAMI_JAR_ROBBER                                 , 0, gCardAINegateDestroy_080B40B8                 },
    { KONAMI_FEATHER_WIND                               , 0, gCardAINegateDestroy_080B40B8                 },
    { KONAMI_RIRYOKU_FIELD                              , 0, gCardAINegateDestroy_080B40B8                 },
    { KONAMI_TUTAN_MASK                                 , 0, gCardAINegateDestroy_080B40B8                 },
    { KONAMI_TRAP_JAMMER                                , 0, gCardAINegateDestroy_080B40B8                 },
    { KONAMI_ARMOR_BREAK                                , 0, gCardAINegateDestroy_080B40B8                 },
    { KONAMI_SPELL_STOPPING_STATUTE                     , 0, gCardAINegateDestroy_080B40B8                 },
    { KONAMI_ROYAL_SURRENDER                            , 0, gCardAINegateDestroy_080B40B8                 },
    { KONAMI_WORLD_SUPPRESSION_NONE                     , 0, gCardAINegateDestroy_080B40B8                 },
    { KONAMI_CURSE_OF_ROYAL                             , 0, gCardAINegateDestroy_080B40B8                 },
    { KONAMI_IMPERIAL_ORDER                             , 0, gCardAINegateDestroy_080B41B4                 },
    { KONAMI_ROYAL_DECREE                               , 0, gCardAINegate_080B41DC                        },
    { KONAMI_MARYOKUTAI                                 , 0, gCardAINegateDestroy_080B40B8                 },
    { KONAMI_A_TEAM_TRAP_DISPOSAL_UNIT                  , 0, gCardAINegateDestroy_080B40B8                 },
    { KONAMI_JUDGMENT_OF_ANUBIS                         , 0, gCardAINegateDestroy_080B40B8                 },
    { KONAMI_DARK_PALADIN                               , 0, gCardAINegateDestroy_080B40D8                 },
    { KONAMI_ALKANA_KNIGHT_JOKER                        , 0, gCardAINegateDestroy_080B40D8                 },
    { KONAMI_MAGIC_DRAIN                                , 0, gCardAINegateDestroy_080B40B8                 },
    { KONAMI_MAGIC_JAMMER                               , 0, gCardAINegateDestroy_080B40D8                 },
    { KONAMI_SEVEN_TOOLS_OF_THE_BANDIT                  , 0, gCardAINegateDestroy_080B40D8                 },
    { KONAMI_SPELL_VANISHING                            , 0, gCardAINegateDestroy_080B40B8                 },
    { KONAMI_CURSED_SEAL_OF_THE_FORBIDDEN_SPELL         , 0, gCardAINegateDestroy_080B40B8                 },
    { KONAMI_SPELL_SHIELD_TYPE_8                        , 0, gCardAINegateDestroy_080B40D8                 },
    { KONAMI_THE_DRAGON_S_BEAD                          , 0, gCardAINegateDestroy_080B40D8                 },
    { KONAMI_DIVINE_WRATH                               , 0, gCardAINegateDiscard_080B4930                 },
    { KONAMI_SOLEMN_JUDGMENT                            , 0, gCardAISpecialSummonNegate_080B4204           },
    { KONAMI_GOBLIN_OUT_OF_THE_FRYING_PAN               , 0, gCardAINegateDamage_080B4240                  },
    { KONAMI_MALFUNCTION                                , 0, gCardAINegateDamage_080B4240                  },
    { KONAMI_DARK_DEAL                                  , 0, gCardAIDiscardDamage_080B4280                 },
    { KONAMI_RARE_METALMORPH                            , 0, gCardAINegateDestroy_080B4304                 },
    { KONAMI_READY_FOR_INTERCEPTING                     , 0, gCardAIChangePosition_080B4464                },
    { KONAMI_BOOK_OF_MOON                               , 0, gCardAIChangePosition_080B4464                },
    { KONAMI_PIKERU_S_CIRCLE_OF_ENCHANTMENT             , 0, gCardAIDiscardEndPhase_080B4970               },
    { KONAMI_HALLOWED_LIFE_BARRIER                      , 0, gCardAIDiscardEndPhase_080B4970               },
    { KONAMI_EMERGENCY_PROVISIONS                       , 0, gCardAISendToGYGainLP_080B4378                },
    { KONAMI_OJAMA_TRIO                                 , 0, gCardAISpecialSummonDestroy_080B4610          },
    { KONAMI_SERIAL_SPELL                               , 0, gCardAIDiscardGraveyard_080B4678              },
    { KONAMI_FORMATION_UNION                            , 0, gCardAISpecialSummonChangePosition_080B4518   },
    { KONAMI_REINFORCEMENTS                             , 0, gCardAIBoostATKBoostDEF_080B47F4              },
    { KONAMI_CASTLE_WALLS                               , 0, gCardAIBoostATKBoostDEF_080B47F4              },
    { KONAMI_RUSH_RECKLESSLY                            , 0, gCardAIBoostATKBoostDEF_080B47F4              },
    { KONAMI_THE_RELIABLE_GUARDIAN                      , 0, gCardAIBoostATKBoostDEF_080B47F4              },
    { KONAMI_SNAKE_FANG                                 , 0, gCardAIUnknown_080B4820                       },
    { KONAMI_GRACEFUL_DICE                              , 0, gCardAIDrawSpecialSummon_080B46CC             },
    { KONAMI_SKULL_DICE                                 , 0, gCardAIDrawSpecialSummon_080B46CC             },
    { KONAMI_JAR_OF_GREED                               , 0, gCardAIDrawSpecialSummon_080B46CC             },
    { KONAMI_RECKLESS_GREED                             , 0, gCardAIDrawSpecialSummon_080B46CC             },
    { KONAMI_CORPSE_OF_YATA_GARASU                      , 0, gCardAIDrawSpecialSummon_080B46CC             },
    { KONAMI_TIME_SEAL                                  , 0, gCardAIDrawSpecialSummon_080B46CC             },
    { KONAMI_SCAPEGOAT                                  , 0, gCardAIDrawSpecialSummon_080B46CC             },
    { KONAMI_WABOKU                                     , 0, gCardAIDrawSpecialSummon_080B46CC             },
    { KONAMI_HERO_BARRIER                               , 0, gCardAIDrawSpecialSummon_080B46CC             },
    { KONAMI_THE_FLUTE_OF_SUMMONING_KURIBOH             , 0, gCardAISearchSpecialSummon_080B4850           },
    { KONAMI_INTERDIMENSIONAL_MATTER_TRANSPORTER        , 0, gCardAIBanishEndPhase_080B4878                },
};

// gAIEffects3  (57 entries)
const struct CardAIEffect gAIEffects3[57] = {
//  KonamiId                                             pad  Effect
    { KONAMI_COLD_WAVE                                  , 0, gCardAIUnknown_080B77DC                       },
    { KONAMI_HARPIE_S_FEATHER_DUSTER                    , 0, gCardAIDestroySpellTrap_080B7838              },
    { KONAMI_HEAVY_STORM                                , 0, gCardAIDestroySpellTrapDestroyAll_080B7934    },
    { KONAMI_DE_SPELL                                   , 0, gCardAIDestroy_080B76A8                       },
    { KONAMI_REMOVE_TRAP                                , 0, gCardAIDestroy_080B76A8                       },
    { KONAMI_BAIT_DOLL                                  , 0, gCardAIDestroy_080B76A8                       },
    { KONAMI_MYSTICAL_SPACE_TYPHOON                     , 0, gCardAIDestroySpellTrap_080B7858              },
    { KONAMI_DUST_TORNADO                               , 0, gCardAIDestroySpellTrap_080B7858              },
    { KONAMI_GIANT_TRUNADE                              , 0, gCardAIReturnToHand_080B7878                  },
    { KONAMI_NOBLEMAN_OF_CROSSOUT                       , 0, gCardAIDestroy_080B76A8                       },
    { KONAMI_NOBLEMAN_OF_EXTERMINATION                  , 0, gCardAIDestroy_080B76A8                       },
    { KONAMI_MOOYAN_CURRY                               , 0, gCardAIGainLP_080B777C                        },
    { KONAMI_RED_MEDICINE                               , 0, gCardAIGainLP_080B777C                        },
    { KONAMI_GOBLIN_S_SECRET_REMEDY                     , 0, gCardAIGainLP_080B777C                        },
    { KONAMI_SOUL_OF_THE_PURE                           , 0, gCardAIGainLP_080B777C                        },
    { KONAMI_DIAN_KETO_THE_CURE_MASTER                  , 0, gCardAIGainLP_080B777C                        },
    { KONAMI_BLUE_MEDICINE_NONE                         , 0, gCardAIGainLP_080B777C                        },
    { KONAMI_GOBLIN_THIEF                               , 0, gCardAIGainLP_080B777C                        },
    { KONAMI_RAIN_OF_MERCY                              , 0, gCardAIGainLP_080B777C                        },
    { KONAMI_POISON_OF_THE_OLD_MAN                      , 0, gCardAIGainLP_080B777C                        },
    { KONAMI_DARK_ROOM_OF_NIGHTMARE                     , 0, gCardAISpecialSummonDamage_080B76E4           },
    { KONAMI_METEOR_OF_DESTRUCTION                      , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_TREMENDOUS_FIRE                            , 0, gCardAIDamage_080B77F8                        },
    { KONAMI_OOKAZI                                     , 0, gCardAIDamage_080B778C                        },
    { KONAMI_FINAL_FLAME_NONE                           , 0, gCardAIDamage_080B778C                        },
    { KONAMI_SPARKS                                     , 0, gCardAIDamage_080B778C                        },
    { KONAMI_HINOTAMA_NONE                              , 0, gCardAIDamage_080B778C                        },
    { KONAMI_RAIMEI_NONE                                , 0, gCardAIDamage_080B778C                        },
    { KONAMI_METEOR_OF_DESTRUCTION                      , 0, gCardAIDamage_080B778C                        },
    { KONAMI_CONFISCATION                               , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_DELINQUENT_DUO                             , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_THE_FORCEFUL_SENTRY                        , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_LIGHTFORCE_SWORD                           , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_REASONING                                  , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_ENCHANTING_FITTING_ROOM                    , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_RED_EYES_B_CHICK                           , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_THUNDER_DRAGON                             , 0, gCardAISearchDiscard_080BA708                 },
    { KONAMI_KING_OF_THE_SWAMP                          , 0, gCardAISearchDiscard_080BA71C                 },
    { KONAMI_PAINFUL_CHOICE                             , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_SOUL_RELEASE                               , 0, gCardAIBanishGraveyard_080B7CD8               },
    { KONAMI_WINDSTORM_OF_ETAQUA                        , 0, gCardAIChangePosition_080B7D6C                },
    { KONAMI_COST_DOWN                                  , 0, gCardAIDiscardEndPhase_080B88C4               },
    { KONAMI_TOON_WORLD                                 , 0, gCardAIDamage_080B7E2C                        },
    { KONAMI_TERRAFORMING                               , 0, gCardAISpecialSummonGraveyard_080B771C        },
    { KONAMI_FUSHIOH_RICHIE                             , 0, gCardAISpecialSummonGraveyard_080B771C        },
    { KONAMI_METALMORPH                                 , 0, gCardAIBoostATKBoostDEF_080B95A4              },
    { KONAMI_BANNER_OF_COURAGE                          , 0, gCardAISpecialSummonDamage_080B76E4           },
    { KONAMI_KISHIDO_SPIRIT                             , 0, gCardAISpecialSummonDamage_080B76E4           },
    { KONAMI_POISON_FANGS                               , 0, gCardAISpecialSummonDamage_080B76E4           },
    { KONAMI_SECOND_COIN_TOSS                           , 0, gCardAISpecialSummonDamage_080B76E4           },
    { KONAMI_CARD_OF_SAFE_RETURN                        , 0, gCardAISpecialSummonDamage_080B76E4           },
    { KONAMI_CATHEDRAL_OF_NOBLES                        , 0, gCardAISearchSpecialSummon_080B8398           },
    { KONAMI_THE_A_FORCES                               , 0, gCardAISpecialSummonDamage_080B76E4           },
    { KONAMI_SPELL_ABSORPTION                           , 0, gCardAISpecialSummonDamage_080B76E4           },
    { KONAMI_SPELL_ECONOMICS                            , 0, gCardAISpecialSummonDamage_080B76E4           },
    { KONAMI_SOUL_ABSORPTION                            , 0, gCardAISpecialSummonDamage_080B76E4           },
    { KONAMI_SAMSARA                                    , 0, gCardAISpecialSummonDamage_080B76E4           },
};

// gAIEffects4  (165 entries)
const struct CardAIEffect gAIEffects4[165] = {
//  KonamiId                                             pad  Effect
    { KONAMI_GRACEFUL_CHARITY                           , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_FUSION_SAGE                                , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_SIXTH_SENSE                                , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_RECKLESS_GREED                             , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_DARK_PIERCING_LIGHT                        , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_WARRIOR_ELIMINATION_NONE                   , 0, gCardAIDestroyAll_080B7760                    },
    { KONAMI_ETERNAL_REST                               , 0, gCardAIDestroyAll_080B7760                    },
    { KONAMI_ACID_RAIN_NONE                             , 0, gCardAIDestroyAll_080B7760                    },
    { KONAMI_ERADICATING_AEROSOL_NONE                   , 0, gCardAIDestroyAll_080B7760                    },
    { KONAMI_BREATH_OF_LIGHT_NONE                       , 0, gCardAIDestroyAll_080B7760                    },
    { KONAMI_ETERNAL_DROUGHT_NONE                       , 0, gCardAIDestroyAll_080B7760                    },
    { KONAMI_LAST_DAY_OF_WITCH_NONE                     , 0, gCardAIDestroyAll_080B7760                    },
    { KONAMI_EXILE_OF_THE_WICKED_NONE                   , 0, gCardAIDestroyAll_080B7760                    },
    { KONAMI_SPECIAL_HURRICANE                          , 0, gCardAISpecialSummonDiscard_080B8638          },
    { KONAMI_RAIGEKI                                    , 0, gCardAIDestroyAllDiscard_080B8658             },
    { KONAMI_LIGHTNING_VORTEX                           , 0, gCardAIDestroyAllDiscard_080B8658             },
    { KONAMI_DARK_HOLE                                  , 0, gCardAIDestroyAll_080B860C                    },
    { KONAMI_ENCHANTED_ARROW                            , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_CHANGE_OF_HEART                            , 0, gCardAITakeControlEndPhase_080B8720           },
    { KONAMI_BRAIN_CONTROL                              , 0, gCardAITakeControlEndPhase_080B8720           },
    { KONAMI_RESHEF_THE_DARK_BEING                      , 0, gCardAITakeControlEndPhase_080B8720           },
    { KONAMI_SOUL_EXCHANGE                              , 0, gCardAITributeBattlePhase_080B885C            },
    { KONAMI_SNATCH_STEAL                               , 0, gCardAITakeControlGainLP_080B8A84             },
    { KONAMI_FALLING_DOWN                               , 0, gCardAITakeControlDestroy_080B8B38            },
    { KONAMI_MIND_CONTROL                               , 0, gCardAISpecialSummonChangePosition_080B8B64   },
    { KONAMI_DRAGON_S_GUNFIRE                           , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_HAMMER_SHOT                                , 0, gCardAIDestroyChangePosition_080B8698         },
    { KONAMI_TRIBUTE_TO_THE_DOOMED                      , 0, gCardAIDestroy_080B76A8                       },
    { KONAMI_OFFERINGS_TO_THE_DOOMED                    , 0, gCardAIDestroy_080B76A8                       },
    { KONAMI_SHIELD_CRASH                               , 0, gCardAIDestroy_080B76A8                       },
    { KONAMI_DARK_WORLD_LIGHTNING                       , 0, gCardAIDestroy_080B76A8                       },
    { KONAMI_SOUL_TAKER                                 , 0, gCardAIDestroy_080B76A8                       },
    { KONAMI_SHARE_THE_PAIN                             , 0, gCardAITribute_080B8A24                       },
    { KONAMI_SMASHING_GROUND                            , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_FISSURE                                    , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_MYSTIC_BOX                                 , 0, gCardAIDestroy_080B8A54                       },
    { KONAMI_DARK_CORE                                  , 0, gCardAIDiscard_080BA914                       },
    { KONAMI_BACK_TO_SQUARE_ONE                         , 0, gCardAIDiscard_080BA914                       },
    { KONAMI_BATTERY_CHARGER                            , 0, gCardAISpecialSummonDamage_080BA948           },
    { KONAMI_MONSTER_REBORN                             , 0, gCardAISpecialSummonGraveyard_080B8BB8        },
    { KONAMI_SILENT_FIEND                               , 0, gCardAISpecialSummonPreventAttack_080B8C54    },
    { KONAMI_PREMATURE_BURIAL                           , 0, gCardAISpecialSummonGraveyard_080B8C8C        },
    { KONAMI_CALL_OF_THE_HAUNTED                        , 0, gCardAISpecialSummonGraveyard_080B8C8C        },
    { KONAMI_BOOK_OF_LIFE                               , 0, gCardAISpecialSummonGraveyard_080B8C8C        },
    { KONAMI_AUTONOMOUS_ACTION_UNIT                     , 0, gCardAISpecialSummonGraveyard_080B8C8C        },
    { KONAMI_SILENT_FIEND                               , 0, gCardAISpecialSummonGraveyard_080B8C8C        },
    { KONAMI_FULFILLMENT_OF_THE_CONTRACT                , 0, gCardAISpecialSummonGraveyard_080B8C8C        },
    { KONAMI_RE_FUSION                                  , 0, gCardAISpecialSummonGraveyard_080B8C8C        },
    { KONAMI_SYMBOL_OF_HERITAGE                         , 0, gCardAISpecialSummonGraveyard_080B8C8C        },
    { KONAMI_THE_SHALLOW_GRAVE                          , 0, gCardAISpecialSummonChangePosition_080B8D6C   },
    { KONAMI_TRIBUTE_DOLL                               , 0, gCardAISpecialSummonPreventAttack_080B8E2C    },
    { KONAMI_DARK_MAGIC_CURTAIN                         , 0, gCardAISpecialSummon_080B8E68                 },
    { KONAMI_FIEND_S_SANCTUARY                          , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_DIMENSION_FUSION                           , 0, gCardAISpecialSummonBanish_080B9ABC           },
    { KONAMI_RETURN_FROM_THE_DIFFERENT_DIMENSION        , 0, gCardAISpecialSummonBanish_080B9ABC           },
    { KONAMI_LEVEL_MODULATION                           , 0, gCardAISpecialSummonPreventAttack_080B9BF0    },
    { KONAMI_GRAVEROBBER                                , 0, gCardAIGraveyard_080B8EAC                     },
    { KONAMI_PHOTON_GENERATOR_UNIT                      , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_WAR_LION_RITUAL                            , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_ZERA_RITUAL                                , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_BLACK_LUSTER_RITUAL                        , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_BEASTLY_MIRROR_RITUAL                      , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_COMMENCEMENT_DANCE                         , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_HAMBURGER_RECIPE                           , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_NOVOX_S_PRAYER                             , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_RESURRECTION_OF_CHAKRA                     , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_TURTLE_OATH                                , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_GARMA_SWORD_OATH                           , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_JAVELIN_BEETLE_PACT                        , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_FORTRESS_WHALE_S_OATH                      , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_REVIVAL_OF_DOKURORIDER                     , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_DARK_MAGIC_RITUAL                          , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_BLACK_ILLUSION_RITUAL                      , 0, gCardAIRitualSummonTribute_080B85B0           },
    { KONAMI_CURSE_OF_THE_MASKED_BEAST                  , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_WHITE_DRAGON_RITUAL                        , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_SHINATO_S_ARK                              , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_INCANDESCENT_ORDEAL                        , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_CONTRACT_WITH_THE_DARK_MASTER              , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_DORIADO_S_BLESSING                         , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_FINAL_RITUAL_OF_THE_ANCIENTS               , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_CONTRACT_WITH_THE_ABYSS                    , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_EARTH_CHANT                                , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_END_OF_THE_WORLD                           , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_MEGAMORPH                                  , 0, gCardAIReduceATKEquip_080B9514                },
    { KONAMI_LEGENDARY_SWORD_NONE                       , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_SWORD_OF_DARK_DESTRUCTION_NONE             , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_DARK_ENERGY_NONE                           , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_AXE_OF_DESPAIR                             , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_LASER_CANNON_ARMOR_NONE                    , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_INSECT_ARMOR_WITH_LASER_CANNON             , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_ELF_S_LIGHT_NONE                           , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_BEAST_FANGS_NONE                           , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_STEEL_SHELL_NONE                           , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_VILE_GERMS_NONE                            , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_BLACK_PENDANT                              , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_SILVER_BOW_AND_ARROW_NONE                  , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_HORN_OF_LIGHT                              , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_HORN_OF_THE_UNICORN                        , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_DRAGON_TREASURE_NONE                       , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_ELECTRO_WHIP_NONE                          , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_CYBER_SHIELD_NONE                          , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_MYSTICAL_MOON_NONE                         , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_MALEVOLENT_NUZZLER                         , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_VIOLET_CRYSTAL_NONE                        , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_BOOK_OF_SECRET_ARTS_NONE                   , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_INVIGORATION_NONE                          , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_MACHINE_CONVERSION_FACTORY_NONE            , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_RAISE_BODY_HEAT_NONE                       , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_FOLLOW_WIND_NONE                           , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_POWER_OF_KAISHIN_NONE                      , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_SALAMANDRA                                 , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_METALMORPH                                 , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_BRIGHT_CASTLE                              , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_7_COMPLETED_NONE                           , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_BURNING_SPEAR_NONE                         , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_GUST_FAN_NONE                              , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_SWORD_OF_DEEP_SEATED                       , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_STIM_PACK                                  , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_SWORD_OF_DRAGON_S_SOUL                     , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_MASK_OF_BRUTALITY                          , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_LIGHTNING_BLADE                            , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_UNITED_WE_STAND                            , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_MAGE_POWER                                 , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_DARK_MAGICIAN_S_TOME_OF_BLACK_MAGIC        , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_CYCLON_LASER                               , 0, gCardAIEquip_080B978C                         },
    { KONAMI_DRAGONIC_ATTACK_NONE                       , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_BIG_BANG_SHOT                              , 0, gCardAIEquip_080B978C                         },
    { KONAMI_BUTTERFLY_DAGGER_ELMA                      , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_SHOOTING_STAR_BOW_CEAL                     , 0, gCardAIEquip_080B978C                         },
    { KONAMI_GRAVITY_AXE_GRARL                          , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_WICKED_BREAKING_FLAMBERGE_BAOU             , 0, gCardAIEquip_080B978C                         },
    { KONAMI_FUSION_WEAPON                              , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_RITUAL_WEAPON                              , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_SCROLL_OF_BEWITCHMENT                      , 0, gCardAIEquip_080B978C                         },
    { KONAMI_CESTUS_OF_DAGLA                            , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_FUSION_SWORD_MURASAME_BLADE                , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_DIVINE_SWORD_PHOENIX_BLADE                 , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_MISTOBODY                                  , 0, gCardAIEquip_080B978C                         },
    { KONAMI_ARMED_CHANGER                              , 0, gCardAIEquip_080B978C                         },
    { KONAMI_NECKLACE_OF_COMMAND                        , 0, gCardAIEquipSendToGY_080B9770                 },
    { KONAMI_HEART_OF_CLEAR_WATER                       , 0, gCardAIDestroyEquip_080B981C                  },
    { KONAMI_BLAST_WITH_CHAIN                           , 0, gCardAIDestroyBoostATK_080B96C4               },
    { KONAMI_OPTI_CAMOUFLAGE_ARMOR                      , 0, gCardAIEquip_080B978C                         },
    { KONAMI_ROD_OF_SILENCE_KAY_EST                     , 0, gCardAIEquip_080B978C                         },
    { KONAMI_RIRYOKU                                    , 0, gCardAIBoostATKReduceATK_080B98BC             },
    { KONAMI_REVERSE_TRAP                               , 0, gCardAIBoostATKReduceATK_080B9310             },
    { KONAMI_REINFORCEMENT_OF_THE_ARMY                  , 0, gCardAISpecialSummonGraveyard_080B771C        },
    { KONAMI_THE_WARRIOR_RETURNING_ALIVE                , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_CURSE_OF_ANUBIS                            , 0, gCardAIChangePosition_080B9090                },
    { KONAMI_BLOCK_ATTACK                               , 0, gCardAIChangePositionDestroy_080B90D0         },
    { KONAMI_B_E_S_CRYSTAL_CORE                         , 0, gCardAIChangePositionDestroy_080B90D0         },
    { KONAMI_STOP_DEFENSE                               , 0, gCardAIChangePosition_080B8F68                },
    { KONAMI_ENEMY_CONTROLLER                           , 0, gCardAITakeControlChangePosition_080B91F8     },
    { KONAMI_SHIELD_SWORD                               , 0, gCardAIEndPhase_080B9398                      },
    { KONAMI_CARD_DESTRUCTION                           , 0, gCardAIDrawDiscard_080B93F0                   },
    { KONAMI_EXCHANGE                                   , 0, gCardAISearchSendToGY_080B94FC                },
    { KONAMI_SPIRITUALISM                               , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_FINAL_DESTINY                              , 0, gCardAIDiscardDestroyAll_080B870C             },
    { KONAMI_BIG_WAVE_SMALL_WAVE                        , 0, gCardAISpecialSummonDestroyAll_080B9B7C       },
    { KONAMI_BECKONING_LIGHT                            , 0, gCardAISearchDiscard_080B9BB8                 },
    { KONAMI_MAGICAL_MALLET                             , 0, gCardAIDraw_080B99B0                          },
    { KONAMI_RELOAD                                     , 0, gCardAIDrawDiscard_080B98F0                   },
    { KONAMI_DRAGGED_DOWN_INTO_THE_GRAVE                , 0, gCardAIDrawDiscard_080B98F0                   },
    { KONAMI_A_FEATHER_OF_THE_PHOENIX                   , 0, gCardAIGraveyardSearch_080B95C8               },
    { KONAMI_SPELL_REPRODUCTION                         , 0, gCardAIGraveyardSearch_080B95C8               },
};

// gAIEffects5  (3 entries)
const struct CardAIEffect gAIEffects5[3] = {
//  KonamiId                                             pad  Effect
    { KONAMI_WILD_NATURE_S_RELEASE                      , 0, gCardAIDestroyBoostATK_080B79F8               },
    { KONAMI_METEORAIN                                  , 0, gCardAIDamageChangePosition_080B7A48          },
    { KONAMI_DRAGON_S_RAGE                              , 0, gCardAIDamageChangePosition_080B7A48          },
};

// gAIEffects6  (5 entries)
const struct CardAIEffect gAIEffects6[5] = {
//  KonamiId                                             pad  Effect
    { KONAMI_COMBINATION_ATTACK                         , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_CONSCRIPTION                               , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_DE_FUSION                                  , 0, gCardAISpecialSummonChangePosition_080B7BB8   },
    { KONAMI_BEAST_SOUL_SWAP                            , 0, gCardAISpecialSummonReturnToHand_080B7A68     },
    { KONAMI_SPIRITUAL_EARTH_ART_KUROGANE               , 0, gCardAISpecialSummonRevive_080B7B18           },
};

// gAIEffects7  (207 entries)
const struct CardAIEffect gAIEffects7[207] = {
//  KonamiId                                             pad  Effect
    { KONAMI_MOOYAN_CURRY                               , 0, gCardAIGainLP_080B777C                        },
    { KONAMI_RED_MEDICINE                               , 0, gCardAIGainLP_080B777C                        },
    { KONAMI_GOBLIN_S_SECRET_REMEDY                     , 0, gCardAIGainLP_080B777C                        },
    { KONAMI_SOUL_OF_THE_PURE                           , 0, gCardAIGainLP_080B777C                        },
    { KONAMI_DIAN_KETO_THE_CURE_MASTER                  , 0, gCardAIGainLP_080B777C                        },
    { KONAMI_BLUE_MEDICINE_NONE                         , 0, gCardAIGainLP_080B777C                        },
    { KONAMI_RAIN_OF_MERCY                              , 0, gCardAIGainLP_080B777C                        },
    { KONAMI_POISON_OF_THE_OLD_MAN                      , 0, gCardAIGainLP_080B777C                        },
    { KONAMI_POT_OF_GREED                               , 0, gCardAIDrawGraveyard_080B9C28                 },
    { KONAMI_POT_OF_AVARICE                             , 0, gCardAIDrawGraveyard_080B9C28                 },
    { KONAMI_UPSTART_GOBLIN                             , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_JAR_OF_GREED                               , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_CORPSE_OF_YATA_GARASU                      , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_THE_FLUTE_OF_SUMMONING_DRAGON              , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_BURST_STREAM_OF_DESTRUCTION                , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_THOUSAND_KNIVES                            , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_DARK_MAGIC_ATTACK                          , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_OJAMA_DELTA_HURRICANE                      , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_DES_CROAKING                               , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_ELEGANT_EGOTIST                            , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_CONTRACT_WITH_EXODIA                       , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_SALVAGE                                    , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_DARK_FACTORY_OF_MASS_PRODUCTION            , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_SOUL_REVERSAL                              , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_FAIRY_OF_THE_SPRING                        , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_MEGA_TON_MAGICAL_CANNON                    , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_FENGSHENG_MIRROR                           , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_HUGE_REVOLUTION                            , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_EMBLEM_OF_DRAGON_DESTROYER                 , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_DEDICATION_THROUGH_LIGHT_AND_DARKNESS      , 0, gCardAISpecialSummonGraveyard_080B771C        },
    { KONAMI_RELEASE_RESTRAINT                          , 0, gCardAISpecialSummonGraveyard_080B771C        },
    { KONAMI_SAGE_S_STONE                               , 0, gCardAISpecialSummonGraveyard_080B771C        },
    { KONAMI_PALADIN_OF_WHITE_DRAGON                    , 0, gCardAISpecialSummonGraveyard_080B771C        },
    { KONAMI_GREAT_DEZARD                               , 0, gCardAISpecialSummonGraveyard_080B771C        },
    { KONAMI_BONDING_H2O                                , 0, gCardAISpecialSummonGraveyard_080B771C        },
    { KONAMI_GATHER_YOUR_MIND                           , 0, gCardAISpecialSummonGraveyard_080B771C        },
    { KONAMI_MULTIPLY                                   , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_THE_GRAVEYARD_IN_THE_FOURTH_DIMENSION      , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_THE_CREATOR                                , 0, gCardAISpecialSummonDiscard_080B7744          },
    { KONAMI_STAMPING_DESTRUCTION                       , 0, gCardAIDestroy_080B76A8                       },
    { KONAMI_FLINT                                      , 0, gCardAIEquipPreventAttack_080B9868            },
    { KONAMI_NITRO_UNIT                                 , 0, gCardAIEquipPreventAttack_080B9868            },
    { KONAMI_RESCUE_CAT                                 , 0, gCardAISpecialSummonSendToGY_080B9D28         },
    { KONAMI_KNIGHT_S_TITLE                             , 0, gCardAISpecialSummonRevive_080B9CDC           },
    { KONAMI_MAKIU                                      , 0, gCardAIDestroyBattlePhase_080B9C50            },
    { KONAMI_INFERNO_FIRE_BLAST                         , 0, gCardAIDamagePreventAttack_080B9D08           },
    { KONAMI_THOUSAND_ENERGY                            , 0, gCardAIEndPhaseDestroyAll_080B9D50            },
    { KONAMI_TRIANGLE_POWER                             , 0, gCardAIEndPhaseDestroyAll_080B9D50            },
    { KONAMI_TRIANGLE_ECSTASY_SPARK                     , 0, gCardAIEndPhaseDestroyAll_080B9D50            },
    { KONAMI_FRONTLINE_BASE                             , 0, gCardAISpecialSummonDamage_080B76E4           },
    { KONAMI_CALL_OF_THE_MUMMY                          , 0, gCardAISpecialSummon_080B9D70                 },
    { KONAMI_CATHEDRAL_OF_NOBLES                        , 0, gCardAISearchSpecialSummon_080B8398           },
    { KONAMI_MAGICAL_LABYRINTH                          , 0, gCardAISpecialSummonEquip_080B97B4            },
    { KONAMI_AMPLIFIER                                  , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_FAIRY_METEOR_CRUSH                         , 0, gCardAIEquip_080B978C                         },
    { KONAMI_TWIN_SWORDS_OF_FLASHING_LIGHT_TRYCE        , 0, gCardAIEquipBoostATK_080B9734                 },
    { KONAMI_FUHMA_SHURIKEN                             , 0, gCardAIEquipSendToGY_080B9770                 },
    { KONAMI_BUBBLE_BLASTER                             , 0, gCardAIEquipSendToGY_080B9770                 },
    { KONAMI_CYCLONE_BOOMERANG                          , 0, gCardAIEquipSendToGY_080B9770                 },
    { KONAMI_TRIAL_OF_THE_PRINCESSES                    , 0, gCardAISpecialSummonEquip_080B97B4            },
    { KONAMI_TOON_TABLE_OF_CONTENTS                     , 0, gCardAISearch_080B9D8C                        },
    { KONAMI_FOOLISH_BURIAL                             , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_COCOON_OF_EVOLUTION                        , 0, gCardAIDestroyEquip_080B76C8                  },
    { KONAMI_PITCH_BLACK_POWER_STONE                    , 0, gCardAIDestroyEquip_080B76C8                  },
    { KONAMI_METAL_REFLECT_SLIME                        , 0, gCardAISpecialSummonPreventAttack_080B9EF0    },
    { KONAMI_METAMORPHOSIS                              , 0, gCardAISpecialSummonFusion_080B9F08           },
    { KONAMI_JADE_INSECT_WHISTLE                        , 0, gCardAISpecialSummonDamage_080B9EB4           },
    { KONAMI_CREATURE_SWAP                              , 0, gCardAITakeControlChangePosition_080B8330     },
    { KONAMI_GIFT_OF_THE_MARTYR                         , 0, gCardAISendToGYBoostATK_080BA018              },
    { KONAMI_ALTAR_FOR_TRIBUTE                          , 0, gCardAISendToGYBoostATK_080BA018              },
    { KONAMI_OVERPOWERING_EYE                           , 0, gCardAIDirectAttack_080B9FC0                  },
    { KONAMI_MONSTER_REINCARNATION                      , 0, gCardAISearchDiscard_080B9F5C                 },
    { KONAMI_MULTIPLICATION_OF_ANTS                     , 0, gCardAISpecialSummonTribute_080B82B4          },
    { KONAMI_EXCAVATION_OF_MAGE_STONES                  , 0, gCardAIDiscardReturnToHand_080B9E34           },
    { KONAMI_LEVEL_UP                                   , 0, gCardAISpecialSummonSendToGY_080B9E6C         },
    { KONAMI_DIFFUSION_WAVE_MOTION                      , 0, gCardAIDestroyDamage_080BA84C                 },
    { KONAMI_CHECKMATE                                  , 0, gCardAIDirectAttackTribute_080BA890           },
    { KONAMI_DARK_SCORPION_COMBINATION                  , 0, gCardAIDirectAttack_080BA8E4                  },
    { KONAMI_GRAVEDIGGER_GHOUL                          , 0, gCardAIBanishGraveyard_080B8270               },
    { KONAMI_MONSTER_GATE                               , 0, gCardAISpecialSummonSendToGY_080B8484         },
    { KONAMI_MUSTERING_OF_THE_DARK_SCORPIONS            , 0, gCardAISpecialSummon_080B83E4                 },
    { KONAMI_INSECT_IMITATION                           , 0, gCardAISpecialSummonChangePosition_080B82E8   },
    { KONAMI_DUST_BARRIER                               , 0, gCardAIDestroyStandbyPhase_080B849C           },
    { KONAMI_VWXYZ_DRAGON_CATAPULT_CANNON               , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_RELINQUISHED                               , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_THOUSAND_EYES_RESTRICT                     , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_BARREL_DRAGON                              , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_BLOWBACK_DRAGON                            , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_ROYAL_MAGICAL_LIBRARY                      , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_ANTEATEREATINGANT                          , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_URIA_LORD_OF_SEARING_FLAMES                , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_VAMPIRE_GENESIS                            , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_RED_EYES_B_CHICK                           , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_PATROID                                    , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_AVATAR_OF_THE_POT                          , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_KING_DRAGUN                                , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_CHIRON_THE_MAGE                            , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_KAIBAMAN                                   , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_ABARE_USHIONI                              , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_BAZOO_THE_SOUL_EATER                       , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_CHAOSRIDER_GUSTAPH                         , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_THE_LIGHT_HEX_SEALED_FUSION                , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_THE_DARK_HEX_SEALED_FUSION                 , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_THE_EARTH_HEX_SEALED_FUSION                , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_THE_CREATOR_INCARNATE                      , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_ORCA_MEGA_FORTRESS_OF_DARKNESS             , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_D_D_M_DIFFERENT_DIMENSION_MASTER           , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_CYBER_LASER_DRAGON                         , 0, gCardAIDestroy_080B76A8                       },
    { KONAMI_ELEMENTAL_HERO_THUNDER_GIANT               , 0, gCardAIDestroy_080B76A8                       },
    { KONAMI_B_E_S_TETRAN                               , 0, gCardAIDestroy_080B76A8                       },
    { KONAMI_POSSESSED_DARK_SOUL                        , 0, gCardAIDestroy_080B76A8                       },
    { KONAMI_SAND_GAMBLER                               , 0, gCardAIDestroy_080B76A8                       },
    { KONAMI_XY_DRAGON_CANNON                           , 0, gCardAISpecialSummonDiscard_080B7744          },
    { KONAMI_XZ_TANK_CANNON                             , 0, gCardAISpecialSummonDiscard_080B7744          },
    { KONAMI_YZ_TANK_DRAGON                             , 0, gCardAISpecialSummonDiscard_080B7744          },
    { KONAMI_XYZ_DRAGON_CANNON                          , 0, gCardAISpecialSummonDiscard_080BA400          },
    { KONAMI_VW_TIGER_CATAPULT                          , 0, gCardAISpecialSummonDiscard_080BA450          },
    { KONAMI_BLAST_MAGICIAN                             , 0, gCardAIDestroyCounter_080BA518                },
    { KONAMI_OCEAN_DRAGON_LORD_NEO_DAEDALUS             , 0, gCardAISpecialSummonSendToGY_080BA53C         },
    { KONAMI_LEVIA_DRAGON_DAEDALUS                      , 0, gCardAIDestroyAllRitualSummon_080BA488        },
    { KONAMI_LEGENDARY_FLAME_LORD                       , 0, gCardAIDestroyAllRitualSummon_080BA488        },
    { KONAMI_DEMISE_KING_OF_ARMAGEDDON                  , 0, gCardAIDestroyAllRitualSummon_080BA488        },
    { KONAMI_GODDESS_OF_WHIM                            , 0, gCardAIRNG_080BA3CC                           },
    { KONAMI_SWARM_OF_SCARABS                           , 0, gCardAIDestroyChangePosition_080BA5C4         },
    { KONAMI_SWARM_OF_LOCUSTS                           , 0, gCardAIDestroyChangePosition_080BA5C4         },
    { KONAMI_BLACK_LUSTER_SOLDIER_ENVOY_OF_THE_BEGINNING, 0, gCardAISpecialSummonBanish_080BA7E0           },
    { KONAMI_CHAOS_SORCERER                             , 0, gCardAISpecialSummonBanish_080BA7E0           },
    { KONAMI_ABYSS_SOLDIER                              , 0, gCardAIDiscard_080BA914                       },
    { KONAMI_SKILLED_DARK_MAGICIAN                      , 0, gCardAISpecialSummonGraveyard_080B771C        },
    { KONAMI_SKILLED_WHITE_MAGICIAN                     , 0, gCardAISpecialSummonGraveyard_080B771C        },
    { KONAMI_SUMMON_PRIEST                              , 0, gCardAISpecialSummonGraveyard_080B771C        },
    { KONAMI_TIME_WIZARD                                , 0, gCardAIDestroyAllDamage_080BA1D4              },
    { KONAMI_JOWGEN_THE_SPIRITUALIST                    , 0, gCardAISpecialSummonDiscard_080BA1F0          },
    { KONAMI_AMAZON_ARCHER                              , 0, gCardAIDamageTribute_080BA20C                 },
    { KONAMI_CRIMSON_SENTRY_NONE                        , 0, gCardAIDestroyTribute_080BA24C                },
    { KONAMI_THE_FORGIVING_MAIDEN                       , 0, gCardAIDestroyTribute_080BA24C                },
    { KONAMI_KARATE_MAN                                 , 0, gCardAIDestroyEndPhase_080BA29C               },
    { KONAMI_VALKYRION_THE_MAGNA_WARRIOR                , 0, gCardAISpecialSummonRevive_080BA358           },
    { KONAMI_CYBER_STEIN                                , 0, gCardAISpecialSummonDamage_080BA388           },
    { KONAMI_Y_DRAGON_HEAD                              , 0, gCardAISpecialSummonDestroy_080BA628          },
    { KONAMI_Z_METAL_TANK                               , 0, gCardAISpecialSummonDestroy_080BA628          },
    { KONAMI_PITCH_DARK_DRAGON                          , 0, gCardAISpecialSummonDestroy_080BA628          },
    { KONAMI_KIRYU                                      , 0, gCardAISpecialSummonDestroy_080BA628          },
    { KONAMI_ZOMBIE_TIGER                               , 0, gCardAISpecialSummonDestroy_080BA628          },
    { KONAMI_SECOND_GOBLIN                              , 0, gCardAISpecialSummonDestroy_080BA628          },
    { KONAMI_DES_DENDLE                                 , 0, gCardAISpecialSummonDestroy_080BA628          },
    { KONAMI_BURNING_BEAST                              , 0, gCardAISpecialSummonDestroy_080BA628          },
    { KONAMI_FREEZING_BEAST                             , 0, gCardAISpecialSummonDestroy_080BA628          },
    { KONAMI_KOITSU                                     , 0, gCardAISpecialSummonDestroy_080BA628          },
    { KONAMI_METALLIZING_PARASITE_LUNATITE              , 0, gCardAISpecialSummonDestroy_080BA628          },
    { KONAMI_HEAVY_MECH_SUPPORT_PLATFORM                , 0, gCardAISpecialSummonDestroy_080BA628          },
    { KONAMI_PROTECTIVE_SOUL_AILIN                      , 0, gCardAISpecialSummonDestroy_080BA628          },
    { KONAMI_DOITSU                                     , 0, gCardAISpecialSummonDestroy_080BA628          },
    { KONAMI_W_WING_CATAPULT                            , 0, gCardAISpecialSummonDestroy_080BA628          },
    { KONAMI_TRIBE_INFECTING_VIRUS                      , 0, gCardAIDiscardDestroyAll_080B85D4             },
    { KONAMI_EXILED_FORCE                               , 0, gCardAIDestroy_080B76A8                       },
    { KONAMI_OBELISK_THE_TORMENTOR_NONE                 , 0, gCardAISpecialSummonNegate_080BACFC           },
    { KONAMI_BREAKER_THE_MAGICAL_WARRIOR                , 0, gCardAIDestroySpellTrapBoostATK_080BA678      },
    { KONAMI_HANNIBAL_NECROMANCER                       , 0, gCardAIDestroy_080B76A8                       },
    { KONAMI_GEAR_GOLEM_THE_MOVING_FORTRESS             , 0, gCardAIDamageDirectAttack_080BA774            },
    { KONAMI_OWNER_S_SEAL                               , 0, gCardAIDestroy_080B76A8                       },
    { KONAMI_ANCIENT_GEAR_CASTLE                        , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_THE_AGENT_OF_CREATION_VENUS                , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_THE_AGENT_OF_JUDGMENT_SATURN               , 0, gCardAIDamageBattlePhase_080BA6AC             },
    { KONAMI_ARMED_DRAGON_LV10                          , 0, gCardAISpecialSummonSendToGY_080BA9F4         },
    { KONAMI_ARMED_DRAGON_LV7                           , 0, gCardAISpecialSummonSendToGY_080BA9A8         },
    { KONAMI_ARMED_DRAGON_LV5                           , 0, gCardAISpecialSummonSendToGY_080BA988         },
    { KONAMI_GAIA_SOUL_THE_COMBUSTIBLE_COLLECTIVE       , 0, gCardAIDestroyBoostATK_080BAA2C               },
    { KONAMI_DARK_MASTER_ZORC                           , 0, gCardAISpecialSummonRitualSummon_080BAA88     },
    { KONAMI_GATLING_DRAGON                             , 0, gCardAIDestroyRNG_080BAAC8                    },
    { KONAMI_SUPER_ROBOLADY                             , 0, gCardAISpecialSummonRitualSummon_080BAA88     },
    { KONAMI_SUPER_ROBOYAROU                            , 0, gCardAISpecialSummonBoostATK_080BAAA8         },
    { KONAMI_HAND_OF_NEPHTHYS                           , 0, gCardAISpecialSummonTribute_080BAAE8          },
    { KONAMI_ELEMENTAL_HERO_TEMPEST                     , 0, gCardAISpecialSummonFusionSummon_080BAB1C     },
    { KONAMI_RAVIEL_LORD_OF_PHANTASMS                   , 0, gCardAISpecialSummonBoostATK_080BAB3C         },
    { KONAMI_ARCHLORD_ZERATO                            , 0, gCardAISpecialSummonDiscard_080BABA8          },
    { KONAMI_THE_BLOCKMAN                               , 0, gCardAISpecialSummonPreventAttack_080BACCC    },
    { KONAMI_LEKUNGA                                    , 0, gCardAISpecialSummonChangePosition_080BABD4   },
    { KONAMI_A_LEGENDARY_OCEAN                          , 0, gCardAIBoostATKBoostDEF_080B851C              },
    { KONAMI_HARPIES_HUNTING_GROUND                     , 0, gCardAISpecialSummonDestroySpellTrap_080B8568 },
    { KONAMI_FOREST                                     , 0, gCardAIBoostATKBoostDEF_080B84D8              },
    { KONAMI_WASTELAND                                  , 0, gCardAIBoostATKBoostDEF_080B84D8              },
    { KONAMI_MOUNTAIN                                   , 0, gCardAIBoostATKBoostDEF_080B84D8              },
    { KONAMI_SOGEN                                      , 0, gCardAIBoostATKBoostDEF_080B84D8              },
    { KONAMI_UMI                                        , 0, gCardAIBoostATKBoostDEF_080B84D8              },
    { KONAMI_YAMI                                       , 0, gCardAIBoostATKBoostDEF_080B84D8              },
    { KONAMI_CHORUS_OF_SANCTUARY                        , 0, gCardAIBoostATKBoostDEF_080B84D8              },
    { KONAMI_GAIA_POWER                                 , 0, gCardAIBoostATKBoostDEF_080B84D8              },
    { KONAMI_UMIIRUKA                                   , 0, gCardAIBoostATKBoostDEF_080B84D8              },
    { KONAMI_MOLTEN_DESTRUCTION                         , 0, gCardAIBoostATKBoostDEF_080B84D8              },
    { KONAMI_RISING_AIR_CURRENT                         , 0, gCardAIBoostATKBoostDEF_080B84D8              },
    { KONAMI_LUMINOUS_SPARK                             , 0, gCardAIBoostATKBoostDEF_080B84D8              },
    { KONAMI_MYSTIC_PLASMA_ZONE                         , 0, gCardAIBoostATKBoostDEF_080B84D8              },
    { KONAMI_ARRAY_OF_REVEALING_LIGHT                   , 0, gCardAIBoostATKBoostDEF_080B84D8              },
    { KONAMI_NECROVALLEY                                , 0, gCardAIBoostATKBoostDEF_080B84D8              },
    { KONAMI_PANDEMONIUM                                , 0, gCardAIBoostATKBoostDEF_080B84D8              },
    { KONAMI_THE_SANCTUARY_IN_THE_SKY                   , 0, gCardAIBoostATKBoostDEF_080B84D8              },
    { KONAMI_CENTRIFUGAL_FIELD                          , 0, gCardAIBoostATKBoostDEF_080B84D8              },
    { KONAMI_SKYSCRAPER                                 , 0, gCardAIBoostATKBoostDEF_080B84D8              },
    { KONAMI_FAULT_ZONE                                 , 0, gCardAIBoostATKBoostDEF_080B84D8              },
    { KONAMI_POLYMERIZATION                             , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_POLYMERIZATION_2                           , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_POWER_BOND                                 , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_FUSION_GATE                                , 0, gCardAISpecialSummonFusionSummon_080B8500     },
    { KONAMI_MIRACLE_FUSION                             , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_DRAGON_S_MIRROR                            , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_FUSION_RECOVERY                            , 0, gCardAIGraveyardDestroy_080B76A4              },
};

// gAIEffects8  (70 entries)
const struct CardAIEffect gAIEffects8[70] = {
//  KonamiId                                             pad  Effect
    { KONAMI_ROYAL_KEEPER                               , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_SWARM_OF_SCARABS                           , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_SWARM_OF_LOCUSTS                           , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_GIANT_AXE_MUMMY                            , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_8_CLAWS_SCORPION_NONE                      , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_GUARDIAN_SPHINX                            , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_DES_LACOODA                                , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_COBRAMAN_SAKUZY                            , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_STEALTH_BIRD                               , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_GOLEM_SENTRY                               , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_MOAI_INTERCEPTOR_CANNONS                   , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_GUARDIAN_STATUE                            , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_MEDUSA_WORM                                , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_MID_SHIELD_GARDNA                          , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_GREAT_SPIRIT                               , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_CHAOS_EMPEROR_DRAGON_ENVOY_OF_THE_END      , 0, gCardAISpecialSummonSendToGY_080BAD10         },
    { KONAMI_CANNON_SOLDIER                             , 0, gCardAIDamageTribute_080BA134                 },
    { KONAMI_TOON_CANNON_SOLDIER                        , 0, gCardAIDamageTribute_080BA134                 },
    { KONAMI_CATAPULT_TURTLE                            , 0, gCardAIDamageTribute_080BA090                 },
    { KONAMI_ULTIMATE_BASEBALL_KID                      , 0, gCardAISendToGYBoostATK_080BA194              },
    { KONAMI_MASS_DRIVER                                , 0, gCardAIDamageTribute_080BA134                 },
    { KONAMI_MAGICAL_BLAST                              , 0, gCardAISearchDamage_080BADF4                  },
    { KONAMI_STRAY_LAMBS                                , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_EARTHQUAKE                                 , 0, gCardAIChangePosition_080B9ED0                },
    { KONAMI_BOOK_OF_TAIYOU                             , 0, gCardAIChangePosition_080B8164                },
    { KONAMI_FINAL_COUNTDOWN                            , 0, gCardAIEndPhaseDestroyAll_080B9D50            },
    { KONAMI_LAST_WILL                                  , 0, gCardAISpecialSummonSendToGY_080B8290         },
    { KONAMI_MESMERIC_CONTROL                           , 0, gCardAIUnknown_080B7EB8                       },
    { KONAMI_HIEROGLYPH_LITHOGRAPH                      , 0, gCardAIDamage_080B81D0                        },
    { KONAMI_GERM_INFECTION                             , 0, gCardAIEquipPreventAttack_080B9868            },
    { KONAMI_PARALYZING_POTION_NONE                     , 0, gCardAIEquipPreventAttack_080B9868            },
    { KONAMI_MASK_OF_THE_ACCURSED                       , 0, gCardAIEquipPreventAttack_080B9868            },
    { KONAMI_EKIBYO_DRAKMORD                            , 0, gCardAIEquipPreventAttack_080B9868            },
    { KONAMI_RING_OF_MAGNETISM                          , 0, gCardAIEquip_080B978C                         },
    { KONAMI_WAVE_MOTION_CANNON                         , 0, gCardAISendToGYDamage_080B8208                },
    { KONAMI_YELLOW_LUSTER_SHIELD                       , 0, gCardAISpecialSummonDamage_080B76E4           },
    { KONAMI_ECTOPLASMER                                , 0, gCardAISpecialSummonDamage_080B76E4           },
    { KONAMI_CONTINUOUS_DESTRUCTION_PUNCH               , 0, gCardAISpecialSummonDamage_080B76E4           },
    { KONAMI_CONVULSION_OF_NATURE                       , 0, gCardAISpecialSummonDamage_080B76E4           },
    { KONAMI_STUMBLING                                  , 0, gCardAISpecialSummonDamage_080B76E4           },
    { KONAMI_PRECIOUS_CARDS_FROM_BEYOND                 , 0, gCardAISpecialSummonDamage_080B76E4           },
    { KONAMI_D_D_BORDERLINE                             , 0, gCardAISpecialSummonDamage_080B76E4           },
    { KONAMI_DIFFERENT_DIMENSION_CAPSULE                , 0, gCardAISpecialSummonGraveyard_080B771C        },
    { KONAMI_RETURN_OF_THE_DOOMED                       , 0, gCardAISpecialSummonGraveyard_080B771C        },
    { KONAMI_SWORDS_OF_REVEALING_LIGHT                  , 0, gCardAIDestroyStandbyPhase_080B80BC           },
    { KONAMI_NIGHTMARE_S_STEELCAGE                      , 0, gCardAIDestroyStandbyPhase_080B80BC           },
    { KONAMI_SWORDS_OF_CONCEALING_LIGHT                 , 0, gCardAIDestroyStandbyPhase_080B80BC           },
    { KONAMI_MESSENGER_OF_PEACE                         , 0, gCardAIDestroyStandbyPhase_080B80BC           },
    { KONAMI_SHIFTING_SHADOWS                           , 0, gCardAIDamageChangePosition_080BAD6C          },
    { KONAMI_GRAVEKEEPER_S_SERVANT                      , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_TOLL                                       , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_7                                          , 0, gCardAIGraveyardDestroy_080B76A4              },
    { KONAMI_GROUND_COLLAPSE                            , 0, gCardAIUnknown_080B7F94                       },
    { KONAMI_BURNING_LAND                               , 0, gCardAIDestroyAllDamage_080B7FB4              },
    { KONAMI_THE_DARK_DOOR                              , 0, gCardAIBattlePhase_080B7F64                   },
    { KONAMI_INSECT_BARRIER                             , 0, gCardAIPreventAttack_080B8138                 },
    { KONAMI_INFINITE_CARDS                             , 0, gCardAIUnknown_080B8004                       },
    { KONAMI_MASS_DRIVER                                , 0, gCardAIDamageTribute_080B8090                 },
    { KONAMI_JAM_BREEDING_MACHINE                       , 0, gCardAISpecialSummonDamage_080B76E4           },
    { KONAMI_MASK_OF_DISPEL                             , 0, gCardAIDestroy_080B76A8                       },
    { KONAMI_DANGEROUS_MACHINE_TYPE_6                   , 0, gCardAISpecialSummonDamage_080B76E4           },
    { KONAMI_SENRI_EYE                                  , 0, gCardAISpecialSummonDamage_080B76E4           },
    { KONAMI_LEVEL_LIMIT_AREA_B                         , 0, gCardAIChangePosition_080B9B3C                },
    { KONAMI_HEART_OF_THE_UNDERDOG                      , 0, gCardAISpecialSummonDamage_080B76E4           },
    { KONAMI_VENGEFUL_BOG_SPIRIT                        , 0, gCardAISpecialSummonDamage_080B76E4           },
    { KONAMI_DARK_SNAKE_SYNDROME                        , 0, gCardAISpecialSummonDamage_080B76E4           },
    { KONAMI_TWO_MAN_CELL_BATTLE                        , 0, gCardAISpecialSummonDamage_080B76E4           },
    { KONAMI_MIRAGE_OF_NIGHTMARE                        , 0, gCardAIDrawDiscard_080B8074                   },
    { KONAMI_SPIRITUAL_ENERGY_SETTLE_MACHINE            , 0, gCardAIDiscardReturnToHand_080B803C           },
    { KONAMI_CHAIN_ENERGY                               , 0, gCardAIGraveyardDestroy_080B76A4              },
};
