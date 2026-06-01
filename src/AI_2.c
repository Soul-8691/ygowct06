#include "AI.h"

// Forward declarations for gAISearcherCardEffects functions
extern void gCardAIBanishBoostATK_0808896C(void);
extern void gCardAIBanishBoostATK_0808A83C(void);
extern void gCardAIBanishDamage_08088904(void);
extern void gCardAIBanishDestroy_08088E0C(void);
extern void gCardAIBanishGraveyard_08087CF0(void);
extern void gCardAIBanishGraveyard_08087D9C(void);
extern void gCardAIBanishGraveyard_08088E64(void);
extern void gCardAIBanishGraveyard_0808A788(void);
extern void gCardAIDamageGraveyard_0808A920(void);
extern void gCardAIDamageGraveyard_0808B12C(void);
extern void gCardAIDamageReturnToHand_0808A3B8(void);
extern void gCardAIDamage_08087A80(void);
extern void gCardAIDestroyChangePosition_08087FC0(void);
extern void gCardAIDestroySpellTrap_08088304(void);
extern void gCardAIDestroyTribute_080885D0(void);
extern void gCardAIDiscardBoostATK_080890C0(void);
extern void gCardAIDiscardGraveyard_0808AE4C(void);
extern void gCardAIDiscardGraveyard_0808BC10(void);
extern void gCardAIDiscardGraveyard_0808C058(void);
extern void gCardAIDiscardReturnToHand_0808ABF4(void);
extern void gCardAIDiscard_0808D294(void);
extern void gCardAIDrawGraveyard_0808CC5C(void);
extern void gCardAIDrawSendToGY_0808AD8C(void);
extern void gCardAIDrawSpecialSummon_08089284(void);
extern void gCardAIDraw_0808B940(void);
extern void gCardAIDraw_0808D054(void);
extern void gCardAIFlip_080872A4(void);
extern void gCardAIFusionSummonReturnToHand_08088DB8(void);
extern void gCardAIGraveyardBanish_08089338(void);
extern void gCardAIGraveyardEquip_0808ACA0(void);
extern void gCardAIGraveyardEquip_0808CE3C(void);
extern void gCardAIGraveyardFlip_08089114(void);
extern void gCardAIGraveyardFlip_0808B350(void);
extern void gCardAIGraveyardSearch_0808724C(void);
extern void gCardAIGraveyardSearch_08087870(void);
extern void gCardAIGraveyardSpecialSummon_08088D2C(void);
extern void gCardAIGraveyard_08088058(void);
extern void gCardAIGraveyard_0808A708(void);
extern void gCardAIGraveyard_0808B688(void);
extern void gCardAIReturnToHandGraveyard_0808767C(void);
extern void gCardAIReturnToHandGraveyard_0808B988(void);
extern void gCardAIReturnToHandGraveyard_0808CDC0(void);
extern void gCardAIReturnToHandSendToGY_0808B2C8(void);
extern void gCardAISearchBanish_08089BB8(void);
extern void gCardAISearchBanish_0808A978(void);
extern void gCardAISearchBoostATK_0808CA64(void);
extern void gCardAISearchDamage_0808A4F0(void);
extern void gCardAISearchDiscard_08087EBC(void);
extern void gCardAISearchDiscard_0808AFFC(void);
extern void gCardAISearchDiscard_0808B8E8(void);
extern void gCardAISearchEquip_0808A598(void);
extern void gCardAISearchFlip_08089B60(void);
extern void gCardAISearchFlip_08089C24(void);
extern void gCardAISearchFlip_0808AC48(void);
extern void gCardAISearchFusionSummon_0808C4A8(void);
extern void gCardAISearchGraveyard_0808846C(void);
extern void gCardAISearchGraveyard_08089068(void);
extern void gCardAISearchGraveyard_0808A2AC(void);
extern void gCardAISearchGraveyard_0808A3E8(void);
extern void gCardAISearchGraveyard_0808AAB4(void);
extern void gCardAISearchGraveyard_0808B52C(void);
extern void gCardAISearchNegate_08088FE0(void);
extern void gCardAISearchRitual_08088198(void);
extern void gCardAISearchRitual_08088284(void);
extern void gCardAISearchRitual_0808AA38(void);
extern void gCardAISearchSendToGY_080871A8(void);
extern void gCardAISearchSendToGY_080878C8(void);
extern void gCardAISearchSendToGY_08089E44(void);
extern void gCardAISearchSendToGY_0808A5F0(void);
extern void gCardAISearchSendToGY_0808B240(void);
extern void gCardAISearchSendToGY_0808C2F8(void);
extern void gCardAISearchSendToGY_0808CBD4(void);
extern void gCardAISearchSendToGY_0808CF88(void);
extern void gCardAISearchSendToGY_0808D3D8(void);
extern void gCardAISearchSendToGY_0808D5B0(void);
extern void gCardAISearchSpecialSummon_08088AD4(void);
extern void gCardAISearchSpecialSummon_08088B2C(void);
extern void gCardAISearchSpecialSummon_0808D694(void);
extern void gCardAISearch_08087794(void);
extern void gCardAISearch_080897B4(void);
extern void gCardAISendToGYDamage_08087758(void);
extern void gCardAISendToGYDamage_0808941C(void);
extern void gCardAISendToGYDamage_0808B584(void);
extern void gCardAISendToGYDamage_0808C2A0(void);
extern void gCardAISendToGYGraveyard_080887B0(void);
extern void gCardAISendToGYGraveyard_08088A34(void);
extern void gCardAISendToGYGraveyard_08088C9C(void);
extern void gCardAISendToGYGraveyard_0808962C(void);
extern void gCardAISendToGYGraveyard_0808A440(void);
extern void gCardAISendToGYGraveyard_0808C264(void);
extern void gCardAISpecialSummonBanish_08089684(void);
extern void gCardAISpecialSummonBanish_0808A9B4(void);
extern void gCardAISpecialSummonBanish_0808BD04(void);
extern void gCardAISpecialSummonBanish_0808BD78(void);
extern void gCardAISpecialSummonBanish_0808BFCC(void);
extern void gCardAISpecialSummonBoostATK_080892B4(void);
extern void gCardAISpecialSummonBoostATK_0808D1BC(void);
extern void gCardAISpecialSummonChangePosition_0808796C(void);
extern void gCardAISpecialSummonChangePosition_0808864C(void);
extern void gCardAISpecialSummonChangePosition_080886F8(void);
extern void gCardAISpecialSummonChangePosition_080891F8(void);
extern void gCardAISpecialSummonChangePosition_0808B7DC(void);
extern void gCardAISpecialSummonChangePosition_0808C45C(void);
extern void gCardAISpecialSummonChangePosition_0808D060(void);
extern void gCardAISpecialSummonDamage_0808A224(void);
extern void gCardAISpecialSummonDamage_0808C0C8(void);
extern void gCardAISpecialSummonDestroyAll_0808B750(void);
extern void gCardAISpecialSummonDestroy_08089F34(void);
extern void gCardAISpecialSummonDestroy_0808A190(void);
extern void gCardAISpecialSummonDestroy_0808A498(void);
extern void gCardAISpecialSummonDestroy_0808A67C(void);
extern void gCardAISpecialSummonDestroy_0808AE98(void);
extern void gCardAISpecialSummonDestroy_0808B3A8(void);
extern void gCardAISpecialSummonDestroy_0808D494(void);
extern void gCardAISpecialSummonDiscard_08088ED8(void);
extern void gCardAISpecialSummonDiscard_0808BE6C(void);
extern void gCardAISpecialSummonDiscard_0808C3D0(void);
extern void gCardAISpecialSummonDiscard_0808D324(void);
extern void gCardAISpecialSummonEndPhase_0808B6E0(void);
extern void gCardAISpecialSummonEquip_08087B00(void);
extern void gCardAISpecialSummonFlip_08089AA0(void);
extern void gCardAISpecialSummonFusionSummon_0808C350(void);
extern void gCardAISpecialSummonFusionSummon_0808C4FC(void);
extern void gCardAISpecialSummonFusionSummon_0808C5EC(void);
extern void gCardAISpecialSummonFusion_080876DC(void);
extern void gCardAISpecialSummonFusion_08089C7C(void);
extern void gCardAISpecialSummonFusion_0808B9E0(void);
extern void gCardAISpecialSummonGraveyard_080872E4(void);
extern void gCardAISpecialSummonGraveyard_08087C4C(void);
extern void gCardAISpecialSummonGraveyard_08088360(void);
extern void gCardAISpecialSummonGraveyard_080889C4(void);
extern void gCardAISpecialSummonGraveyard_08089D08(void);
extern void gCardAISpecialSummonGraveyard_0808A010(void);
extern void gCardAISpecialSummonPreventAttack_0808980C(void);
extern void gCardAISpecialSummonPreventAttack_08089FB8(void);
extern void gCardAISpecialSummonPreventAttack_0808CABC(void);
extern void gCardAISpecialSummonReturnToHand_08088F7C(void);
extern void gCardAISpecialSummonReturnToHand_08089990(void);
extern void gCardAISpecialSummonReturnToHand_0808BDEC(void);
extern void gCardAISpecialSummonRevive_0808A894(void);
extern void gCardAISpecialSummonRevive_0808B07C(void);
extern void gCardAISpecialSummonRevive_0808B1AC(void);
extern void gCardAISpecialSummonRevive_0808B874(void);
extern void gCardAISpecialSummonRevive_0808C6DC(void);
extern void gCardAISpecialSummonRevive_0808C808(void);
extern void gCardAISpecialSummonRevive_0808CD34(void);
extern void gCardAISpecialSummonSendToGY_08087A20(void);
extern void gCardAISpecialSummonSendToGY_08087BF4(void);
extern void gCardAISpecialSummonSendToGY_08087E08(void);
extern void gCardAISpecialSummonSendToGY_080880C0(void);
extern void gCardAISpecialSummonSendToGY_08088214(void);
extern void gCardAISpecialSummonSendToGY_080883D4(void);
extern void gCardAISpecialSummonSendToGY_080885A8(void);
extern void gCardAISpecialSummonSendToGY_08089150(void);
extern void gCardAISpecialSummonSendToGY_08089378(void);
extern void gCardAISpecialSummonSendToGY_08089558(void);
extern void gCardAISpecialSummonSendToGY_08089898(void);
extern void gCardAISpecialSummonSendToGY_08089D94(void);
extern void gCardAISpecialSummonSendToGY_0808ADD0(void);
extern void gCardAISpecialSummonSendToGY_0808B43C(void);
extern void gCardAISpecialSummonSendToGY_0808B454(void);
extern void gCardAISpecialSummonSendToGY_0808BB7C(void);
extern void gCardAISpecialSummonSendToGY_0808BC4C(void);
extern void gCardAISpecialSummonSendToGY_0808C154(void);
extern void gCardAISpecialSummonSendToGY_0808C97C(void);
extern void gCardAISpecialSummonSendToGY_0808CB54(void);
extern void gCardAISpecialSummonSendToGY_0808CCB4(void);
extern void gCardAISpecialSummonTribute_0808AB44(void);
extern void gCardAISpecialSummon_08087BA8(void);
extern void gCardAISpecialSummon_080884F8(void);
extern void gCardAISpecialSummon_0808882C(void);
extern void gCardAISpecialSummon_08089760(void);
extern void gCardAISpecialSummon_08089928(void);
extern void gCardAISpecialSummon_080899E8(void);
extern void gCardAISpecialSummon_08089ED0(void);
extern void gCardAISpecialSummon_0808C790(void);
extern void gCardAISpecialSummon_0808D224(void);
extern void gCardAIUnknown_08087D58(void);
extern void gCardAIUnknown_0808A378(void);
extern void gCardAIUnknown_0808AB9C(void);
extern void sub_0808D704(void);
extern void sub_0808D7F4(void);

// gAISearcherCardEffects  (307 entries)
const struct CardAIEffect gAISearcherCardEffects[307] = {
//  KonamiId                                             pad  Effect
    { KONAMI_TIME_WIZARD                                , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_SANGAN                                     , 0, gCardAISearchSendToGY_080871A8              },
    { KONAMI_MASK_OF_DARKNESS                           , 0, gCardAIGraveyardSearch_0808724C             },
    { KONAMI_BIG_EYE_NONE                               , 0, gCardAIFlip_080872A4                        },
    { KONAMI_ELEGANT_EGOTIST                            , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_MONSTER_EYE                                , 0, gCardAIReturnToHandGraveyard_0808767C       },
    { KONAMI_CYBER_STEIN                                , 0, gCardAISpecialSummonFusion_080876DC         },
    { KONAMI_THUNDER_DRAGON                             , 0, gCardAISearch_08087794                      },
    { KONAMI_MAGICIAN_OF_FAITH                          , 0, gCardAIGraveyardSearch_08087870             },
    { KONAMI_GALE_DOGRA_NONE                            , 0, gCardAISendToGYDamage_08087758              },
    { KONAMI_WITCH_OF_THE_BLACK_FOREST                  , 0, gCardAISearchSendToGY_080878C8              },
    { KONAMI_MAGICAL_LABYRINTH                          , 0, gCardAISpecialSummonEquip_08087B00          },
    { KONAMI_BERFOMET                                   , 0, gCardAISearch_08087794                      },
    { KONAMI_CHIMERA_THE_FLYING_MYTHICAL_BEAST          , 0, gCardAISpecialSummonChangePosition_0808796C },
    { KONAMI_PINCH_HOPPER                               , 0, gCardAISpecialSummonSendToGY_08087A20       },
    { KONAMI_DRILL_BUG                                  , 0, gCardAIDamage_08087A80                      },
    { KONAMI_THE_FLUTE_OF_SUMMONING_DRAGON              , 0, gCardAISpecialSummon_08087BA8               },
    { KONAMI_DARK_MAGIC_CURTAIN                         , 0, gCardAISpecialSummonEquip_08087B00          },
    { KONAMI_POLYMERIZATION                             , 0, gCardAISpecialSummonSendToGY_08087BF4       },
    { KONAMI_MONSTER_REBORN                             , 0, gCardAISpecialSummonGraveyard_08087C4C      },
    { KONAMI_GRAVEDIGGER_GHOUL                          , 0, gCardAIBanishGraveyard_08087CF0             },
    { KONAMI_ANCIENT_TELESCOPE_NONE                     , 0, gCardAIUnknown_08087D58                     },
    { KONAMI_SOUL_RELEASE                               , 0, gCardAIBanishGraveyard_08087D9C             },
    { KONAMI_POLYMERIZATION_2                           , 0, gCardAISpecialSummonSendToGY_08087BF4       },
    { KONAMI_FUSION_SAGE                                , 0, gCardAISearch_08087794                      },
    { KONAMI_LAST_WILL                                  , 0, gCardAISpecialSummonSendToGY_08087E08       },
    { KONAMI_PAINFUL_CHOICE                             , 0, gCardAISearchDiscard_08087EBC               },
    { KONAMI_GIANT_RAT                                  , 0, gCardAISpecialSummonSendToGY_080880C0       },
    { KONAMI_SENJU_OF_THE_THOUSAND_HANDS                , 0, gCardAISearchRitual_08088198                },
    { KONAMI_UFO_TURTLE                                 , 0, gCardAISpecialSummonSendToGY_080880C0       },
    { KONAMI_GIANT_GERM                                 , 0, gCardAISpecialSummonSendToGY_08088214       },
    { KONAMI_NIMBLE_MOMONGA                             , 0, gCardAISpecialSummonSendToGY_08088214       },
    { KONAMI_SPEAR_CRETIN                               , 0, gCardAISpecialSummonSendToGY_080883D4       },
    { KONAMI_SHINING_ANGEL                              , 0, gCardAISpecialSummonSendToGY_080880C0       },
    { KONAMI_MOTHER_GRIZZLY                             , 0, gCardAISpecialSummonSendToGY_080880C0       },
    { KONAMI_FLYING_KAMAKIRI                            , 0, gCardAISpecialSummonSendToGY_080880C0       },
    { KONAMI_SONIC_BIRD                                 , 0, gCardAISearchRitual_08088284                },
    { KONAMI_MYSTIC_TOMATO                              , 0, gCardAISpecialSummonSendToGY_080880C0       },
    { KONAMI_BACKUP_SOLDIER                             , 0, gCardAISearchGraveyard_0808846C             },
    { KONAMI_MAJOR_RIOT_NONE                            , 0, gCardAISpecialSummonReturnToHand_08088F7C   },
    { KONAMI_MAGICAL_HATS                               , 0, gCardAIDestroyChangePosition_08087FC0       },
    { KONAMI_THE_SHALLOW_GRAVE                          , 0, gCardAISpecialSummonGraveyard_08088360      },
    { KONAMI_PREMATURE_BURIAL                           , 0, gCardAISpecialSummonGraveyard_08088360      },
    { KONAMI_BUBONIC_VERMIN                             , 0, gCardAISpecialSummonSendToGY_08088214       },
    { KONAMI_GRAVEROBBER                                , 0, gCardAIGraveyard_08088058                   },
    { KONAMI_DUST_TORNADO                               , 0, gCardAIDestroySpellTrap_08088304            },
    { KONAMI_CALL_OF_THE_HAUNTED                        , 0, gCardAISpecialSummonGraveyard_08088360      },
    { KONAMI_BIRDFACE                                   , 0, gCardAISearch_08087794                      },
    { KONAMI_SERPENTINE_PRINCESS                        , 0, gCardAISpecialSummon_080884F8               },
    { KONAMI_CHOSEN_ONE_NONE                            , 0, gCardAISpecialSummonSendToGY_080885A8       },
    { KONAMI_RETURN_OF_THE_DOOMED                       , 0, gCardAIDestroyTribute_080885D0              },
    { KONAMI_DE_FUSION                                  , 0, gCardAISpecialSummonChangePosition_0808864C },
    { KONAMI_INSECT_IMITATION                           , 0, gCardAISpecialSummonChangePosition_080886F8 },
    { KONAMI_LADY_PANTHER_NONE                          , 0, gCardAIDestroyTribute_080885D0              },
    { KONAMI_CRIMSON_SENTRY_NONE                        , 0, gCardAIDestroyTribute_080885D0              },
    { KONAMI_FAIRY_GUARDIAN_NONE                        , 0, gCardAISendToGYGraveyard_080887B0           },
    { KONAMI_THE_FORGIVING_MAIDEN                       , 0, gCardAIDestroyTribute_080885D0              },
    { KONAMI_DARK_NECROFEAR                             , 0, gCardAISpecialSummonGraveyard_080889C4      },
    { KONAMI_DESTINY_BOARD                              , 0, gCardAISendToGYGraveyard_08088A34           },
    { KONAMI_DARK_SAGE                                  , 0, gCardAISearchSpecialSummon_08088AD4         },
    { KONAMI_CATHEDRAL_OF_NOBLES                        , 0, gCardAISearchSpecialSummon_08088B2C         },
    { KONAMI_FOOLISH_BURIAL                             , 0, gCardAISendToGYGraveyard_08088C9C           },
    { KONAMI_ANCIENT_LAMP                               , 0, gCardAISpecialSummon_0808882C               },
    { KONAMI_KYCOO_THE_GHOST_DESTROYER                  , 0, gCardAIBanishDamage_08088904                },
    { KONAMI_SUMMONER_OF_ILLUSIONS                      , 0, gCardAISpecialSummonFusion_080876DC         },
    { KONAMI_BAZOO_THE_SOUL_EATER                       , 0, gCardAIBanishBoostATK_0808896C              },
    { KONAMI_SOUL_OF_PURITY_AND_LIGHT                   , 0, gCardAIGraveyardSpecialSummon_08088D2C      },
    { KONAMI_SPIRIT_OF_FLAMES                           , 0, gCardAIGraveyardSpecialSummon_08088D2C      },
    { KONAMI_AQUA_SPIRIT                                , 0, gCardAIGraveyardSpecialSummon_08088D2C      },
    { KONAMI_THE_ROCK_SPIRIT                            , 0, gCardAIGraveyardSpecialSummon_08088D2C      },
    { KONAMI_GARUDA_THE_WIND_SPIRIT                     , 0, gCardAIGraveyardSpecialSummon_08088D2C      },
    { KONAMI_GILASAURUS                                 , 0, gCardAISpecialSummonGraveyard_08088360      },
    { KONAMI_SUPPLY                                     , 0, gCardAIFusionSummonReturnToHand_08088DB8    },
    { KONAMI_SKULL_LAIR                                 , 0, gCardAIBanishDestroy_08088E0C               },
    { KONAMI_FUSION_GATE                                , 0, gCardAISpecialSummonSendToGY_08087BF4       },
    { KONAMI_MIRACLE_DIG                                , 0, gCardAIBanishGraveyard_08088E64             },
    { KONAMI_ROPE_OF_LIFE                               , 0, gCardAISpecialSummonDiscard_08088ED8        },
    { KONAMI_FREED_THE_MATCHLESS_GENERAL                , 0, gCardAISearchNegate_08088FE0                },
    { KONAMI_MARAUDING_CAPTAIN                          , 0, gCardAISpecialSummonReturnToHand_08088F7C   },
    { KONAMI_REINFORCEMENT_OF_THE_ARMY                  , 0, gCardAISearchNegate_08088FE0                },
    { KONAMI_THE_WARRIOR_RETURNING_ALIVE                , 0, gCardAISearchGraveyard_08089068             },
    { KONAMI_SPIRIT_RYU                                 , 0, gCardAIDiscardBoostATK_080890C0             },
    { KONAMI_TROOP_DRAGON                               , 0, gCardAISpecialSummonSendToGY_08088214       },
    { KONAMI_KELDO                                      , 0, gCardAIGraveyardBanish_08089338             },
    { KONAMI_SPELL_REPRODUCTION                         , 0, gCardAIGraveyardSearch_08087870             },
    { KONAMI_DE_SPELL_GERM_WEAPON                       , 0, gCardAISendToGYGraveyard_0808962C           },
    { KONAMI_DES_FERAL_IMP                              , 0, gCardAIGraveyardFlip_08089114               },
    { KONAMI_AGIDO                                      , 0, gCardAISpecialSummonSendToGY_08089150       },
    { KONAMI_SILENT_FIEND                               , 0, gCardAISpecialSummonChangePosition_080891F8 },
    { KONAMI_MAHARAGHI                                  , 0, gCardAIDrawSpecialSummon_08089284           },
    { KONAMI_SUPER_ROBOLADY                             , 0, gCardAISpecialSummonBoostATK_080892B4       },
    { KONAMI_SUPER_ROBOYAROU                            , 0, gCardAISpecialSummonBoostATK_080892B4       },
    { KONAMI_DISAPPEAR                                  , 0, gCardAIGraveyardBanish_08089338             },
    { KONAMI_LAST_TURN                                  , 0, gCardAISpecialSummonSendToGY_08089378       },
    { KONAMI_VAMPIRE_LORD                               , 0, gCardAISendToGYDamage_0808941C              },
    { KONAMI_GREAT_DEZARD                               , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_PYRAMID_TURTLE                             , 0, gCardAISpecialSummonSendToGY_08089558       },
    { KONAMI_DARK_SCORPION_BURGLARS                     , 0, gCardAISendToGYGraveyard_0808962C           },
    { KONAMI_FUSHIOH_RICHIE                             , 0, gCardAISpecialSummonPreventAttack_0808980C  },
    { KONAMI_BOOK_OF_LIFE                               , 0, gCardAISpecialSummonBanish_08089684         },
    { KONAMI_CALL_OF_THE_MUMMY                          , 0, gCardAISpecialSummon_08089760               },
    { KONAMI_TOON_TABLE_OF_CONTENTS                     , 0, gCardAISearch_080897B4                      },
    { KONAMI_PUPPET_MASTER                              , 0, gCardAISpecialSummonPreventAttack_0808980C  },
    { KONAMI_LORD_POISON                                , 0, gCardAISpecialSummonSendToGY_08089898       },
    { KONAMI_HIDDEN_SOLDIER                             , 0, gCardAISpecialSummon_08089928               },
    { KONAMI_MONSTER_RELIEF                             , 0, gCardAISpecialSummonReturnToHand_08089990   },
    { KONAMI_MACHINE_DUPLICATION                        , 0, gCardAISpecialSummon_080899E8               },
    { KONAMI_GRAVEKEEPER_S_SPY                          , 0, gCardAISpecialSummonFlip_08089AA0           },
    { KONAMI_A_CAT_OF_ILL_OMEN                          , 0, gCardAISearchFlip_08089B60                  },
    { KONAMI_AN_OWL_OF_LUCK                             , 0, gCardAISearchFlip_08089C24                  },
    { KONAMI_DIFFERENT_DIMENSION_CAPSULE                , 0, gCardAISearchBanish_08089BB8                },
    { KONAMI_TERRAFORMING                               , 0, gCardAISearchFlip_08089C24                  },
    { KONAMI_METAMORPHOSIS                              , 0, gCardAISpecialSummonFusion_08089C7C         },
    { KONAMI_RITE_OF_SPIRIT                             , 0, gCardAISpecialSummonGraveyard_08089D08      },
    { KONAMI_ROPE_OF_SPIRIT                             , 0, gCardAISpecialSummonSendToGY_08089D94       },
    { KONAMI_KING_S_KNIGHT                              , 0, gCardAISpecialSummonSendToGY_08088214       },
    { KONAMI_GOBLIN_ZOMBIE                              , 0, gCardAISearchSendToGY_08089E44              },
    { KONAMI_LEKUNGA                                    , 0, gCardAIGraveyardSpecialSummon_08088D2C      },
    { KONAMI_DECAYED_COMMANDER                          , 0, gCardAISpecialSummon_0808882C               },
    { KONAMI_VAMPIRE_ORCHIS                             , 0, gCardAISpecialSummon_0808882C               },
    { KONAMI_DIMENSION_JAR                              , 0, gCardAIGraveyardBanish_08089338             },
    { KONAMI_PALADIN_OF_WHITE_DRAGON                    , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_FRONTLINE_BASE                             , 0, gCardAISpecialSummon_08089ED0               },
    { KONAMI_AUTONOMOUS_ACTION_UNIT                     , 0, gCardAISpecialSummonDestroy_08089F34        },
    { KONAMI_TRIBUTE_DOLL                               , 0, gCardAISpecialSummonPreventAttack_08089FB8  },
    { KONAMI_SKILLED_WHITE_MAGICIAN                     , 0, gCardAISpecialSummonGraveyard_0808A010      },
    { KONAMI_SKILLED_DARK_MAGICIAN                      , 0, gCardAISpecialSummonGraveyard_0808A010      },
    { KONAMI_APPRENTICE_MAGICIAN                        , 0, gCardAISpecialSummonDestroy_0808A190        },
    { KONAMI_MAGICAL_SCIENTIST                          , 0, gCardAISpecialSummonDamage_0808A224         },
    { KONAMI_GATHER_YOUR_MIND                           , 0, gCardAISearch_08087794                      },
    { KONAMI_SENRI_EYE                                  , 0, gCardAIDamageReturnToHand_0808A3B8          },
    { KONAMI_EMBLEM_OF_DRAGON_DESTROYER                 , 0, gCardAISearchGraveyard_0808A2AC             },
    { KONAMI_SPELLBOOK_ORGANIZATION_NONE                , 0, gCardAIUnknown_0808A378                     },
    { KONAMI_HIDDEN_BOOK_OF_SPELL                       , 0, gCardAIGraveyardSearch_08087870             },
    { KONAMI_MIRACLE_RESTORING                          , 0, gCardAISpecialSummonChangePosition_0808796C },
    { KONAMI_EXCAVATION_OF_MAGE_STONES                  , 0, gCardAIGraveyardSearch_08087870             },
    { KONAMI_DARK_FLARE_KNIGHT                          , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_ARSENAL_SUMMONER                           , 0, gCardAISearchFlip_0808AC48                  },
    { KONAMI_GUARDIAN_ELMA                              , 0, gCardAIGraveyardEquip_0808ACA0              },
    { KONAMI_DARK_SCORPION_CHICK_THE_YELLOW             , 0, gCardAIDamageReturnToHand_0808A3B8          },
    { KONAMI_A_DEAL_WITH_DARK_RULER                     , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_CONTRACT_WITH_EXODIA                       , 0, gCardAISpecialSummon_0808882C               },
    { KONAMI_FAIRY_OF_THE_SPRING                        , 0, gCardAISearchGraveyard_0808A3E8             },
    { KONAMI_ARSENAL_ROBBER                             , 0, gCardAISendToGYGraveyard_0808A440           },
    { KONAMI_MAGICAL_DIMENSION                          , 0, gCardAISpecialSummonDestroy_0808A498        },
    { KONAMI_KNIGHT_S_TITLE                             , 0, gCardAISpecialSummonGraveyard_0808A010      },
    { KONAMI_SAGE_S_STONE                               , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_DARK_SCORPION_MEANAE_THE_THORN             , 0, gCardAISearchDamage_0808A4F0                },
    { KONAMI_IRON_BLACKSMITH_KOTETSU                    , 0, gCardAISearchEquip_0808A598                 },
    { KONAMI_PANDEMONIUM                                , 0, gCardAISearchSendToGY_0808A5F0              },
    { KONAMI_ARCHFIEND_S_ROAR                           , 0, gCardAISpecialSummonDestroy_0808A67C        },
    { KONAMI_RAY_OF_HOPE                                , 0, gCardAIGraveyard_0808A708                   },
    { KONAMI_STRIKE_NINJA                               , 0, gCardAIGraveyardSpecialSummon_08088D2C      },
    { KONAMI_CHOPMAN_THE_DESPERATE_OUTLAW               , 0, gCardAIGraveyardEquip_0808ACA0              },
    { KONAMI_FREED_THE_BRAVE_WANDERER                   , 0, gCardAIGraveyardSpecialSummon_08088D2C      },
    { KONAMI_WITCH_DOCTOR_OF_CHAOS                      , 0, gCardAIBanishGraveyard_0808A788             },
    { KONAMI_CHAOSRIDER_GUSTAPH                         , 0, gCardAIBanishBoostATK_0808A83C              },
    { KONAMI_INFERNO                                    , 0, gCardAIGraveyardSpecialSummon_08088D2C      },
    { KONAMI_FENRIR                                     , 0, gCardAIGraveyardSpecialSummon_08088D2C      },
    { KONAMI_GIGANTES                                   , 0, gCardAIGraveyardSpecialSummon_08088D2C      },
    { KONAMI_SILPHEED                                   , 0, gCardAIGraveyardSpecialSummon_08088D2C      },
    { KONAMI_CHAOS_SORCERER                             , 0, gCardAISpecialSummonRevive_0808A894         },
    { KONAMI_BLACK_LUSTER_SOLDIER_ENVOY_OF_THE_BEGINNING, 0, gCardAISpecialSummonRevive_0808A894         },
    { KONAMI_RECYCLE                                    , 0, gCardAIDamageGraveyard_0808A920             },
    { KONAMI_PRIMAL_SEED                                , 0, gCardAISearchBanish_0808A978                },
    { KONAMI_DIMENSION_DISTORTION                       , 0, gCardAISpecialSummonBanish_0808A9B4         },
    { KONAMI_CHAOS_EMPEROR_DRAGON_ENVOY_OF_THE_END      , 0, gCardAISpecialSummonRevive_0808A894         },
    { KONAMI_THE_THING_IN_THE_CRATER                    , 0, gCardAISpecialSummonSendToGY_08087A20       },
    { KONAMI_DARK_MAGICIAN_OF_CHAOS                     , 0, gCardAIGraveyardSearch_08087870             },
    { KONAMI_DON_TURTLE                                 , 0, gCardAISpecialSummon_0808882C               },
    { KONAMI_MANJU_OF_THE_TEN_THOUSAND_HANDS            , 0, gCardAISearchRitual_0808AA38                },
    { KONAMI_DIMENSION_FUSION                           , 0, gCardAISpecialSummonBanish_0808A9B4         },
    { KONAMI_DEDICATION_THROUGH_LIGHT_AND_DARKNESS      , 0, gCardAISpecialSummonGraveyard_0808A010      },
    { KONAMI_SALVAGE                                    , 0, gCardAISearchGraveyard_0808AAB4             },
    { KONAMI_ULTRA_EVOLUTION_PILL                       , 0, gCardAISpecialSummonTribute_0808AB44        },
    { KONAMI_JADE_INSECT_WHISTLE                        , 0, gCardAIUnknown_0808AB9C                     },
    { KONAMI_ABYSS_SOLDIER                              , 0, gCardAIDiscardReturnToHand_0808ABF4         },
    { KONAMI_THE_AGENT_OF_CREATION_VENUS                , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_THE_KICK_MAN                               , 0, gCardAIGraveyardEquip_0808ACA0              },
    { KONAMI_VAMPIRE_LADY                               , 0, gCardAISendToGYDamage_0808941C              },
    { KONAMI_AVATAR_OF_THE_POT                          , 0, gCardAIDrawSendToGY_0808AD8C                },
    { KONAMI_LADY_NINJA_YAE                             , 0, gCardAIDiscardReturnToHand_0808ABF4         },
    { KONAMI_ARCHLORD_ZERATO                            , 0, gCardAIDiscardGraveyard_0808AE4C            },
    { KONAMI_MONSTER_GATE                               , 0, gCardAISpecialSummonSendToGY_0808ADD0       },
    { KONAMI_LIGHT_OF_JUDGMENT                          , 0, gCardAIDiscardGraveyard_0808AE4C            },
    { KONAMI_NINJITSU_ART_OF_TRANSFORMATION             , 0, gCardAISpecialSummonDestroy_0808AE98        },
    { KONAMI_BECKONING_LIGHT                            , 0, gCardAISearchDiscard_0808AFFC               },
    { KONAMI_SPIRIT_OF_THE_PHARAOH                      , 0, gCardAISpecialSummonRevive_0808B07C         },
    { KONAMI_ASWAN_APPARITION                           , 0, gCardAIGraveyardSearch_0808724C             },
    { KONAMI_NUBIAN_GUARD                               , 0, gCardAIDamageGraveyard_0808B12C             },
    { KONAMI_SPIRIT_CALLER                              , 0, gCardAISpecialSummonRevive_0808B1AC         },
    { KONAMI_EMISSARY_OF_THE_AFTERLIFE                  , 0, gCardAISearchSendToGY_0808B240              },
    { KONAMI_NIGHT_ASSAILANT                            , 0, gCardAIReturnToHandSendToGY_0808B2C8        },
    { KONAMI_SOUL_REVERSAL                              , 0, gCardAIGraveyardFlip_0808B350               },
    { KONAMI_THE_FIRST_SARCOPHAGUS                      , 0, gCardAISpecialSummonSendToGY_0808B43C       },
    { KONAMI_HUMAN_WAVE_TACTICS                         , 0, gCardAISpecialSummonDestroy_0808B3A8        },
    { KONAMI_SOUL_RESURRECTION                          , 0, gCardAISpecialSummonChangePosition_080891F8 },
    { KONAMI_RETURN_FROM_THE_DIFFERENT_DIMENSION        , 0, gCardAISpecialSummonBanish_0808A9B4         },
    { KONAMI_FAMILIAR_KNIGHT                            , 0, gCardAISpecialSummonReturnToHand_08089990   },
    { KONAMI_PETEN_THE_DARK_CLOWN                       , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_THEINEN_THE_GREAT_SPHINX                   , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_ULTIMATE_INSECT_LV1                        , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_HORUS_THE_BLACK_FLAME_DRAGON_LV4           , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_HORUS_THE_BLACK_FLAME_DRAGON_LV6           , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_DARK_MIMIC_LV1                             , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_MYSTIC_SWORDSMAN_LV2                       , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_MYSTIC_SWORDSMAN_LV4                       , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_ARMED_DRAGON_LV3                           , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_ARMED_DRAGON_LV5                           , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_RED_EYES_B_CHICK                           , 0, gCardAISpecialSummon_0808882C               },
    { KONAMI_HOWLING_INSECT                             , 0, gCardAISpecialSummonSendToGY_0808B454       },
    { KONAMI_MASKED_DRAGON                              , 0, gCardAISpecialSummonSendToGY_0808B454       },
    { KONAMI_DARK_FACTORY_OF_MASS_PRODUCTION            , 0, gCardAISearchGraveyard_0808B52C             },
    { KONAMI_ABYSSAL_DESIGNATOR                         , 0, gCardAISendToGYDamage_0808B584              },
    { KONAMI_LEVEL_UP                                   , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_THE_GRAVEYARD_IN_THE_FOURTH_DIMENSION      , 0, gCardAIGraveyard_0808B688                   },
    { KONAMI_TWO_MAN_CELL_BATTLE                        , 0, gCardAISpecialSummonEndPhase_0808B6E0       },
    { KONAMI_BIG_WAVE_SMALL_WAVE                        , 0, gCardAISpecialSummonDestroyAll_0808B750     },
    { KONAMI_GREEN_GADGET                               , 0, gCardAISearch_08087794                      },
    { KONAMI_RED_GADGET                                 , 0, gCardAISearch_08087794                      },
    { KONAMI_YELLOW_GADGET                              , 0, gCardAISearch_08087794                      },
    { KONAMI_SILENT_SWORDSMAN_LV3                       , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_SILENT_SWORDSMAN_LV5                       , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_SILENT_MAGICIAN_LV4                        , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_MAGICIAN_S_CIRCLE                          , 0, gCardAISpecialSummonChangePosition_0808B7DC },
    { KONAMI_THE_CREATOR                                , 0, gCardAISpecialSummonGraveyard_08088360      },
    { KONAMI_THE_CREATOR_INCARNATE                      , 0, gCardAISpecialSummon_0808882C               },
    { KONAMI_ULTIMATE_INSECT_LV3                        , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_DARK_BLADE_THE_DRAGON_KNIGHT               , 0, gCardAIBanishDamage_08088904                },
    { KONAMI_MOKEY_MOKEY_KING                           , 0, gCardAISpecialSummonRevive_0808B874         },
    { KONAMI_MONSTER_REINCARNATION                      , 0, gCardAISearchDiscard_0808B8E8               },
    { KONAMI_LIGHTEN_THE_LOAD                           , 0, gCardAIDraw_0808B940                        },
    { KONAMI_FRUITS_OF_KOZAKY_S_STUDIES_NONE            , 0, gCardAIUnknown_0808A378                     },
    { KONAMI_HAND_OF_NEPHTHYS                           , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_ULTIMATE_INSECT_LV5                        , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_BEHEMOTH_THE_KING_OF_ALL_ANIMALS           , 0, gCardAIReturnToHandGraveyard_0808B988       },
    { KONAMI_HYENA                                      , 0, gCardAISpecialSummonSendToGY_08088214       },
    { KONAMI_THE_LIGHT_HEX_SEALED_FUSION                , 0, gCardAISpecialSummonFusion_0808B9E0         },
    { KONAMI_THE_DARK_HEX_SEALED_FUSION                 , 0, gCardAISpecialSummonFusion_0808B9E0         },
    { KONAMI_THE_EARTH_HEX_SEALED_FUSION                , 0, gCardAISpecialSummonFusion_0808B9E0         },
    { KONAMI_RESCUE_CAT                                 , 0, gCardAISpecialSummonSendToGY_0808BB7C       },
    { KONAMI_KING_DRAGUN                                , 0, gCardAISpecialSummon_08087BA8               },
    { KONAMI_A_FEATHER_OF_THE_PHOENIX                   , 0, gCardAIDiscardGraveyard_0808BC10            },
    { KONAMI_RELEASE_RESTRAINT                          , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_CENTRIFUGAL_FIELD                          , 0, gCardAISpecialSummonSendToGY_0808BC4C       },
    { KONAMI_FULFILLMENT_OF_THE_CONTRACT                , 0, gCardAISpecialSummonBanish_0808BD04         },
    { KONAMI_RE_FUSION                                  , 0, gCardAISpecialSummonBanish_0808BD78         },
    { KONAMI_BEAST_SOUL_SWAP                            , 0, gCardAISpecialSummonReturnToHand_0808BDEC   },
    { KONAMI_VAMPIRE_GENESIS                            , 0, gCardAISpecialSummonDiscard_0808BE6C        },
    { KONAMI_KAIBAMAN                                   , 0, gCardAISpecialSummon_0808882C               },
    { KONAMI_MEGAROCK_DRAGON                            , 0, gCardAISpecialSummonGraveyard_080889C4      },
    { KONAMI_KING_OF_THE_SKULL_SERVANTS                 , 0, gCardAISpecialSummonBanish_0808BFCC         },
    { KONAMI_DOUBLE_ATTACK                              , 0, gCardAIDiscardGraveyard_0808C058            },
    { KONAMI_BATTERY_CHARGER                            , 0, gCardAISpecialSummonDamage_0808C0C8         },
    { KONAMI_HERO_SIGNAL                                , 0, gCardAISpecialSummonSendToGY_0808C154       },
    { KONAMI_LEVEL_CONVERSION_LAB                       , 0, gCardAISendToGYGraveyard_0808C264           },
    { KONAMI_ROCK_BOMBARDMENT                           , 0, gCardAISendToGYDamage_0808C2A0              },
    { KONAMI_INFERNAL_FLAME_EMPEROR                     , 0, gCardAIGraveyardSpecialSummon_08088D2C      },
    { KONAMI_UFOROID                                    , 0, gCardAISpecialSummonSendToGY_0808B454       },
    { KONAMI_WROUGHTWEILER                              , 0, gCardAISearchSendToGY_0808C2F8              },
    { KONAMI_POWER_BOND                                 , 0, gCardAISpecialSummonFusionSummon_0808C350   },
    { KONAMI_SUMMON_PRIEST                              , 0, gCardAISpecialSummonDiscard_0808C3D0        },
    { KONAMI_TRANSCENDENT_WINGS                         , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_BUBBLE_SHUFFLE                             , 0, gCardAISpecialSummonChangePosition_0808C45C },
    { KONAMI_DARK_RULER_VANDALGYON                      , 0, gCardAISpecialSummonGraveyard_08088360      },
    { KONAMI_DES_FROG                                   , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_T_A_D_P_O_L_E                              , 0, gCardAISearch_08087794                      },
    { KONAMI_D_D_M_DIFFERENT_DIMENSION_MASTER           , 0, gCardAISpecialSummonBanish_0808A9B4         },
    { KONAMI_FUSION_RECOVERY                            , 0, gCardAISearchFusionSummon_0808C4A8          },
    { KONAMI_MIRACLE_FUSION                             , 0, gCardAISpecialSummonFusionSummon_0808C4FC   },
    { KONAMI_DRAGON_S_MIRROR                            , 0, gCardAISpecialSummonFusionSummon_0808C5EC   },
    { KONAMI_SPIRITUAL_EARTH_ART_KUROGANE               , 0, gCardAISpecialSummonRevive_0808C6DC         },
    { KONAMI_A_RIVAL_APPEARS                            , 0, gCardAISpecialSummon_0808C790               },
    { KONAMI_GILFORD_THE_LEGEND                         , 0, gCardAISpecialSummonRevive_0808C808         },
    { KONAMI_WARRIOR_LADY_OF_THE_WASTELAND              , 0, gCardAISpecialSummonSendToGY_0808C97C       },
    { KONAMI_DIVINE_SWORD_PHOENIX_BLADE                 , 0, gCardAISearchBoostATK_0808CA64              },
    { KONAMI_LEVEL_MODULATION                           , 0, gCardAISpecialSummonPreventAttack_0808CABC  },
    { KONAMI_HYDROGEDDON                                , 0, gCardAISpecialSummonSendToGY_08088214       },
    { KONAMI_WATER_DRAGON                               , 0, gCardAISpecialSummonSendToGY_0808CB54       },
    { KONAMI_BONDING_H2O                                , 0, gCardAISpecialSummonGraveyard_0808A010      },
    { KONAMI_SCARR_SCOUT_OF_DARK_WORLD                  , 0, gCardAISearchSendToGY_0808CBD4              },
    { KONAMI_POT_OF_AVARICE                             , 0, gCardAIDrawGraveyard_0808CC5C               },
    { KONAMI_BOSS_RUSH                                  , 0, gCardAISpecialSummonSendToGY_0808CCB4       },
    { KONAMI_GATEWAY_TO_DARK_WORLD                      , 0, gCardAISpecialSummonRevive_0808CD34         },
    { KONAMI_THE_FORCES_OF_DARKNESS                     , 0, gCardAIReturnToHandGraveyard_0808CDC0       },
    { KONAMI_THE_LEAGUE_OF_UNIFORM_NOMENCLATURE         , 0, gCardAISpecialSummon_080899E8               },
    { KONAMI_ROLL_OUT                                   , 0, gCardAIGraveyardEquip_0808CE3C              },
    { KONAMI_ARMED_CHANGER                              , 0, gCardAISearchSendToGY_0808CF88              },
    { KONAMI_MAGICAL_MALLET                             , 0, gCardAIDraw_0808D054                        },
    { KONAMI_INFERNO_RECKLESS_SUMMON                    , 0, gCardAISpecialSummonChangePosition_0808D060 },
    { KONAMI_WHITE_HORNS_D                              , 0, gCardAISpecialSummonBoostATK_0808D1BC       },
    { KONAMI_HERO_KID                                   , 0, gCardAISpecialSummonSendToGY_08088214       },
    { KONAMI_MAGNET_CIRCLE_LV2                          , 0, gCardAISpecialSummon_0808D224               },
    { KONAMI_ANCIENT_GEAR_DRILL                         , 0, gCardAIDiscard_0808D294                     },
    { KONAMI_PHOTON_GENERATOR_UNIT                      , 0, gCardAISpecialSummonGraveyard_0808A010      },
    { KONAMI_ATTACK_REFLECTOR_UNIT                      , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_DAMAGE_CONDENSER                           , 0, gCardAISpecialSummonDiscard_0808D324        },
    { KONAMI_D_D_GUIDE                                  , 0, gCardAIGraveyardBanish_08089338             },
    { KONAMI_GOKIPON                                    , 0, gCardAISearchSendToGY_0808D3D8              },
    { KONAMI_DOOM_DOZER                                 , 0, gCardAISpecialSummonGraveyard_080889C4      },
    { KONAMI_SYMBOL_OF_HERITAGE                         , 0, gCardAISpecialSummonDestroy_0808D494        },
    { KONAMI_TRIAL_OF_THE_PRINCESSES                    , 0, gCardAISpecialSummonGraveyard_080872E4      },
    { KONAMI_NEXT_TO_BE_LOST                            , 0, gCardAISearchSendToGY_0808D5B0              },
    { KONAMI_GENERATION_SHIFT                           , 0, gCardAISearchSendToGY_0808D5B0              },
    { KONAMI_THE_FLUTE_OF_SUMMONING_KURIBOH             , 0, gCardAISearchSpecialSummon_0808D694         },
    { 0xFFFE                                            , 0, sub_0808D704                                },
    { 0xFFFF                                            , 0, sub_0808D7F4                                },
};
