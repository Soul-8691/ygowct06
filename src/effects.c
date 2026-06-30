#include "card.h"
#include "effects.h"

// Forward declarations for effect functions
extern void gCardEffectBanishBoostATK_080576B0(void);
extern void gCardEffectBanishBoostATK_0805EFB8(void);
extern void gCardEffectBanishBoostATK_08060FE8(void);
extern void gCardEffectBanishBoostATK_08070478(void);
extern void gCardEffectBanishBoostATK_08076C90(void);
extern void gCardEffectBanishChangePosition_080777B0(void);
extern void gCardEffectBanishDamage_08055524(void);
extern void gCardEffectBanishDamage_08057588(void);
extern void gCardEffectBanishDamage_0805759C(void);
extern void gCardEffectBanishDamage_0805ED4C(void);
extern void gCardEffectBanishDamage_0805ED74(void);
extern void gCardEffectBanishDamage_08062F38(void);
extern void gCardEffectBanishDamage_080637C0(void);
extern void gCardEffectBanishDamage_0807CA84(void);
extern void gCardEffectBanishDestroyAll_0806121C(void);
extern void gCardEffectBanishDestroySpellTrap_08051C3C(void);
extern void gCardEffectBanishDestroy_08051BFC(void);
extern void gCardEffectBanishDestroy_08052F10(void);
extern void gCardEffectBanishDestroy_08057874(void);
extern void gCardEffectBanishDestroy_0805F0D8(void);
extern void gCardEffectBanishDestroy_080638D8(void);
extern void gCardEffectBanishDestroy_0806BF68(void);
extern void gCardEffectBanishDestroy_0807097C(void);
extern void gCardEffectBanishDestroy_08074834(void);
extern void gCardEffectBanishDestroy_0807CE50(void);
extern void gCardEffectBanishDestroy_08084F40(void);
extern void gCardEffectBanishDiscard_0807EC10(void);
extern void gCardEffectBanishEndPhase_08060270(void);
extern void gCardEffectBanishEndPhase_080744F8(void);
extern void gCardEffectBanishEndPhase_08084418(void);
extern void gCardEffectBanishGraveyard_080587E0(void);
extern void gCardEffectBanishGraveyard_0805D740(void);
extern void gCardEffectBanishGraveyard_0805F23C(void);
extern void gCardEffectBanishGraveyard_08060E5C(void);
extern void gCardEffectBanishGraveyard_08061338(void);
extern void gCardEffectBanishGraveyard_08062048(void);
extern void gCardEffectBanishGraveyard_08064314(void);
extern void gCardEffectBanishGraveyard_08069C68(void);
extern void gCardEffectBanishGraveyard_08070CA4(void);
extern void gCardEffectBanishGraveyard_08074854(void);
extern void gCardEffectBanishGraveyard_080769FC(void);
extern void gCardEffectBanishGraveyard_08077414(void);
extern void gCardEffectBanishGraveyard_08079BDC(void);
extern void gCardEffectBanishGraveyard_0807E6E0(void);
extern void gCardEffectBanishReturnToHand_08069008(void);
extern void gCardEffectBanishSendToGY_0805F8F4(void);
extern void gCardEffectBanishSendToGY_08072404(void);
extern void gCardEffectBanishSpecialSummon_08076DE0(void);
extern void gCardEffectBanishStandbyPhase_08052820(void);
extern void gCardEffectBanishStandbyPhase_0805E958(void);
extern void gCardEffectBanishStandbyPhase_0806EA00(void);
extern void gCardEffectBanishStandbyPhase_08083824(void);
extern void gCardEffectBanish_080666F4(void);
extern void gCardEffectBanish_08077118(void);
extern void gCardEffectBattlePhaseDamage_0805E55C(void);
extern void gCardEffectBattlePhase_08060D08(void);
extern void gCardEffectBattlePhase_0807678C(void);
extern void gCardEffectBoostATKBoostDEF_08058CEC(void);
extern void gCardEffectBoostATKBoostDEF_0805C6B0(void);
extern void gCardEffectBoostATKBoostDEF_0805E450(void);
extern void gCardEffectBoostATKBoostDEF_0805E4B0(void);
extern void gCardEffectBoostATKBoostDEF_08064760(void);
extern void gCardEffectBoostATKBoostDEF_08066338(void);
extern void gCardEffectBoostATKBoostDEF_0806678C(void);
extern void gCardEffectBoostATKBoostDEF_080679D8(void);
extern void gCardEffectBoostATKBoostDEF_0806C6D8(void);
extern void gCardEffectBoostATKBoostDEF_0806D514(void);
extern void gCardEffectBoostATKBoostDEF_08082290(void);
extern void gCardEffectBoostATKBoostDEF_08082510(void);
extern void gCardEffectBoostATKBoostDEF_08084318(void);
extern void gCardEffectBoostATKDamage_0805735C(void);
extern void gCardEffectBoostATKDamage_0805E3EC(void);
extern void gCardEffectBoostATKDamage_0806D6C0(void);
extern void gCardEffectBoostATKEndPhase_08076EBC(void);
extern void gCardEffectBoostATKEquip_08084674(void);
extern void gCardEffectBoostATKGraveyard_0805F1B0(void);
extern void gCardEffectBoostATKReduceATK_08067F90(void);
extern void gCardEffectBoostATKReduceATK_0806D2F0(void);
extern void gCardEffectBoostATKReduceATK_08083450(void);
extern void gCardEffectBoostATKSpecialSummon_0805086C(void);
extern void gCardEffectBoostATKTribute_08056578(void);
extern void gCardEffectBoostATKTribute_0805C468(void);
extern void gCardEffectBoostATKTribute_08077E00(void);
extern void gCardEffectBoostATK_08054BEC(void);
extern void gCardEffectBoostATK_0805F3E8(void);
extern void gCardEffectBoostATK_08062C54(void);
extern void gCardEffectBoostATK_08071404(void);
extern void gCardEffectBoostATK_0807B418(void);
extern void gCardEffectBoostATK_08084144(void);
extern void gCardEffectBoostDEFGainLP_0805EDC0(void);
extern void gCardEffectChangePositionBanish_08052884(void);
extern void gCardEffectChangePositionBanish_0805402C(void);
extern void gCardEffectChangePositionBoostDEF_0805DF44(void);
extern void gCardEffectChangePositionBoostDEF_0806BA78(void);
extern void gCardEffectChangePositionDestroy_0805C40C(void);
extern void gCardEffectChangePositionDestroy_0805ED90(void);
extern void gCardEffectChangePositionEndPhase_08050C58(void);
extern void gCardEffectChangePositionEndPhase_08068B58(void);
extern void gCardEffectChangePositionEquip_08060484(void);
extern void gCardEffectChangePositionEquip_08074B2C(void);
extern void gCardEffectChangePositionFlip_0805440C(void);
extern void gCardEffectChangePositionFlip_0805E9BC(void);
extern void gCardEffectChangePositionFlip_08068C9C(void);
extern void gCardEffectChangePositionFlip_0806ECB0(void);
extern void gCardEffectChangePositionRNG_08063954(void);
extern void gCardEffectChangePositionRNG_0807D014(void);
extern void gCardEffectChangePositionSpecialSummon_0805E09C(void);
extern void gCardEffectChangePositionSpecialSummon_0807051C(void);
extern void gCardEffectChangePositionStandbyPhase_0805DA04(void);
extern void gCardEffectChangePositionStandbyPhase_0806A7C4(void);
extern void gCardEffectChangePositionTribute_08068F78(void);
extern void gCardEffectChangePosition_080500C8(void);
extern void gCardEffectChangePosition_08051364(void);
extern void gCardEffectChangePosition_08051924(void);
extern void gCardEffectChangePosition_080534B8(void);
extern void gCardEffectChangePosition_080543B4(void);
extern void gCardEffectChangePosition_08054614(void);
extern void gCardEffectChangePosition_08057FCC(void);
extern void gCardEffectChangePosition_0805FA24(void);
extern void gCardEffectChangePosition_0805FAD0(void);
extern void gCardEffectChangePosition_080665C0(void);
extern void gCardEffectChangePosition_08066A94(void);
extern void gCardEffectChangePosition_08066B10(void);
extern void gCardEffectChangePosition_080671E8(void);
extern void gCardEffectChangePosition_08068CD8(void);
extern void gCardEffectChangePosition_0806A4BC(void);
extern void gCardEffectChangePosition_0806D0CC(void);
extern void gCardEffectChangePosition_0807142C(void);
extern void gCardEffectChangePosition_08072890(void);
extern void gCardEffectChangePosition_080728D4(void);
extern void gCardEffectChangePosition_08072B7C(void);
extern void gCardEffectChangePosition_08077920(void);
extern void gCardEffectChangePosition_080784B4(void);
extern void gCardEffectChangePosition_08079500(void);
extern void gCardEffectChangePosition_08079594(void);
extern void gCardEffectCounterDestroy_080585C4(void);
extern void gCardEffectCounterDestroy_08058684(void);
extern void gCardEffectCounter_08060908(void);
extern void gCardEffectCounter_080754B8(void);
extern void gCardEffectDamageBattlePhase_080618D4(void);
extern void gCardEffectDamageBattlePhase_080780F0(void);
extern void gCardEffectDamageBattlePhase_0807E5A4(void);
extern void gCardEffectDamageChangePosition_08054EA8(void);
extern void gCardEffectDamageChangePosition_08058778(void);
extern void gCardEffectDamageChangePosition_080605B8(void);
extern void gCardEffectDamageChangePosition_080632FC(void);
extern void gCardEffectDamageChangePosition_0806A548(void);
extern void gCardEffectDamageChangePosition_0807C158(void);
extern void gCardEffectDamageDirectAttack_0805CB1C(void);
extern void gCardEffectDamageDiscard_0805CD88(void);
extern void gCardEffectDamageEndPhase_080512C0(void);
extern void gCardEffectDamageEndPhase_080696F4(void);
extern void gCardEffectDamageFlip_080566F4(void);
extern void gCardEffectDamageFlip_0807290C(void);
extern void gCardEffectDamageGraveyard_080565E8(void);
extern void gCardEffectDamageGraveyard_08057FF4(void);
extern void gCardEffectDamageGraveyard_0805DDDC(void);
extern void gCardEffectDamageGraveyard_080613B4(void);
extern void gCardEffectDamageGraveyard_08062470(void);
extern void gCardEffectDamageGraveyard_08063894(void);
extern void gCardEffectDamageGraveyard_080655EC(void);
extern void gCardEffectDamageGraveyard_0806B56C(void);
extern void gCardEffectDamageGraveyard_080718C4(void);
extern void gCardEffectDamagePreventAttack_0807A0F4(void);
extern void gCardEffectDamageRNG_0807B6B8(void);
extern void gCardEffectDamageReturnToHand_0805465C(void);
extern void gCardEffectDamageSearch_0805C318(void);
extern void gCardEffectDamageSearch_08063850(void);
extern void gCardEffectDamageSendToGY_080833A8(void);
extern void gCardEffectDamageStandbyPhase_0805DE7C(void);
extern void gCardEffectDamageStandbyPhase_0805E048(void);
extern void gCardEffectDamageStandbyPhase_0806C204(void);
extern void gCardEffectDamageStandbyPhase_08072228(void);
extern void gCardEffectDamageStandbyPhase_08075328(void);
extern void gCardEffectDamageTribute_080500AC(void);
extern void gCardEffectDamageTribute_08053CC4(void);
extern void gCardEffectDamage_08054088(void);
extern void gCardEffectDamage_08055318(void);
extern void gCardEffectDamage_0805635C(void);
extern void gCardEffectDamage_0805847C(void);
extern void gCardEffectDamage_08058F90(void);
extern void gCardEffectDamage_0805EDF0(void);
extern void gCardEffectDamage_08060044(void);
extern void gCardEffectDamage_08060640(void);
extern void gCardEffectDamage_08061BA8(void);
extern void gCardEffectDamage_08062A9C(void);
extern void gCardEffectDamage_08067334(void);
extern void gCardEffectDamage_08068BF4(void);
extern void gCardEffectDamage_08073AB0(void);
extern void gCardEffectDamage_08073E94(void);
extern void gCardEffectDamage_08076454(void);
extern void gCardEffectDamage_0807CC2C(void);
extern void gCardEffectDamage_08081DB0(void);
extern void gCardEffectDestroyAllBoostATK_08063C50(void);
extern void gCardEffectDestroyAllBoostATK_08078F7C(void);
extern void gCardEffectDestroyAllBoostATK_0807D36C(void);
extern void gCardEffectDestroyAllChangePosition_08051DD8(void);
extern void gCardEffectDestroyAllChangePosition_0805CE30(void);
extern void gCardEffectDestroyAllChangePosition_080660D8(void);
extern void gCardEffectDestroyAllCounter_080608E0(void);
extern void gCardEffectDestroyAllDamage_080532B8(void);
extern void gCardEffectDestroyAllDamage_0805501C(void);
extern void gCardEffectDestroyAllDamage_08056BA0(void);
extern void gCardEffectDestroyAllDamage_0805CA94(void);
extern void gCardEffectDestroyAllDamage_0805F6E4(void);
extern void gCardEffectDestroyAllDamage_08061AC0(void);
extern void gCardEffectDestroyAllDamage_08065D78(void);
extern void gCardEffectDestroyAllDamage_0806843C(void);
extern void gCardEffectDestroyAllDamage_0806E6F8(void);
extern void gCardEffectDestroyAllDamage_080718D0(void);
extern void gCardEffectDestroyAllDamage_0807C1A8(void);
extern void gCardEffectDestroyAllEquip_08053AF8(void);
extern void gCardEffectDestroyAllFlip_080529A8(void);
extern void gCardEffectDestroyAllRNG_080789B0(void);
extern void gCardEffectDestroyAllSpecialSummon_08054234(void);
extern void gCardEffectDestroyAllStandbyPhase_08052F6C(void);
extern void gCardEffectDestroyAllStandbyPhase_08070AC0(void);
extern void gCardEffectDestroyAllTribute_08053294(void);
extern void gCardEffectDestroyAllTribute_08059A78(void);
extern void gCardEffectDestroyAllTribute_08062F60(void);
extern void gCardEffectDestroyAllTribute_08067C0C(void);
extern void gCardEffectDestroyAll_08050750(void);
extern void gCardEffectDestroyAll_08050A54(void);
extern void gCardEffectDestroyAll_08055138(void);
extern void gCardEffectDestroyAll_0805FBE0(void);
extern void gCardEffectDestroyAll_080611D0(void);
extern void gCardEffectDestroyAll_080637F4(void);
extern void gCardEffectDestroyAll_0807822C(void);
extern void gCardEffectDestroyBattlePhase_0805EF10(void);
extern void gCardEffectDestroyBattlePhase_080701A4(void);
extern void gCardEffectDestroyBoostATK_08051FD0(void);
extern void gCardEffectDestroyBoostATK_0805953C(void);
extern void gCardEffectDestroyBoostATK_0806153C(void);
extern void gCardEffectDestroyBoostATK_0806D5B0(void);
extern void gCardEffectDestroyBoostATK_08070274(void);
extern void gCardEffectDestroyBoostATK_08072154(void);
extern void gCardEffectDestroyBoostATK_0807AC1C(void);
extern void gCardEffectDestroyBoostDEF_08054898(void);
extern void gCardEffectDestroyChangePosition_080511B0(void);
extern void gCardEffectDestroyChangePosition_08051200(void);
extern void gCardEffectDestroyChangePosition_08051E24(void);
extern void gCardEffectDestroyChangePosition_08052954(void);
extern void gCardEffectDestroyChangePosition_08053C00(void);
extern void gCardEffectDestroyChangePosition_0805474C(void);
extern void gCardEffectDestroyChangePosition_08054DF4(void);
extern void gCardEffectDestroyChangePosition_080554C4(void);
extern void gCardEffectDestroyChangePosition_0805CAF0(void);
extern void gCardEffectDestroyChangePosition_0805D998(void);
extern void gCardEffectDestroyChangePosition_0805DFA0(void);
extern void gCardEffectDestroyChangePosition_0805F1CC(void);
extern void gCardEffectDestroyChangePosition_0805F9A4(void);
extern void gCardEffectDestroyChangePosition_080619C0(void);
extern void gCardEffectDestroyChangePosition_080622DC(void);
extern void gCardEffectDestroyChangePosition_08066C40(void);
extern void gCardEffectDestroyChangePosition_08067EA0(void);
extern void gCardEffectDestroyChangePosition_080684E0(void);
extern void gCardEffectDestroyChangePosition_0806BB74(void);
extern void gCardEffectDestroyChangePosition_0806ED20(void);
extern void gCardEffectDestroyChangePosition_08070AA4(void);
extern void gCardEffectDestroyChangePosition_08072870(void);
extern void gCardEffectDestroyChangePosition_08076AE8(void);
extern void gCardEffectDestroyChangePosition_08078158(void);
extern void gCardEffectDestroyChangePosition_0807AA98(void);
extern void gCardEffectDestroyChangePosition_0807BB30(void);
extern void gCardEffectDestroyChangePosition_0807C660(void);
extern void gCardEffectDestroyCounter_08051898(void);
extern void gCardEffectDestroyCounter_080552A0(void);
extern void gCardEffectDestroyCounter_080585E8(void);
extern void gCardEffectDestroyCounter_08059814(void);
extern void gCardEffectDestroyCounter_08060788(void);
extern void gCardEffectDestroyCounter_08060800(void);
extern void gCardEffectDestroyCounter_08062D28(void);
extern void gCardEffectDestroyCounter_0807500C(void);
extern void gCardEffectDestroyCounter_080752CC(void);
extern void gCardEffectDestroyCounter_0807AC84(void);
extern void gCardEffectDestroyCounter_0807E5D4(void);
extern void gCardEffectDestroyCounter_08084594(void);
extern void gCardEffectDestroyDamage_08051F60(void);
extern void gCardEffectDestroyDamage_08052AA8(void);
extern void gCardEffectDestroyDamage_08056BC4(void);
extern void gCardEffectDestroyDamage_0805E734(void);
extern void gCardEffectDestroyDamage_0805E744(void);
extern void gCardEffectDestroyDamage_0805F614(void);
extern void gCardEffectDestroyDamage_080606CC(void);
extern void gCardEffectDestroyDamage_08064028(void);
extern void gCardEffectDestroyDamage_0806D224(void);
extern void gCardEffectDestroyDamage_0806E1C4(void);
extern void gCardEffectDestroyDamage_0807158C(void);
extern void gCardEffectDestroyDamage_08074FB8(void);
extern void gCardEffectDestroyDamage_08077538(void);
extern void gCardEffectDestroyDamage_0807DCF8(void);
extern void gCardEffectDestroyDamage_0808416C(void);
extern void gCardEffectDestroyDamage_0808527C(void);
extern void gCardEffectDestroyDamage_080904F0(void);
extern void gCardEffectDestroyDiscard_08055360(void);
extern void gCardEffectDestroyEndPhase_080502B0(void);
extern void gCardEffectDestroyEndPhase_08052398(void);
extern void gCardEffectDestroyEquip_080521A0(void);
extern void gCardEffectDestroyEquip_0805CA50(void);
extern void gCardEffectDestroyEquip_0805F088(void);
extern void gCardEffectDestroyEquip_08068350(void);
extern void gCardEffectDestroyEquip_0807076C(void);
extern void gCardEffectDestroyFlip_0804F440(void);
extern void gCardEffectDestroyFlip_0805214C(void);
extern void gCardEffectDestroyFlip_0805C660(void);
extern void gCardEffectDestroyFlip_08066448(void);
extern void gCardEffectDestroyFlip_080674B8(void);
extern void gCardEffectDestroyFlip_08067594(void);
extern void gCardEffectDestroyFlip_08074F74(void);
extern void gCardEffectDestroyFlip_08081F28(void);
extern void gCardEffectDestroyGainLP_08070EF4(void);
extern void gCardEffectDestroyGraveyard_08058828(void);
extern void gCardEffectDestroyGraveyard_08060EA8(void);
extern void gCardEffectDestroyPreventAttack_0804F5C4(void);
extern void gCardEffectDestroyPreventAttack_0806D680(void);
extern void gCardEffectDestroyPreventAttack_080824A4(void);
extern void gCardEffectDestroyPreventAttack_08082E98(void);
extern void gCardEffectDestroyRNG_0805C1C0(void);
extern void gCardEffectDestroyRNG_08068618(void);
extern void gCardEffectDestroyRNG_0807B9F4(void);
extern void gCardEffectDestroyReduceATK_08051614(void);
extern void gCardEffectDestroyReduceATK_0806CE68(void);
extern void gCardEffectDestroyReduceATK_08084D08(void);
extern void gCardEffectDestroySendToGY_0805577C(void);
extern void gCardEffectDestroySpecialSummon_080513D0(void);
extern void gCardEffectDestroySpecialSummon_080517B4(void);
extern void gCardEffectDestroySpecialSummon_080563A4(void);
extern void gCardEffectDestroySpecialSummon_0805CF1C(void);
extern void gCardEffectDestroySpecialSummon_08061110(void);
extern void gCardEffectDestroySpecialSummon_08082744(void);
extern void gCardEffectDestroySpellTrapCounter_0805A00C(void);
extern void gCardEffectDestroySpellTrapCounter_08063DF4(void);
extern void gCardEffectDestroySpellTrapDamage_0805F628(void);
extern void gCardEffectDestroySpellTrapDamage_080715AC(void);
extern void gCardEffectDestroySpellTrapDestroyAll_08051998(void);
extern void gCardEffectDestroySpellTrapDestroyAll_08051ABC(void);
extern void gCardEffectDestroySpellTrapDestroyAll_08054154(void);
extern void gCardEffectDestroySpellTrapEndPhase_08072D20(void);
extern void gCardEffectDestroySpellTrapFlip_08050214(void);
extern void gCardEffectDestroySpellTrapSpecialSummon_08050D78(void);
extern void gCardEffectDestroySpellTrapTribute_08061E98(void);
extern void gCardEffectDestroySpellTrapTribute_08084750(void);
extern void gCardEffectDestroySpellTrap_08051B20(void);
extern void gCardEffectDestroySpellTrap_08051E94(void);
extern void gCardEffectDestroySpellTrap_08054118(void);
extern void gCardEffectDestroySpellTrap_0805C818(void);
extern void gCardEffectDestroySpellTrap_08067FA4(void);
extern void gCardEffectDestroySpellTrap_0806C828(void);
extern void gCardEffectDestroyStandbyPhase_080526CC(void);
extern void gCardEffectDestroyStandbyPhase_0806E070(void);
extern void gCardEffectDestroyStandbyPhase_080730E0(void);
extern void gCardEffectDestroyTribute_0805018C(void);
extern void gCardEffectDestroyTribute_08053704(void);
extern void gCardEffectDestroyTribute_0805663C(void);
extern void gCardEffectDestroyTribute_0805C598(void);
extern void gCardEffectDestroyTribute_08061D5C(void);
extern void gCardEffectDestroyTribute_08066DAC(void);
extern void gCardEffectDestroyTribute_0807965C(void);
extern void gCardEffectDestroyTribute_08081E10(void);
extern void gCardEffectDestroy_0804F550(void);
extern void gCardEffectDestroy_080507AC(void);
extern void gCardEffectDestroy_08050810(void);
extern void gCardEffectDestroy_08050924(void);
extern void gCardEffectDestroy_08050994(void);
extern void gCardEffectDestroy_080515A8(void);
extern void gCardEffectDestroy_08053110(void);
extern void gCardEffectDestroy_08053760(void);
extern void gCardEffectDestroy_08053B84(void);
extern void gCardEffectDestroy_08054284(void);
extern void gCardEffectDestroy_08058858(void);
extern void gCardEffectDestroy_0805CF3C(void);
extern void gCardEffectDestroy_0805E188(void);
extern void gCardEffectDestroy_0805EC00(void);
extern void gCardEffectDestroy_080605F0(void);
extern void gCardEffectDestroy_0806231C(void);
extern void gCardEffectDestroy_08063E34(void);
extern void gCardEffectDestroy_08064654(void);
extern void gCardEffectDestroy_08064660(void);
extern void gCardEffectDestroy_08069984(void);
extern void gCardEffectDestroy_08069B5C(void);
extern void gCardEffectDestroy_0806CBE8(void);
extern void gCardEffectDestroy_0806F1C8(void);
extern void gCardEffectDestroy_0806F5D0(void);
extern void gCardEffectDestroy_080749E0(void);
extern void gCardEffectDestroy_08074CE4(void);
extern void gCardEffectDestroy_08075CB0(void);
extern void gCardEffectDestroy_08076E20(void);
extern void gCardEffectDestroy_080779BC(void);
extern void gCardEffectDestroy_0808198C(void);
extern void gCardEffectDestroy_080827D4(void);
extern void gCardEffectDestroy_080839B4(void);
extern void gCardEffectDirectAttackDiscard_08069104(void);
extern void gCardEffectDirectAttack_08054570(void);
extern void gCardEffectDirectAttack_0805FC94(void);
extern void gCardEffectDirectAttack_08060D48(void);
extern void gCardEffectDirectAttack_08062BE8(void);
extern void gCardEffectDirectAttack_08063020(void);
extern void gCardEffectDirectAttack_080732FC(void);
extern void gCardEffectDiscardBattlePhase_0805F510(void);
extern void gCardEffectDiscardBoostATK_0805F49C(void);
extern void gCardEffectDiscardChangePosition_0805DAA4(void);
extern void gCardEffectDiscardChangePosition_0806A9A4(void);
extern void gCardEffectDiscardDamage_08057470(void);
extern void gCardEffectDiscardDamage_0805C33C(void);
extern void gCardEffectDiscardDamage_0805EBC4(void);
extern void gCardEffectDiscardDamage_08063F68(void);
extern void gCardEffectDiscardDamage_08066314(void);
extern void gCardEffectDiscardDamage_0806A954(void);
extern void gCardEffectDiscardDamage_0806EF88(void);
extern void gCardEffectDiscardDamage_0807A3B8(void);
extern void gCardEffectDiscardDamage_0807AB6C(void);
extern void gCardEffectDiscardDamage_0807D7D0(void);
extern void gCardEffectDiscardDamage_0807DB14(void);
extern void gCardEffectDiscardDestroyAll_08051F04(void);
extern void gCardEffectDiscardDestroyAll_08054518(void);
extern void gCardEffectDiscardDestroyAll_08054ACC(void);
extern void gCardEffectDiscardDestroyAll_08054BA0(void);
extern void gCardEffectDiscardDestroyAll_0805DA74(void);
extern void gCardEffectDiscardDestroyAll_080607EC(void);
extern void gCardEffectDiscardDestroyAll_08061E04(void);
extern void gCardEffectDiscardDestroyAll_08078EC8(void);
extern void gCardEffectDiscardDestroySpellTrap_08060E24(void);
extern void gCardEffectDiscardDestroySpellTrap_08062AC8(void);
extern void gCardEffectDiscardDestroySpellTrap_0807B240(void);
extern void gCardEffectDiscardDestroy_08055078(void);
extern void gCardEffectDiscardDestroy_080665A4(void);
extern void gCardEffectDiscardDestroy_0806D770(void);
extern void gCardEffectDiscardDestroy_0807DA70(void);
extern void gCardEffectDiscardEndPhase_08070D00(void);
extern void gCardEffectDiscardGraveyard_08054B80(void);
extern void gCardEffectDiscardGraveyard_08058E44(void);
extern void gCardEffectDiscardGraveyard_080596EC(void);
extern void gCardEffectDiscardGraveyard_0805D7A4(void);
extern void gCardEffectDiscardGraveyard_080600B4(void);
extern void gCardEffectDiscardGraveyard_080609D0(void);
extern void gCardEffectDiscardGraveyard_08062888(void);
extern void gCardEffectDiscardGraveyard_080632CC(void);
extern void gCardEffectDiscardGraveyard_08067750(void);
extern void gCardEffectDiscardGraveyard_0806A118(void);
extern void gCardEffectDiscardGraveyard_0806A8BC(void);
extern void gCardEffectDiscardGraveyard_08071F58(void);
extern void gCardEffectDiscardGraveyard_08073EB0(void);
extern void gCardEffectDiscardGraveyard_0807AE84(void);
extern void gCardEffectDiscardGraveyard_08084CEC(void);
extern void gCardEffectDiscardReturnToHand_08054364(void);
extern void gCardEffectDiscardReturnToHand_08057458(void);
extern void gCardEffectDiscardReturnToHand_0805E6F4(void);
extern void gCardEffectDiscardReturnToHand_080618B4(void);
extern void gCardEffectDiscardReturnToHand_0806E118(void);
extern void gCardEffectDiscardSearch_0805652C(void);
extern void gCardEffectDiscardSendToGY_08061B54(void);
extern void gCardEffectDiscardSendToGY_080628F0(void);
extern void gCardEffectDiscardSendToGY_08072A74(void);
extern void gCardEffectDiscardSendToGY_08072FD4(void);
extern void gCardEffectDiscardSendToGY_08078550(void);
extern void gCardEffectDiscardSendToGY_0807AEF4(void);
extern void gCardEffectDiscardSpecialSummon_080587C0(void);
extern void gCardEffectDiscardSpecialSummon_08059BE0(void);
extern void gCardEffectDiscard_08056380(void);
extern void gCardEffectDiscard_0805C1E4(void);
extern void gCardEffectDiscard_0805DE50(void);
extern void gCardEffectDiscard_080641B8(void);
extern void gCardEffectDiscard_0806B60C(void);
extern void gCardEffectDiscard_0807AF28(void);
extern void gCardEffectDiscard_0807BB8C(void);
extern void gCardEffectDiscard_0807E398(void);
extern void gCardEffectDrawBanish_080583BC(void);
extern void gCardEffectDrawBanish_0805FD3C(void);
extern void gCardEffectDrawBanish_08061244(void);
extern void gCardEffectDrawCounter_080607B4(void);
extern void gCardEffectDrawDestroy_08060388(void);
extern void gCardEffectDrawDestroy_0807BBCC(void);
extern void gCardEffectDrawDiscard_0805CDD8(void);
extern void gCardEffectDrawDiscard_0805F644(void);
extern void gCardEffectDrawDiscard_0805F8B4(void);
extern void gCardEffectDrawDiscard_0805FAEC(void);
extern void gCardEffectDrawDiscard_08067614(void);
extern void gCardEffectDrawDiscard_08069148(void);
extern void gCardEffectDrawDiscard_080695D4(void);
extern void gCardEffectDrawDiscard_0806C3D8(void);
extern void gCardEffectDrawDiscard_08071604(void);
extern void gCardEffectDrawDiscard_080716FC(void);
extern void gCardEffectDrawDiscard_080723D0(void);
extern void gCardEffectDrawDiscard_08072BFC(void);
extern void gCardEffectDrawDiscard_08077ECC(void);
extern void gCardEffectDrawFlip_0807AD14(void);
extern void gCardEffectDrawGainLP_0806A884(void);
extern void gCardEffectDrawGraveyard_08062EFC(void);
extern void gCardEffectDrawGraveyard_08071A94(void);
extern void gCardEffectDrawGraveyard_0807D970(void);
extern void gCardEffectDrawRNG_0805DEAC(void);
extern void gCardEffectDrawRNG_0806B694(void);
extern void gCardEffectDrawSearch_080636F8(void);
extern void gCardEffectDrawSearch_0807C7F0(void);
extern void gCardEffectDrawSendToGY_080544D4(void);
extern void gCardEffectDrawSendToGY_08061988(void);
extern void gCardEffectDrawSendToGY_08061D78(void);
extern void gCardEffectDrawSendToGY_08078004(void);
extern void gCardEffectDrawSendToGY_08078C3C(void);
extern void gCardEffectDrawSpecialSummon_080620C0(void);
extern void gCardEffectDrawSpecialSummon_0806348C(void);
extern void gCardEffectDrawSpecialSummon_08071BDC(void);
extern void gCardEffectDrawSpecialSummon_08079F5C(void);
extern void gCardEffectDraw_080525D0(void);
extern void gCardEffectDraw_0805888C(void);
extern void gCardEffectDraw_0805CF98(void);
extern void gCardEffectDraw_0805DE10(void);
extern void gCardEffectDraw_0805EAE8(void);
extern void gCardEffectDraw_08062934(void);
extern void gCardEffectDraw_080656E0(void);
extern void gCardEffectDraw_0806EE54(void);
extern void gCardEffectDraw_080732A8(void);
extern void gCardEffectDraw_080741F8(void);
extern void gCardEffectDraw_0807AF68(void);
extern void gCardEffectDraw_0807DD68(void);
extern void gCardEffectEndPhaseBoostATK_08069DF8(void);
extern void gCardEffectEndPhaseBoostATK_0806E780(void);
extern void gCardEffectEndPhaseDestroy_080541CC(void);
extern void gCardEffectEndPhaseSpecialSummon_0806244C(void);
extern void gCardEffectEndPhase_08055590(void);
extern void gCardEffectEndPhase_08063830(void);
extern void gCardEffectEndPhase_08075F90(void);
extern void gCardEffectEndPhase_0807615C(void);
extern void gCardEffectEndPhase_0807A580(void);
extern void gCardEffectEquipBoostATK_0805000C(void);
extern void gCardEffectEquipBoostATK_08064678(void);
extern void gCardEffectEquipBoostATK_08081C54(void);
extern void gCardEffectEquip_08051A08(void);
extern void gCardEffectEquip_08056558(void);
extern void gCardEffectEquip_0805C394(void);
extern void gCardEffectEquip_0806AA64(void);
extern void gCardEffectEquip_0806DA84(void);
extern void gCardEffectEquip_08082D0C(void);
extern void gCardEffectEquip_08083C98(void);
extern void gCardEffectFlipCounter_08055248(void);
extern void gCardEffectFlipCounter_08075074(void);
extern void gCardEffectFlipDestroy_0805C680(void);
extern void gCardEffectFlip_080665D4(void);
extern void gCardEffectFusionSummonDiscard_08059EC0(void);
extern void gCardEffectFusionSummonDiscard_08063AB0(void);
extern void gCardEffectFusionSummonNegate_08071170(void);
extern void gCardEffectFusionSummonNegate_0807136C(void);
extern void gCardEffectFusionSummonTakeControl_08063D38(void);
extern void gCardEffectFusionSummonTakeControl_0807D65C(void);
extern void gCardEffectGainLPDamage_0805E30C(void);
extern void gCardEffectGainLPDamage_0805F85C(void);
extern void gCardEffectGainLPDamage_0806D2D0(void);
extern void gCardEffectGainLPDraw_08081D9C(void);
extern void gCardEffectGainLPGraveyard_0806F5A4(void);
extern void gCardEffectGainLPStandbyPhase_0805E170(void);
extern void gCardEffectGainLPStandbyPhase_0806C808(void);
extern void gCardEffectGainLPStandbyPhase_0806F500(void);
extern void gCardEffectGainLP_0805F3A4(void);
extern void gCardEffectGainLP_08071284(void);
extern void gCardEffectGainLP_08081CE8(void);
extern void gCardEffectGraveyardBanish_0805CFEC(void);
extern void gCardEffectGraveyardBanish_080829BC(void);
extern void gCardEffectGraveyardDamage_08078954(void);
extern void gCardEffectGraveyardDiscard_080619F0(void);
extern void gCardEffectGraveyardDraw_0805DF14(void);
extern void gCardEffectGraveyardDraw_0806131C(void);
extern void gCardEffectGraveyardEquip_080548EC(void);
extern void gCardEffectGraveyardEquip_08063B68(void);
extern void gCardEffectGraveyardEquip_08075668(void);
extern void gCardEffectGraveyardEquip_0807DB5C(void);
extern void gCardEffectGraveyardSearch_08059F2C(void);
extern void gCardEffectGraveyardSearch_08066530(void);
extern void gCardEffectGraveyardSearch_08075A7C(void);
extern void gCardEffectGraveyardSendToGY_0805FA5C(void);
extern void gCardEffectGraveyardSendToGY_08061D40(void);
extern void gCardEffectGraveyardSendToGY_080673E0(void);
extern void gCardEffectGraveyardSpecialSummon_080563CC(void);
extern void gCardEffectGraveyardSpecialSummon_08081B84(void);
extern void gCardEffectGraveyardStandbyPhase_080566CC(void);
extern void gCardEffectGraveyard_0805C2F0(void);
extern void gCardEffectGraveyard_0805E0EC(void);
extern void gCardEffectGraveyard_0805F068(void);
extern void gCardEffectGraveyard_08060938(void);
extern void gCardEffectGraveyard_08060E04(void);
extern void gCardEffectGraveyard_0806C780(void);
extern void gCardEffectGraveyard_08076908(void);
extern void gCardEffectGraveyard_08082F44(void);
extern void gCardEffectMBaaS_CheckTrigger(void);
extern void gCardEffectMBaaS_NegateDestroy(void);
extern void gCardEffectMBaaS_PayLP1500(void);
extern void gCardEffectNegateBattlePhase_0805CD20(void);
extern void gCardEffectNegateBattlePhase_08068F0C(void);
extern void gCardEffectNegateBoostATK_0805E1B0(void);
extern void gCardEffectNegateBoostATK_0806CD40(void);
extern void gCardEffectNegateChangePosition_0805153C(void);
extern void gCardEffectNegateChangePosition_080688DC(void);
extern void gCardEffectNegateChangePosition_0806FB88(void);
extern void gCardEffectNegateChangePosition_08083D38(void);
extern void gCardEffectNegateDamage_08075C40(void);
extern void gCardEffectNegateDamage_0807F1EC(void);
extern void gCardEffectNegateDestroy_08053098(void);
extern void gCardEffectNegateDestroy_080551BC(void);
extern void gCardEffectNegateDestroy_0805D118(void);
extern void gCardEffectNegateDestroy_08065698(void);
extern void gCardEffectNegateDestroy_0806A054(void);
extern void gCardEffectNegateDestroy_08070B14(void);
extern void gCardEffectNegateDiscard_0805715C(void);
extern void gCardEffectNegateDiscard_08058A04(void);
extern void gCardEffectNegateDiscard_0805F550(void);
extern void gCardEffectNegateDiscard_080629C8(void);
extern void gCardEffectNegateDiscard_0806EBD4(void);
extern void gCardEffectNegateDiscard_0806FF50(void);
extern void gCardEffectNegateDiscard_080714AC(void);
extern void gCardEffectNegateDiscard_080767AC(void);
extern void gCardEffectNegateDiscard_080774F4(void);
extern void gCardEffectNegateDiscard_0807B0C8(void);
extern void gCardEffectNegateEndPhase_0807AEA0(void);
extern void gCardEffectNegateEquip_0805DD40(void);
extern void gCardEffectNegateFlip_08070900(void);
extern void gCardEffectNegateGainLP_08081DCC(void);
extern void gCardEffectNegatePreventAttack_08062EC0(void);
extern void gCardEffectNegateReturnToHand_08052FD4(void);
extern void gCardEffectNegateReturnToHand_0807F158(void);
extern void gCardEffectNegate_0805DD58(void);
extern void gCardEffectNegate_08060DE0(void);
extern void gCardEffectNegate_08068828(void);
extern void gCardEffectNegate_0806B558(void);
extern void gCardEffectNegate_0807D700(void);
extern void gCardEffectPreventAttackChangePosition_0805FF9C(void);
extern void gCardEffectPreventAttackChangePosition_0806276C(void);
extern void gCardEffectPreventAttackChangePosition_0807A814(void);
extern void gCardEffectPreventAttackDirectAttack_08071488(void);
extern void gCardEffectPreventAttackDirectAttack_0807D59C(void);
extern void gCardEffectPreventAttackFlip_08051274(void);
extern void gCardEffectPreventAttack_08050130(void);
extern void gCardEffectPreventAttack_0805F480(void);
extern void gCardEffectPreventAttack_08066BF0(void);
extern void gCardEffectRNG_080670A0(void);
extern void gCardEffectReduceATKChangePosition_0805F26C(void);
extern void gCardEffectReduceATKChangePosition_08070D2C(void);
extern void gCardEffectReduceATKDamage_080531F0(void);
extern void gCardEffectReduceATKDamage_0805F33C(void);
extern void gCardEffectReduceATKDamage_0805FC3C(void);
extern void gCardEffectReduceATKDamage_08084038(void);
extern void gCardEffectReduceATKEndPhase_08067804(void);
extern void gCardEffectReduceATKEquip_0806D8C0(void);
extern void gCardEffectReduceATKGraveyard_08064288(void);
extern void gCardEffectReduceATK_0805E694(void);
extern void gCardEffectReduceATK_0806E00C(void);
extern void gCardEffectReturnToHandChangePosition_0804F4EC(void);
extern void gCardEffectReturnToHandChangePosition_08053460(void);
extern void gCardEffectReturnToHandChangePosition_080728F0(void);
extern void gCardEffectReturnToHandDamage_080758F0(void);
extern void gCardEffectReturnToHandDestroySpellTrap_080537C0(void);
extern void gCardEffectReturnToHandDestroySpellTrap_0805F5E8(void);
extern void gCardEffectReturnToHandDestroySpellTrap_080714EC(void);
extern void gCardEffectReturnToHandDestroy_080550E4(void);
extern void gCardEffectReturnToHandFlip_080509FC(void);
extern void gCardEffectReturnToHandFlip_08052E60(void);
extern void gCardEffectReturnToHandFlip_080676E0(void);
extern void gCardEffectReturnToHandFlip_0807067C(void);
extern void gCardEffectReturnToHandFlip_08082048(void);
extern void gCardEffectReturnToHandFlip_08083F4C(void);
extern void gCardEffectReturnToHandFlip_080848CC(void);
extern void gCardEffectReturnToHandGraveyard_08062CEC(void);
extern void gCardEffectReturnToHandGraveyard_08066D68(void);
extern void gCardEffectReturnToHandSendToGY_08078BF8(void);
extern void gCardEffectReturnToHandSendToGY_0807BE2C(void);
extern void gCardEffectReturnToHand_08051B9C(void);
extern void gCardEffectReturnToHand_0805FBB8(void);
extern void gCardEffectReturnToHand_08063FE8(void);
extern void gCardEffectReturnToHand_0806734C(void);
extern void gCardEffectReturnToHand_0806A694(void);
extern void gCardEffectReturnToHand_0806ABD4(void);
extern void gCardEffectReturnToHand_08072D34(void);
extern void gCardEffectRitualSummonDestroyAll_08053E6C(void);
extern void gCardEffectRitualSummonDestroyAll_0807633C(void);
extern void gCardEffectRitualSummonSendToGY_080609FC(void);
extern void gCardEffectRitualSummonTakeControl_0806327C(void);
extern void gCardEffectRitualSummonTribute_08086C80(void);
extern void gCardEffectRitualSummonTribute_08086CDC(void);
extern void gCardEffectSearchBanish_0805EE20(void);
extern void gCardEffectSearchBanish_0806129C(void);
extern void gCardEffectSearchBanish_08073D84(void);
extern void gCardEffectSearchBanish_08077318(void);
extern void gCardEffectSearchBoostATK_08063BA4(void);
extern void gCardEffectSearchDamage_08076214(void);
extern void gCardEffectSearchDamage_0807DCA4(void);
extern void gCardEffectSearchDestroy_0807EE74(void);
extern void gCardEffectSearchDiscard_0805DBE0(void);
extern void gCardEffectSearchDiscard_08061C10(void);
extern void gCardEffectSearchDiscard_0806A424(void);
extern void gCardEffectSearchDiscard_0806ABEC(void);
extern void gCardEffectSearchDiscard_080786A8(void);
extern void gCardEffectSearchDiscard_08083280(void);
extern void gCardEffectSearchEndPhase_0807C16C(void);
extern void gCardEffectSearchFlip_08073864(void);
extern void gCardEffectSearchFusionSummon_08063794(void);
extern void gCardEffectSearchGraveyard_0805C43C(void);
extern void gCardEffectSearchGraveyard_08060898(void);
extern void gCardEffectSearchGraveyard_08066EE0(void);
extern void gCardEffectSearchGraveyard_08075378(void);
extern void gCardEffectSearchGraveyard_08075AC0(void);
extern void gCardEffectSearchGraveyard_08084E70(void);
extern void gCardEffectSearchNegate_080712A0(void);
extern void gCardEffectSearchRitual_0806B200(void);
extern void gCardEffectSearchSendToGY_08057EA8(void);
extern void gCardEffectSearchSendToGY_0805F698(void);
extern void gCardEffectSearchSendToGY_080661FC(void);
extern void gCardEffectSearchSendToGY_0806F5F0(void);
extern void gCardEffectSearchSendToGY_0807104C(void);
extern void gCardEffectSearchSendToGY_080746EC(void);
extern void gCardEffectSearchSendToGY_0807512C(void);
extern void gCardEffectSearchSendToGY_08076490(void);
extern void gCardEffectSearchSendToGY_08078A90(void);
extern void gCardEffectSearchSendToGY_0807D3E0(void);
extern void gCardEffectSearchSpecialSummon_080575B0(void);
extern void gCardEffectSearchSpecialSummon_08058A1C(void);
extern void gCardEffectSearchSpecialSummon_0805EEB8(void);
extern void gCardEffectSearchSpecialSummon_08063918(void);
extern void gCardEffectSearchSpecialSummon_08068684(void);
extern void gCardEffectSearchSpecialSummon_0806FDEC(void);
extern void gCardEffectSearchSpecialSummon_0806FDEC_New(void);
extern void gCardEffectSearchSpecialSummon_08079E60(void);
extern void gCardEffectSearchSpecialSummon_0807CEF0(void);
extern void gCardEffectSearchSpecialSummon_0807F280(void);
extern void gCardEffectSearch_0805861C(void);
extern void gCardEffectSearch_08060854(void);
extern void gCardEffectSearch_0807338C(void);
extern void gCardEffectSendToGYBoostATK_08053EBC(void);
extern void gCardEffectSendToGYBoostATK_08054E5C(void);
extern void gCardEffectSendToGYBoostATK_08056598(void);
extern void gCardEffectSendToGYBoostATK_0805C48C(void);
extern void gCardEffectSendToGYChangePosition_0806001C(void);
extern void gCardEffectSendToGYDamage_08052020(void);
extern void gCardEffectSendToGYDamage_08058598(void);
extern void gCardEffectSendToGYDamage_08059C08(void);
extern void gCardEffectSendToGYDamage_0805C608(void);
extern void gCardEffectSendToGYDamage_080623A4(void);
extern void gCardEffectSendToGYDamage_080672A4(void);
extern void gCardEffectSendToGYDamage_080726F4(void);
extern void gCardEffectSendToGYDamage_080761E8(void);
extern void gCardEffectSendToGYDamage_08079FAC(void);
extern void gCardEffectSendToGYDamage_0807EFEC(void);
extern void gCardEffectSendToGYDamage_08084C40(void);
extern void gCardEffectSendToGYDestroyAll_08060514(void);
extern void gCardEffectSendToGYDestroyAll_08061584(void);
extern void gCardEffectSendToGYDestroyAll_08074C8C(void);
extern void gCardEffectSendToGYDestroySpellTrap_0805DC6C(void);
extern void gCardEffectSendToGYDestroySpellTrap_080750C0(void);
extern void gCardEffectSendToGYDestroy_080542F0(void);
extern void gCardEffectSendToGYDestroy_0805A1DC(void);
extern void gCardEffectSendToGYDestroy_0805DC00(void);
extern void gCardEffectSendToGYDestroy_0805FFB8(void);
extern void gCardEffectSendToGYDestroy_08061018(void);
extern void gCardEffectSendToGYDestroy_080615D8(void);
extern void gCardEffectSendToGYDestroy_08063C6C(void);
extern void gCardEffectSendToGYDestroy_08063DB4(void);
extern void gCardEffectSendToGYDestroy_08064418(void);
extern void gCardEffectSendToGYDestroy_08064598(void);
extern void gCardEffectSendToGYDestroy_0806D3D8(void);
extern void gCardEffectSendToGYDestroy_08071654(void);
extern void gCardEffectSendToGYDestroy_08073A5C(void);
extern void gCardEffectSendToGYDestroy_0807A9C8(void);
extern void gCardEffectSendToGYDestroy_0807BDB8(void);
extern void gCardEffectSendToGYDestroy_0807D69C(void);
extern void gCardEffectSendToGYDestroy_0807E9F8(void);
extern void gCardEffectSendToGYDestroy_080904EC(void);
extern void gCardEffectSendToGYGainLP_080537DC(void);
extern void gCardEffectSendToGYGainLP_08057D0C(void);
extern void gCardEffectSendToGYGainLP_08067160(void);
extern void gCardEffectSendToGYGraveyard_080540EC(void);
extern void gCardEffectSendToGYGraveyard_08056658(void);
extern void gCardEffectSendToGYGraveyard_0805738C(void);
extern void gCardEffectSendToGYGraveyard_08057ECC(void);
extern void gCardEffectSendToGYGraveyard_080584CC(void);
extern void gCardEffectSendToGYGraveyard_08058754(void);
extern void gCardEffectSendToGYGraveyard_08058C2C(void);
extern void gCardEffectSendToGYGraveyard_08058C40(void);
extern void gCardEffectSendToGYGraveyard_0805EE9C(void);
extern void gCardEffectSendToGYGraveyard_08060104(void);
extern void gCardEffectSendToGYGraveyard_08060B18(void);
extern void gCardEffectSendToGYGraveyard_080633E8(void);
extern void gCardEffectSendToGYGraveyard_08063FC4(void);
extern void gCardEffectSendToGYGraveyard_0806456C(void);
extern void gCardEffectSendToGYGraveyard_08066698(void);
extern void gCardEffectSendToGYGraveyard_0806683C(void);
extern void gCardEffectSendToGYGraveyard_0806A240(void);
extern void gCardEffectSendToGYGraveyard_0806A520(void);
extern void gCardEffectSendToGYGraveyard_0806F85C(void);
extern void gCardEffectSendToGYGraveyard_080700F4(void);
extern void gCardEffectSendToGYGraveyard_080717F0(void);
extern void gCardEffectSendToGYGraveyard_080729DC(void);
extern void gCardEffectSendToGYGraveyard_0807381C(void);
extern void gCardEffectSendToGYGraveyard_08073FE0(void);
extern void gCardEffectSendToGYGraveyard_0807629C(void);
extern void gCardEffectSendToGYGraveyard_0807C1F8(void);
extern void gCardEffectSendToGYGraveyard_0807CCA0(void);
extern void gCardEffectSendToGYGraveyard_0807DB20(void);
extern void gCardEffectSendToGYGraveyard_0807E960(void);
extern void gCardEffectSendToGYGraveyard_0807ED04(void);
extern void gCardEffectSendToGYGraveyard_0807F0A4(void);
extern void gCardEffectSendToGYGraveyard_080852E4(void);
extern void gCardEffectSendToGYReduceATK_08083560(void);
extern void gCardEffectSpecialSummonBanish_08053374(void);
extern void gCardEffectSpecialSummonBanish_08053F5C(void);
extern void gCardEffectSpecialSummonBanish_080553D4(void);
extern void gCardEffectSpecialSummonBanish_0805845C(void);
extern void gCardEffectSpecialSummonBanish_08059B4C(void);
extern void gCardEffectSpecialSummonBanish_08059CC8(void);
extern void gCardEffectSpecialSummonBanish_0805FA84(void);
extern void gCardEffectSpecialSummonBanish_08060EE0(void);
extern void gCardEffectSpecialSummonBanish_080612E4(void);
extern void gCardEffectSpecialSummonBanish_08061624(void);
extern void gCardEffectSpecialSummonBanish_08063194(void);
extern void gCardEffectSpecialSummonBanish_08063254(void);
extern void gCardEffectSpecialSummonBanish_08063A6C(void);
extern void gCardEffectSpecialSummonBanish_08063CF0(void);
extern void gCardEffectSpecialSummonBanish_0807220C(void);
extern void gCardEffectSpecialSummonBanish_08072AAC(void);
extern void gCardEffectSpecialSummonBanish_080755DC(void);
extern void gCardEffectSpecialSummonBanish_08076B1C(void);
extern void gCardEffectSpecialSummonBanish_0807738C(void);
extern void gCardEffectSpecialSummonBanish_08077678(void);
extern void gCardEffectSpecialSummonBanish_080779E4(void);
extern void gCardEffectSpecialSummonBanish_08079944(void);
extern void gCardEffectSpecialSummonBanish_0807C388(void);
extern void gCardEffectSpecialSummonBanish_0807D564(void);
extern void gCardEffectSpecialSummonBanish_080841C0(void);
extern void gCardEffectSpecialSummonBanish_08084210(void);
extern void gCardEffectSpecialSummonBanish_080850D8(void);
extern void gCardEffectSpecialSummonBoostATK_0805F7F8(void);
extern void gCardEffectSpecialSummonBoostATK_08071E98(void);
extern void gCardEffectSpecialSummonBoostATK_08073760(void);
extern void gCardEffectSpecialSummonBoostATK_0807E24C(void);
extern void gCardEffectSpecialSummonChangePosition_0805174C(void);
extern void gCardEffectSpecialSummonChangePosition_08052734(void);
extern void gCardEffectSpecialSummonChangePosition_08052DF8(void);
extern void gCardEffectSpecialSummonChangePosition_080538E8(void);
extern void gCardEffectSpecialSummonChangePosition_080554A0(void);
extern void gCardEffectSpecialSummonChangePosition_0805C294(void);
extern void gCardEffectSpecialSummonChangePosition_0805C7A4(void);
extern void gCardEffectSpecialSummonChangePosition_0805E008(void);
extern void gCardEffectSpecialSummonChangePosition_080602A8(void);
extern void gCardEffectSpecialSummonChangePosition_08060684(void);
extern void gCardEffectSpecialSummonChangePosition_08060974(void);
extern void gCardEffectSpecialSummonChangePosition_080609A4(void);
extern void gCardEffectSpecialSummonChangePosition_08062704(void);
extern void gCardEffectSpecialSummonChangePosition_0806363C(void);
extern void gCardEffectSpecialSummonChangePosition_08064074(void);
extern void gCardEffectSpecialSummonChangePosition_080694A8(void);
extern void gCardEffectSpecialSummonChangePosition_0806C0CC(void);
extern void gCardEffectSpecialSummonChangePosition_0806E3FC(void);
extern void gCardEffectSpecialSummonChangePosition_080706F4(void);
extern void gCardEffectSpecialSummonChangePosition_08074D78(void);
extern void gCardEffectSpecialSummonChangePosition_08075530(void);
extern void gCardEffectSpecialSummonChangePosition_080770B4(void);
extern void gCardEffectSpecialSummonChangePosition_0807A688(void);
extern void gCardEffectSpecialSummonChangePosition_0807C590(void);
extern void gCardEffectSpecialSummonChangePosition_0807DEE0(void);
extern void gCardEffectSpecialSummonChangePosition_08083170(void);
extern void gCardEffectSpecialSummonChangePosition_08083E14(void);
extern void gCardEffectSpecialSummonChangePosition_08084460(void);
extern void gCardEffectSpecialSummonChangePosition_08084D5C(void);
extern void gCardEffectSpecialSummonChangePosition_080852CC(void);
extern void gCardEffectSpecialSummonDamage_08057138(void);
extern void gCardEffectSpecialSummonDamage_0805CB44(void);
extern void gCardEffectSpecialSummonDamage_0805FDF4(void);
extern void gCardEffectSpecialSummonDamage_08060BF8(void);
extern void gCardEffectSpecialSummonDamage_08061938(void);
extern void gCardEffectSpecialSummonDamage_08061DCC(void);
extern void gCardEffectSpecialSummonDamage_08068990(void);
extern void gCardEffectSpecialSummonDamage_08075F70(void);
extern void gCardEffectSpecialSummonDamage_08078C94(void);
extern void gCardEffectSpecialSummonDamage_0807F53C(void);
extern void gCardEffectSpecialSummonDestroyAll_08053698(void);
extern void gCardEffectSpecialSummonDestroyAll_0805E358(void);
extern void gCardEffectSpecialSummonDestroyAll_0805E778(void);
extern void gCardEffectSpecialSummonDestroyAll_08063404(void);
extern void gCardEffectSpecialSummonDestroyAll_080635C0(void);
extern void gCardEffectSpecialSummonDestroyAll_080639C8(void);
extern void gCardEffectSpecialSummonDestroyAll_08069260(void);
extern void gCardEffectSpecialSummonDestroyAll_0806ADB8(void);
extern void gCardEffectSpecialSummonDestroyAll_0807A138(void);
extern void gCardEffectSpecialSummonDestroyAll_0807C510(void);
extern void gCardEffectSpecialSummonDestroyAll_0808263C(void);
extern void gCardEffectSpecialSummonDestroySpellTrap_08050E40(void);
extern void gCardEffectSpecialSummonDestroySpellTrap_08053524(void);
extern void gCardEffectSpecialSummonDestroySpellTrap_08054B18(void);
extern void gCardEffectSpecialSummonDestroySpellTrap_08059E94(void);
extern void gCardEffectSpecialSummonDestroySpellTrap_0805F968(void);
extern void gCardEffectSpecialSummonDestroySpellTrap_080636CC(void);
extern void gCardEffectSpecialSummonDestroySpellTrap_0807C750(void);
extern void gCardEffectSpecialSummonDestroySpellTrap_08084E2C(void);
extern void gCardEffectSpecialSummonDestroy_08051670(void);
extern void gCardEffectSpecialSummonDestroy_08053E14(void);
extern void gCardEffectSpecialSummonDestroy_08054FBC(void);
extern void gCardEffectSpecialSummonDestroy_08058578(void);
extern void gCardEffectSpecialSummonDestroy_08059008(void);
extern void gCardEffectSpecialSummonDestroy_08059FC4(void);
extern void gCardEffectSpecialSummonDestroy_0805EE60(void);
extern void gCardEffectSpecialSummonDestroy_0806019C(void);
extern void gCardEffectSpecialSummonDestroy_080602E0(void);
extern void gCardEffectSpecialSummonDestroy_08060350(void);
extern void gCardEffectSpecialSummonDestroy_08060B4C(void);
extern void gCardEffectSpecialSummonDestroy_08060B80(void);
extern void gCardEffectSpecialSummonDestroy_08061070(void);
extern void gCardEffectSpecialSummonDestroy_08061BC4(void);
extern void gCardEffectSpecialSummonDestroy_08061C4C(void);
extern void gCardEffectSpecialSummonDestroy_08061E50(void);
extern void gCardEffectSpecialSummonDestroy_08061FF8(void);
extern void gCardEffectSpecialSummonDestroy_0806285C(void);
extern void gCardEffectSpecialSummonDestroy_08064360(void);
extern void gCardEffectSpecialSummonDestroy_080644B4(void);
extern void gCardEffectSpecialSummonDestroy_080682AC(void);
extern void gCardEffectSpecialSummonDestroy_0806882C(void);
extern void gCardEffectSpecialSummonDestroy_0806A3EC(void);
extern void gCardEffectSpecialSummonDestroy_0806C764(void);
extern void gCardEffectSpecialSummonDestroy_0806C978(void);
extern void gCardEffectSpecialSummonDestroy_0806CF40(void);
extern void gCardEffectSpecialSummonDestroy_0806F788(void);
extern void gCardEffectSpecialSummonDestroy_08072EB4(void);
extern void gCardEffectSpecialSummonDestroy_08074338(void);
extern void gCardEffectSpecialSummonDestroy_08074708(void);
extern void gCardEffectSpecialSummonDestroy_0807479C(void);
extern void gCardEffectSpecialSummonDestroy_080750EC(void);
extern void gCardEffectSpecialSummonDestroy_08075BA4(void);
extern void gCardEffectSpecialSummonDestroy_08075D0C(void);
extern void gCardEffectSpecialSummonDestroy_08077D80(void);
extern void gCardEffectSpecialSummonDestroy_08078658(void);
extern void gCardEffectSpecialSummonDestroy_080787E0(void);
extern void gCardEffectSpecialSummonDestroy_080792F8(void);
extern void gCardEffectSpecialSummonDestroy_0807E7E4(void);
extern void gCardEffectSpecialSummonDestroy_080843FC(void);
extern void gCardEffectSpecialSummonDestroy_08084738(void);
extern void gCardEffectSpecialSummonDiscard_08053034(void);
extern void gCardEffectSpecialSummonDiscard_080535B0(void);
extern void gCardEffectSpecialSummonDiscard_0805363C(void);
extern void gCardEffectSpecialSummonDiscard_08057660(void);
extern void gCardEffectSpecialSummonDiscard_08057C28(void);
extern void gCardEffectSpecialSummonDiscard_08058550(void);
extern void gCardEffectSpecialSummonDiscard_0805EF4C(void);
extern void gCardEffectSpecialSummonDiscard_0805F298(void);
extern void gCardEffectSpecialSummonDiscard_0805FE38(void);
extern void gCardEffectSpecialSummonDiscard_0806015C(void);
extern void gCardEffectSpecialSummonDiscard_08060328(void);
extern void gCardEffectSpecialSummonDiscard_08062E8C(void);
extern void gCardEffectSpecialSummonDiscard_0806357C(void);
extern void gCardEffectSpecialSummonDiscard_08063E80(void);
extern void gCardEffectSpecialSummonDiscard_080642AC(void);
extern void gCardEffectSpecialSummonDiscard_08070E18(void);
extern void gCardEffectSpecialSummonDiscard_08073428(void);
extern void gCardEffectSpecialSummonDiscard_08074318(void);
extern void gCardEffectSpecialSummonDiscard_08074770(void);
extern void gCardEffectSpecialSummonDiscard_080781DC(void);
extern void gCardEffectSpecialSummonDiscard_08078794(void);
extern void gCardEffectSpecialSummonDiscard_0807D4DC(void);
extern void gCardEffectSpecialSummonDiscard_0807D7E8(void);
extern void gCardEffectSpecialSummonDiscard_0807D92C(void);
extern void gCardEffectSpecialSummonDiscard_080850F0(void);
extern void gCardEffectSpecialSummonEquip_080568D0(void);
extern void gCardEffectSpecialSummonEquip_0805C724(void);
extern void gCardEffectSpecialSummonEquip_08067B5C(void);
extern void gCardEffectSpecialSummonFusionSummon_080556F0(void);
extern void gCardEffectSpecialSummonFusionSummon_080632A4(void);
extern void gCardEffectSpecialSummonFusionSummon_080645F0(void);
extern void gCardEffectSpecialSummonFusionSummon_0807F458(void);
extern void gCardEffectSpecialSummonFusionSummon_08080690(void);
extern void gCardEffectSpecialSummonFusionSummon_08080944(void);
extern void gCardEffectSpecialSummonFusion_08054D5C(void);
extern void gCardEffectSpecialSummonFusion_08054F08(void);
extern void gCardEffectSpecialSummonFusion_080598D8(void);
extern void gCardEffectSpecialSummonFusion_08062D4C(void);
extern void gCardEffectSpecialSummonFusion_080633AC(void);
extern void gCardEffectSpecialSummonFusion_08066E0C(void);
extern void gCardEffectSpecialSummonFusion_0807039C(void);
extern void gCardEffectSpecialSummonFusion_0807B77C(void);
extern void gCardEffectSpecialSummonGraveyard_08057294(void);
extern void gCardEffectSpecialSummonGraveyard_0805C248(void);
extern void gCardEffectSpecialSummonGraveyard_0805CF70(void);
extern void gCardEffectSpecialSummonGraveyard_08060A88(void);
extern void gCardEffectSpecialSummonGraveyard_080643E0(void);
extern void gCardEffectSpecialSummonGraveyard_08066858(void);
extern void gCardEffectSpecialSummonGraveyard_080687A8(void);
extern void gCardEffectSpecialSummonGraveyard_08069BE0(void);
extern void gCardEffectSpecialSummonGraveyard_08075874(void);
extern void gCardEffectSpecialSummonGraveyard_0807FD84(void);
extern void gCardEffectSpecialSummonNegate_08057270(void);
extern void gCardEffectSpecialSummonNegate_080572B8(void);
extern void gCardEffectSpecialSummonNegate_08058794(void);
extern void gCardEffectSpecialSummonNegate_0805D840(void);
extern void gCardEffectSpecialSummonNegate_0805D8BC(void);
extern void gCardEffectSpecialSummonNegate_0805E208(void);
extern void gCardEffectSpecialSummonNegate_0805E260(void);
extern void gCardEffectSpecialSummonNegate_0805F9E4(void);
extern void gCardEffectSpecialSummonNegate_08060C94(void);
extern void gCardEffectSpecialSummonNegate_08061F10(void);
extern void gCardEffectSpecialSummonNegate_0806A334(void);
extern void gCardEffectSpecialSummonNegate_0806CFE8(void);
extern void gCardEffectSpecialSummonNegate_080762C8(void);
extern void gCardEffectSpecialSummonNegate_08079EC4(void);
extern void gCardEffectSpecialSummonNegate_080845AC(void);
extern void gCardEffectSpecialSummonPreventAttack_08053D40(void);
extern void gCardEffectSpecialSummonPreventAttack_080594F0(void);
extern void gCardEffectSpecialSummonPreventAttack_0806109C(void);
extern void gCardEffectSpecialSummonPreventAttack_080624FC(void);
extern void gCardEffectSpecialSummonPreventAttack_08063C14(void);
extern void gCardEffectSpecialSummonPreventAttack_080719FC(void);
extern void gCardEffectSpecialSummonPreventAttack_0807D2E0(void);
extern void gCardEffectSpecialSummonReturnToHand_08053850(void);
extern void gCardEffectSpecialSummonReturnToHand_08054834(void);
extern void gCardEffectSpecialSummonReturnToHand_08055188(void);
extern void gCardEffectSpecialSummonReturnToHand_08057F98(void);
extern void gCardEffectSpecialSummonReturnToHand_0805F784(void);
extern void gCardEffectSpecialSummonReturnToHand_0805FF3C(void);
extern void gCardEffectSpecialSummonReturnToHand_0806B784(void);
extern void gCardEffectSpecialSummonReturnToHand_08071D64(void);
extern void gCardEffectSpecialSummonReturnToHand_08073454(void);
extern void gCardEffectSpecialSummonReturnToHand_0807BC48(void);
extern void gCardEffectSpecialSummonReturnToHand_08084180(void);
extern void gCardEffectSpecialSummonRevive_0805A0AC(void);
extern void gCardEffectSpecialSummonRevive_0805E284(void);
extern void gCardEffectSpecialSummonRevive_0805F020(void);
extern void gCardEffectSpecialSummonRevive_08060710(void);
extern void gCardEffectSpecialSummonRevive_08063730(void);
extern void gCardEffectSpecialSummonRevive_08063D04(void);
extern void gCardEffectSpecialSummonRevive_08063F28(void);
extern void gCardEffectSpecialSummonRevive_08064260(void);
extern void gCardEffectSpecialSummonRevive_0806D124(void);
extern void gCardEffectSpecialSummonRevive_08070580(void);
extern void gCardEffectSpecialSummonRevive_08078808(void);
extern void gCardEffectSpecialSummonRevive_0807C87C(void);
extern void gCardEffectSpecialSummonRevive_0807D104(void);
extern void gCardEffectSpecialSummonRevive_0807DAB0(void);
extern void gCardEffectSpecialSummonRevive_080833BC(void);
extern void gCardEffectSpecialSummonRitualSummon_080603B8(void);
extern void gCardEffectSpecialSummonRitualSummon_08074AF4(void);
extern void gCardEffectSpecialSummonSendToGY_08052A20(void);
extern void gCardEffectSpecialSummonSendToGY_08053D88(void);
extern void gCardEffectSpecialSummonSendToGY_08053F10(void);
extern void gCardEffectSpecialSummonSendToGY_080546BC(void);
extern void gCardEffectSpecialSummonSendToGY_080546E0(void);
extern void gCardEffectSpecialSummonSendToGY_080547B4(void);
extern void gCardEffectSpecialSummonSendToGY_08057430(void);
extern void gCardEffectSpecialSummonSendToGY_08057CF4(void);
extern void gCardEffectSpecialSummonSendToGY_08058444(void);
extern void gCardEffectSpecialSummonSendToGY_08058A98(void);
extern void gCardEffectSpecialSummonSendToGY_08059068(void);
extern void gCardEffectSpecialSummonSendToGY_08059110(void);
extern void gCardEffectSpecialSummonSendToGY_08059174(void);
extern void gCardEffectSpecialSummonSendToGY_080592C4(void);
extern void gCardEffectSpecialSummonSendToGY_0805934C(void);
extern void gCardEffectSpecialSummonSendToGY_08059430(void);
extern void gCardEffectSpecialSummonSendToGY_0805951C(void);
extern void gCardEffectSpecialSummonSendToGY_08059DE0(void);
extern void gCardEffectSpecialSummonSendToGY_0805A030(void);
extern void gCardEffectSpecialSummonSendToGY_0805A204(void);
extern void gCardEffectSpecialSummonSendToGY_0805CC08(void);
extern void gCardEffectSpecialSummonSendToGY_0805CD6C(void);
extern void gCardEffectSpecialSummonSendToGY_0805D918(void);
extern void gCardEffectSpecialSummonSendToGY_0805E3A8(void);
extern void gCardEffectSpecialSummonSendToGY_0805E518(void);
extern void gCardEffectSpecialSummonSendToGY_0805E578(void);
extern void gCardEffectSpecialSummonSendToGY_0805E790(void);
extern void gCardEffectSpecialSummonSendToGY_0805EA3C(void);
extern void gCardEffectSpecialSummonSendToGY_0805F930(void);
extern void gCardEffectSpecialSummonSendToGY_0806008C(void);
extern void gCardEffectSpecialSummonSendToGY_080601DC(void);
extern void gCardEffectSpecialSummonSendToGY_08060A5C(void);
extern void gCardEffectSpecialSummonSendToGY_08061434(void);
extern void gCardEffectSpecialSummonSendToGY_080617AC(void);
extern void gCardEffectSpecialSummonSendToGY_08061B14(void);
extern void gCardEffectSpecialSummonSendToGY_08061CC8(void);
extern void gCardEffectSpecialSummonSendToGY_08061E20(void);
extern void gCardEffectSpecialSummonSendToGY_08061EB4(void);
extern void gCardEffectSpecialSummonSendToGY_08062090(void);
extern void gCardEffectSpecialSummonSendToGY_080620E0(void);
extern void gCardEffectSpecialSummonSendToGY_0806210C(void);
extern void gCardEffectSpecialSummonSendToGY_08062170(void);
extern void gCardEffectSpecialSummonSendToGY_08062244(void);
extern void gCardEffectSpecialSummonSendToGY_08062498(void);
extern void gCardEffectSpecialSummonSendToGY_08062564(void);
extern void gCardEffectSpecialSummonSendToGY_08062610(void);
extern void gCardEffectSpecialSummonSendToGY_08062640(void);
extern void gCardEffectSpecialSummonSendToGY_08062818(void);
extern void gCardEffectSpecialSummonSendToGY_08062D90(void);
extern void gCardEffectSpecialSummonSendToGY_08063320(void);
extern void gCardEffectSpecialSummonSendToGY_08063440(void);
extern void gCardEffectSpecialSummonSendToGY_08063600(void);
extern void gCardEffectSpecialSummonSendToGY_08063E94(void);
extern void gCardEffectSpecialSummonSendToGY_08064204(void);
extern void gCardEffectSpecialSummonSendToGY_08068D8C(void);
extern void gCardEffectSpecialSummonSendToGY_0806A700(void);
extern void gCardEffectSpecialSummonSendToGY_0806B030(void);
extern void gCardEffectSpecialSummonSendToGY_0806B31C(void);
extern void gCardEffectSpecialSummonSendToGY_0806B53C(void);
extern void gCardEffectSpecialSummonSendToGY_0806D4A4(void);
extern void gCardEffectSpecialSummonSendToGY_0806D810(void);
extern void gCardEffectSpecialSummonSendToGY_0806D960(void);
extern void gCardEffectSpecialSummonSendToGY_0806DBCC(void);
extern void gCardEffectSpecialSummonSendToGY_0806E898(void);
extern void gCardEffectSpecialSummonSendToGY_0806EDD4(void);
extern void gCardEffectSpecialSummonSendToGY_0807190C(void);
extern void gCardEffectSpecialSummonSendToGY_08072540(void);
extern void gCardEffectSpecialSummonSendToGY_08073B1C(void);
extern void gCardEffectSpecialSummonSendToGY_080757F0(void);
extern void gCardEffectSpecialSummonSendToGY_080777D8(void);
extern void gCardEffectSpecialSummonSendToGY_08077C50(void);
extern void gCardEffectSpecialSummonSendToGY_080782C0(void);
extern void gCardEffectSpecialSummonSendToGY_08078A24(void);
extern void gCardEffectSpecialSummonSendToGY_08078FE0(void);
extern void gCardEffectSpecialSummonSendToGY_080797D0(void);
extern void gCardEffectSpecialSummonSendToGY_08079A1C(void);
extern void gCardEffectSpecialSummonSendToGY_08079F80(void);
extern void gCardEffectSpecialSummonSendToGY_0807A5A4(void);
extern void gCardEffectSpecialSummonSendToGY_0807A65C(void);
extern void gCardEffectSpecialSummonSendToGY_0807A8F0(void);
extern void gCardEffectSpecialSummonSendToGY_0807B4D4(void);
extern void gCardEffectSpecialSummonSendToGY_0807B7DC(void);
extern void gCardEffectSpecialSummonSendToGY_0807BDF8(void);
extern void gCardEffectSpecialSummonSendToGY_0807C474(void);
extern void gCardEffectSpecialSummonSendToGY_0807FDE8(void);
extern void gCardEffectSpecialSummonSendToGY_0808386C(void);
extern void gCardEffectSpecialSummonSendToGY_08085034(void);
extern void gCardEffectSpecialSummonTribute_08051CC4(void);
extern void gCardEffectSpecialSummonTribute_08052224(void);
extern void gCardEffectSpecialSummonTribute_08054CB0(void);
extern void gCardEffectSpecialSummonTribute_08059760(void);
extern void gCardEffectSpecialSummonTribute_0805E92C(void);
extern void gCardEffectSpecialSummonTribute_0805EF88(void);
extern void gCardEffectSpecialSummonTribute_080604AC(void);
extern void gCardEffectSpecialSummonTribute_08061660(void);
extern void gCardEffectSpecialSummonTribute_08062CB8(void);
extern void gCardEffectSpecialSummonTribute_0806305C(void);
extern void gCardEffectSpecialSummonTribute_0806E308(void);
extern void gCardEffectSpecialSummon_08055624(void);
extern void gCardEffectSpecialSummon_080557E0(void);
extern void gCardEffectSpecialSummon_08059448(void);
extern void gCardEffectSpecialSummon_0805C218(void);
extern void gCardEffectSpecialSummon_0805C4D4(void);
extern void gCardEffectSpecialSummon_0805CBCC(void);
extern void gCardEffectSpecialSummon_0805CDB0(void);
extern void gCardEffectSpecialSummon_0805CE70(void);
extern void gCardEffectSpecialSummon_0805EEE4(void);
extern void gCardEffectSpecialSummon_0805FB3C(void);
extern void gCardEffectSpecialSummon_0805FEB0(void);
extern void gCardEffectSpecialSummon_0805FF64(void);
extern void gCardEffectSpecialSummon_08060464(void);
extern void gCardEffectSpecialSummon_08060C30(void);
extern void gCardEffectSpecialSummon_08062E1C(void);
extern void gCardEffectSpecialSummon_080659E8(void);
extern void gCardEffectSpecialSummon_08068E0C(void);
extern void gCardEffectSpecialSummon_080690DC(void);
extern void gCardEffectSpecialSummon_08069780(void);
extern void gCardEffectSpecialSummon_0807004C(void);
extern void gCardEffectSpecialSummon_08072CE4(void);
extern void gCardEffectSpecialSummon_0807356C(void);
extern void gCardEffectSpecialSummon_080765B0(void);
extern void gCardEffectSpecialSummon_0807CD68(void);
extern void gCardEffectStandbyPhaseBattlePhase_08060588(void);
extern void gCardEffectStandbyPhaseDamage_08054F64(void);
extern void gCardEffectStandbyPhaseDestroy_0805F2C0(void);
extern void gCardEffectStandbyPhase_08067440(void);
extern void gCardEffectStandbyPhase_0806CB54(void);
extern void gCardEffectTakeControlChangePosition_080508CC(void);
extern void gCardEffectTakeControlChangePosition_080538A8(void);
extern void gCardEffectTakeControlChangePosition_0806F008(void);
extern void gCardEffectTakeControlChangePosition_080737AC(void);
extern void gCardEffectTakeControlDestroy_0804F618(void);
extern void gCardEffectTakeControlDestroy_0805EC40(void);
extern void gCardEffectTakeControlEndPhase_0806A2EC(void);
extern void gCardEffectTakeControlFlip_08052080(void);
extern void gCardEffectTakeControlFlip_08054D08(void);
extern void gCardEffectTakeControlFlip_08056874(void);
extern void gCardEffectTakeControlFlip_0805C694(void);
extern void gCardEffectTakeControlFlip_0805D824(void);
extern void gCardEffectTakeControlFlip_080630F8(void);
extern void gCardEffectTakeControlFlip_080631C0(void);
extern void gCardEffectTakeControlFlip_080678C8(void);
extern void gCardEffectTakeControlFlip_0806D618(void);
extern void gCardEffectTakeControlFlip_0807BF64(void);
extern void gCardEffectTakeControlFlip_0807C088(void);
extern void gCardEffectTakeControlGainLP_08062DFC(void);
extern void gCardEffectTakeControlGainLP_0807B958(void);
extern void gCardEffectTakeControlGainLP_08084D3C(void);
extern void gCardEffectTakeControlTribute_08053178(void);
extern void gCardEffectTakeControlTribute_08071210(void);
extern void gCardEffectTributeBattlePhase_0806DAB4(void);
extern void gCardEffectTributeDamage_0805C3EC(void);
extern void gCardEffectTributeDestroy_08050EAC(void);
extern void gCardEffectTributeDestroy_08057538(void);
extern void gCardEffectTributeDestroy_0805ECA8(void);
extern void gCardEffectTributeDestroy_0806F390(void);
extern void gCardEffectTributeSpecialSummon_08056930(void);
extern void gCardEffectTributeSpecialSummon_08057344(void);
extern void gCardEffectTributeTakeControl_0805F3BC(void);
extern void gCardEffectTribute_080567A0(void);
extern void gCardEffectTribute_0805756C(void);
extern void gCardEffectTribute_0805D9CC(void);
extern void gCardEffectTribute_0805ED2C(void);
extern void gCardEffectTribute_08063878(void);
extern void gCardEffectTribute_0806A784(void);
extern void gCardEffectTribute_0807CD28(void);
extern void gCardEffectUnknown_08050DE4(void);
extern void gCardEffectUnknown_080514B4(void);
extern void gCardEffectUnknown_08052674(void);
extern void gCardEffectUnknown_08052790(void);
extern void gCardEffectUnknown_08052ECC(void);
extern void gCardEffectUnknown_08053C70(void);
extern void gCardEffectUnknown_08054468(void);
extern void gCardEffectUnknown_08054C50(void);
extern void gCardEffectUnknown_08056614(void);
extern void gCardEffectUnknown_080567BC(void);
extern void gCardEffectUnknown_0805C528(void);
extern void gCardEffectUnknown_0805C630(void);
extern void gCardEffectUnknown_0805CEC8(void);
extern void gCardEffectUnknown_0805D020(void);
extern void gCardEffectUnknown_0805DB60(void);
extern void gCardEffectUnknown_0805E81C(void);
extern void gCardEffectUnknown_0805E864(void);
extern void gCardEffectUnknown_0805EC74(void);
extern void gCardEffectUnknown_0805FC10(void);
extern void gCardEffectUnknown_08061404(void);
extern void gCardEffectUnknown_08061688(void);
extern void gCardEffectUnknown_08061874(void);
extern void gCardEffectUnknown_08061C68(void);
extern void gCardEffectUnknown_08061C90(void);
extern void gCardEffectUnknown_0806234C(void);
extern void gCardEffectUnknown_08062378(void);
extern void gCardEffectUnknown_080623EC(void);
extern void gCardEffectUnknown_08062420(void);
extern void gCardEffectUnknown_08062A0C(void);
extern void gCardEffectUnknown_08063814(void);
extern void gCardEffectUnknown_08066D04(void);
extern void gCardEffectUnknown_0806738C(void);
extern void gCardEffectUnknown_080693E4(void);
extern void gCardEffectUnknown_08069420(void);
extern void gCardEffectUnknown_080696D8(void);
extern void gCardEffectUnknown_08069874(void);
extern void gCardEffectUnknown_08069D08(void);
extern void gCardEffectUnknown_08069E40(void);
extern void gCardEffectUnknown_0806A004(void);
extern void gCardEffectUnknown_0806A760(void);
extern void gCardEffectUnknown_0806AA14(void);
extern void gCardEffectUnknown_0806AB0C(void);
extern void gCardEffectUnknown_0806C368(void);
extern void gCardEffectUnknown_0806E62C(void);
extern void gCardEffectUnknown_0806E76C(void);
extern void gCardEffectUnknown_0806E840(void);
extern void gCardEffectUnknown_0806F2CC(void);
extern void gCardEffectUnknown_08073140(void);
extern void gCardEffectUnknown_08075B44(void);
extern void gCardEffectUnknown_0807757C(void);
extern void gCardEffectUnknown_08077B34(void);
extern void gCardEffectUnknown_08077D58(void);
extern void gCardEffectUnknown_0807A2C4(void);
extern void gCardEffectUnknown_0807A308(void);
extern void gCardEffectUnknown_0807AD84(void);
extern void gCardEffectUnknown_0807B188(void);
extern void gCardEffectUnknown_0807B490(void);
extern void gCardEffectUnknown_0807CB80(void);
extern void gCardEffectUnknown_08082B88(void);
extern void gCardEffectUnknown_08083704(void);
extern void gCardEffectUnknown_08083BA0(void);
extern void gCardEffectUnknown_080845E0(void);
extern void gCardEffectUnknown_08084AF4(void);

extern void gCardEffectRedEyesDarknessMetalDragon_BanishSummon(void);
extern void EngineRDMD_MarkSummonUsedThenAnimate(void); // asm/new_code.s

// gEffects1  (676 entries)
const struct CardEffects gCardEffects[] = {
//  KonamiId                                             pad  eff1  eff2  eff3  eff4  eff5
    { KONAMI_COCOON_OF_EVOLUTION                        , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , gCardEffectEquip_0805C394                        , gCardEffectEquip_08056558                        , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_LEGENDARY_SWORD_NONE                       , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_SWORD_OF_DARK_DESTRUCTION_NONE             , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_DARK_ENERGY_NONE                           , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_AXE_OF_DESPAIR                             , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_LASER_CANNON_ARMOR_NONE                    , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_INSECT_ARMOR_WITH_LASER_CANNON             , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_ELF_S_LIGHT_NONE                           , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_BEAST_FANGS_NONE                           , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_STEEL_SHELL_NONE                           , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_VILE_GERMS_NONE                            , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_BLACK_PENDANT                              , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_SILVER_BOW_AND_ARROW_NONE                  , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_HORN_OF_LIGHT                              , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_HORN_OF_THE_UNICORN                        , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_DRAGON_TREASURE_NONE                       , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_ELECTRO_WHIP_NONE                          , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_CYBER_SHIELD_NONE                          , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_ELEGANT_EGOTIST                            , 0, { gCardEffectSpecialSummonGraveyard_08066858       , NULL                                             , gCardEffectSpecialSummon_0805C4D4                , NULL                                             , NULL                                              } },
    { KONAMI_MYSTICAL_MOON_NONE                         , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_STOP_DEFENSE                               , 0, { gCardEffectChangePosition_08066A94               , gCardEffectChangePosition_080500C8               , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_MALEVOLENT_NUZZLER                         , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_VIOLET_CRYSTAL_NONE                        , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_BOOK_OF_SECRET_ARTS_NONE                   , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_INVIGORATION_NONE                          , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_MACHINE_CONVERSION_FACTORY_NONE            , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_RAISE_BODY_HEAT_NONE                       , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_FOLLOW_WIND_NONE                           , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_POWER_OF_KAISHIN_NONE                      , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_DRAGON_CAPTURE_JAR                         , 0, { gCardEffectChangePosition_08066B10               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_FOREST                                     , 0, { gCardEffectBoostATKBoostDEF_08064760             , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_WASTELAND                                  , 0, { gCardEffectBoostATKBoostDEF_08064760             , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MOUNTAIN                                   , 0, { gCardEffectBoostATKBoostDEF_08064760             , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_SOGEN                                      , 0, { gCardEffectBoostATKBoostDEF_08064760             , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_UMI                                        , 0, { gCardEffectBoostATKBoostDEF_08064760             , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_YAMI                                       , 0, { gCardEffectBoostATKBoostDEF_08064760             , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DARK_HOLE                                  , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroyAll_08050750                   , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_RAIGEKI                                    , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroy_080507AC                      , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MOOYAN_CURRY                               , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , gCardEffectGainLP_08081CE8                        } },
    { KONAMI_RED_MEDICINE                               , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , gCardEffectGainLPDraw_08081D9C                    } },
    { KONAMI_GOBLIN_S_SECRET_REMEDY                     , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , gCardEffectGainLPDraw_08081D9C                    } },
    { KONAMI_SOUL_OF_THE_PURE                           , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , gCardEffectGainLPDraw_08081D9C                    } },
    { KONAMI_DIAN_KETO_THE_CURE_MASTER                  , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , gCardEffectGainLPDraw_08081D9C                    } },
    { KONAMI_SPARKS                                     , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , gCardEffectDamage_08081DB0                        } },
    { KONAMI_HINOTAMA_NONE                              , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , gCardEffectDamage_08081DB0                        } },
    { KONAMI_FINAL_FLAME_NONE                           , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , gCardEffectDamage_08081DB0                        } },
    { KONAMI_OOKAZI                                     , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , gCardEffectDamage_08081DB0                        } },
    { KONAMI_TREMENDOUS_FIRE                            , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_SWORDS_OF_REVEALING_LIGHT                  , 0, { gCardEffectPreventAttack_08066BF0                , gCardEffectPreventAttack_08050130                , gCardEffectDestroyDamage_080904F0                , NULL                                             , NULL                                              } },
    { KONAMI_SPELLBINDING_CIRCLE                        , 0, { gCardEffectDestroyChangePosition_08066C40        , gCardEffectDestroyPreventAttack_0804F5C4         , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_DARK_PIERCING_LIGHT                        , 0, { gCardEffectPreventAttack_08066BF0                , gCardEffectPreventAttack_08050130                , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_KUNAI_WITH_CHAIN                           , 0, { gCardEffectBoostATKBoostDEF_080679D8             , gCardEffectEquipBoostATK_0805000C                , gCardEffectBoostATKBoostDEF_0805C6B0             , NULL                                             , gCardEffectBoostATKBoostDEF_08082290              } },
    { KONAMI_MAGICAL_LABYRINTH                          , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_WARRIOR_ELIMINATION_NONE                   , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroyAll_08050A54                   , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_SALAMANDRA                                 , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_ETERNAL_REST                               , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroyAll_08050A54                   , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MEGAMORPH                                  , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_METALMORPH                                 , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_ACID_RAIN_NONE                             , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroyAll_08050A54                   , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_CRUSH_CARD                                 , 0, { gCardEffectDestroyAllTribute_08067C0C            , gCardEffectTributeDestroy_08050EAC               , NULL                                             , gCardEffectTributeSpecialSummon_08056930         , NULL                                              } },
    { KONAMI_ERADICATING_AEROSOL_NONE                   , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroyAll_08050A54                   , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_BREATH_OF_LIGHT_NONE                       , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroyAll_08050A54                   , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_ETERNAL_DROUGHT_NONE                       , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroyAll_08050A54                   , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_BRIGHT_CASTLE                              , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_SHADOW_SPELL                               , 0, { gCardEffectDestroyChangePosition_08066C40        , gCardEffectDestroyReduceATK_08051614             , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_BLACK_LUSTER_RITUAL                        , 0, { gCardEffectRitualSummonTribute_08086CDC          , NULL                                             , gCardEffectRitualSummonTribute_08086C80          , NULL                                             , NULL                                              } },
    { KONAMI_ZERA_RITUAL                                , 0, { gCardEffectRitualSummonTribute_08086CDC          , NULL                                             , gCardEffectRitualSummonTribute_08086C80          , NULL                                             , NULL                                              } },
    { KONAMI_HARPIE_S_FEATHER_DUSTER                    , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroySpellTrapDestroyAll_08051ABC   , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_WAR_LION_RITUAL                            , 0, { gCardEffectRitualSummonTribute_08086CDC          , NULL                                             , gCardEffectRitualSummonTribute_08086C80          , NULL                                             , NULL                                              } },
    { KONAMI_BEASTLY_MIRROR_RITUAL                      , 0, { gCardEffectRitualSummonTribute_08086CDC          , NULL                                             , gCardEffectRitualSummonTribute_08086C80          , NULL                                             , NULL                                              } },
    { KONAMI_COMMENCEMENT_DANCE                         , 0, { gCardEffectRitualSummonTribute_08086CDC          , NULL                                             , gCardEffectRitualSummonTribute_08086C80          , NULL                                             , NULL                                              } },
    { KONAMI_HAMBURGER_RECIPE                           , 0, { gCardEffectRitualSummonTribute_08086CDC          , NULL                                             , gCardEffectRitualSummonTribute_08086C80          , NULL                                             , NULL                                              } },
    { KONAMI_NOVOX_S_PRAYER                             , 0, { gCardEffectRitualSummonTribute_08086CDC          , NULL                                             , gCardEffectRitualSummonTribute_08086C80          , NULL                                             , NULL                                              } },
    { KONAMI_HOUSE_OF_ADHESIVE_TAPE                     , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroySpecialSummon_080517B4         , gCardEffectDestroySpecialSummon_0805CF1C         , NULL                                             , gCardEffectDestroySpecialSummon_08082744          } },
    { KONAMI_EATGABOON_NONE                             , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroySpecialSummon_080517B4         , gCardEffectDestroySpecialSummon_0805CF1C         , NULL                                             , gCardEffectDestroySpecialSummon_08082744          } },
    { KONAMI_ACID_TRAP_HOLE                             , 0, { gCardEffectDestroyChangePosition_08067EA0        , gCardEffectDestroyChangePosition_080511B0        , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_WIDESPREAD_RUIN                            , 0, { gCardEffectDestroy_08069984                      , gCardEffectDestroyChangePosition_08051200        , gCardEffectDestroyChangePosition_0805D998        , NULL                                             , NULL                                              } },
    { KONAMI_REVERSE_TRAP                               , 0, { gCardEffectBoostATKReduceATK_08067F90            , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_FAKE_TRAP_NONE                             , 0, { gCardEffectDestroySpellTrap_08067FA4             , NULL                                             , gCardEffectDestroySpellTrap_0805C818             , NULL                                             , NULL                                              } },
    { KONAMI_TURTLE_OATH                                , 0, { gCardEffectRitualSummonTribute_08086CDC          , NULL                                             , gCardEffectRitualSummonTribute_08086C80          , NULL                                             , NULL                                              } },
    { KONAMI_RESURRECTION_OF_CHAKRA                     , 0, { gCardEffectRitualSummonTribute_08086CDC          , NULL                                             , gCardEffectRitualSummonTribute_08086C80          , NULL                                             , NULL                                              } },
    { KONAMI_JAVELIN_BEETLE_PACT                        , 0, { gCardEffectRitualSummonTribute_08086CDC          , NULL                                             , gCardEffectRitualSummonTribute_08086C80          , NULL                                             , NULL                                              } },
    { KONAMI_GARMA_SWORD_OATH                           , 0, { gCardEffectRitualSummonTribute_08086CDC          , NULL                                             , gCardEffectRitualSummonTribute_08086C80          , NULL                                             , NULL                                              } },
    { KONAMI_REVIVAL_OF_DOKURORIDER                     , 0, { gCardEffectRitualSummonTribute_08086CDC          , NULL                                             , gCardEffectRitualSummonTribute_08086C80          , NULL                                             , NULL                                              } },
    { KONAMI_FORTRESS_WHALE_S_OATH                      , 0, { gCardEffectRitualSummonTribute_08086CDC          , NULL                                             , gCardEffectRitualSummonTribute_08086C80          , NULL                                             , NULL                                              } },
    { KONAMI_DARK_MAGIC_RITUAL                          , 0, { gCardEffectRitualSummonTribute_08086CDC          , NULL                                             , gCardEffectRitualSummonTribute_08086C80          , NULL                                             , NULL                                              } },
    { KONAMI_TIME_MACHINE                               , 0, { gCardEffectSpecialSummonSendToGY_08068D8C        , NULL                                             , gCardEffectSpecialSummonSendToGY_0805CC08        , NULL                                             , NULL                                              } },
    { KONAMI_TOON_WORLD                                 , 0, { NULL                                             , NULL                                             , NULL                                             , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_GORGON_S_EYE                               , 0, { gCardEffectNegate_0806B558                       , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_BLACK_ILLUSION_RITUAL                      , 0, { gCardEffectRitualSummonTribute_08086CDC          , NULL                                             , gCardEffectRitualSummonTribute_08086C80          , NULL                                             , NULL                                              } },
    { KONAMI_BRAIN_CONTROL                              , 0, { gCardEffectTakeControlEndPhase_0806A2EC          , gCardEffectTakeControlFlip_08052080              , gCardEffectTakeControlFlip_0805D824              , gCardEffectDamage_0805635C                       , gCardEffectDestroy_0808198C                       } },
    { KONAMI_NEGATE_ATTACK                              , 0, { gCardEffectNegateBattlePhase_08068F0C            , NULL                                             , gCardEffectNegateBattlePhase_0805CD20            , NULL                                             , gCardEffectNegateGainLP_08081DCC                  } },
    { KONAMI_MULTIPLY                                   , 0, { gCardEffectChangePositionTribute_08068F78        , gCardEffectSpecialSummonTribute_08051CC4         , gCardEffectSpecialSummonSendToGY_0805CD6C        , gCardEffectTributeSpecialSummon_08056930         , NULL                                              } },
    { KONAMI_7_COMPLETED_NONE                           , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectBoostATKBoostDEF_08082510              } },
    { KONAMI_LIGHTFORCE_SWORD                           , 0, { gCardEffectBanishReturnToHand_08069008           , NULL                                             , gCardEffectDamageDiscard_0805CD88                , NULL                                             , NULL                                              } },
    { KONAMI_THE_FLUTE_OF_SUMMONING_DRAGON              , 0, { gCardEffectSpecialSummon_080690DC                , NULL                                             , gCardEffectSpecialSummon_0805CDB0                , NULL                                             , NULL                                              } },
    { KONAMI_SHIELD_SWORD                               , 0, { gCardEffectDirectAttackDiscard_08069104          , gCardEffectChangePositionEndPhase_08050C58       , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_GRACEFUL_CHARITY                           , 0, { gCardEffectDrawDiscard_08069148                  , NULL                                             , gCardEffectDraw_0805CF98                         , NULL                                             , gCardEffectGainLPDraw_08081D9C                    } },
    { KONAMI_CHAIN_DESTRUCTION                          , 0, { gCardEffectSpecialSummonDestroyAll_08069260      , gCardEffectDestroySpecialSummon_080513D0         , NULL                                             , NULL                                             , gCardEffectSpecialSummonDestroyAll_0808263C       } },
    { KONAMI_MESMERIC_CONTROL                           , 0, { gCardEffectUnknown_080693E4                      , NULL                                             , NULL                                             , NULL                                             , gCardEffectDamage_08081DB0                        } },
    { KONAMI_GRACEFUL_DICE                              , 0, { gCardEffectUnknown_08069420                      , gCardEffectDestroyEndPhase_08052398              , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_SKULL_DICE                                 , 0, { gCardEffectUnknown_08069420                      , gCardEffectDiscardDestroyAll_08051F04            , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MIND_CONTROL                               , 0, { gCardEffectTakeControlEndPhase_0806A2EC          , gCardEffectTakeControlDestroy_0804F618           , gCardEffectTakeControlFlip_0805D824              , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_SCAPEGOAT                                  , 0, { gCardEffectSpecialSummonChangePosition_080694A8  , NULL                                             , gCardEffectSpecialSummonChangePosition_0805C7A4  , NULL                                             , NULL                                              } },
    { KONAMI_AMPLIFIER                                  , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_CARD_DESTRUCTION                           , 0, { gCardEffectDrawDiscard_080695D4                  , NULL                                             , gCardEffectDrawDiscard_0805CDD8                  , NULL                                             , NULL                                              } },
    { KONAMI_TRAGEDY                                    , 0, { gCardEffectDestroy_08064660                      , gCardEffectChangePositionBanish_0805402C         , gCardEffectDestroyAllChangePosition_0805CE30     , NULL                                             , NULL                                              } },
    { KONAMI_MYSTICAL_REFPANEL_NONE                     , 0, { gCardEffectUnknown_080696D8                      , NULL                                             , gCardEffectNegateDestroy_0805D118                , NULL                                             , NULL                                              } },
    { KONAMI_DARK_MAGIC_CURTAIN                         , 0, { gCardEffectSpecialSummon_08069780                , NULL                                             , gCardEffectSpecialSummon_0805CE70                , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_MAGIC_ARM_SHIELD                           , 0, { gCardEffectUnknown_08069874                      , gCardEffectUnknown_080514B4                      , gCardEffectUnknown_0805CEC8                      , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_FISSURE                                    , 0, { gCardEffectDestroy_08069984                      , gCardEffectDestroy_080515A8                      , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_TRAP_HOLE                                  , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroySpecialSummon_080517B4         , gCardEffectDestroySpecialSummon_0805CF1C         , NULL                                             , gCardEffectDestroySpecialSummon_08082744          } },
    { KONAMI_POLYMERIZATION                             , 0, { gCardEffectSpecialSummonSendToGY_0807FDE8        , NULL                                             , gCardEffectSpecialSummonGraveyard_0807FD84       , NULL                                             , NULL                                              } },
    { KONAMI_REMOVE_TRAP                                , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroyCounter_08051898               , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_TWO_PRONGED_ATTACK                         , 0, { gCardEffectDestroy_08069B5C                      , gCardEffectDestroy_08050810                      , gCardEffectDestroy_0805CF3C                      , NULL                                             , gCardEffectDestroy_080827D4                       } },
    { KONAMI_BLUE_MEDICINE_NONE                         , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , gCardEffectGainLPDraw_08081D9C                    } },
    { KONAMI_RAIMEI_NONE                                , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , gCardEffectDamage_08081DB0                        } },
    { KONAMI_MONSTER_REBORN                             , 0, { gCardEffectSpecialSummonGraveyard_08069BE0       , NULL                                             , gCardEffectSpecialSummonGraveyard_0805CF70       , NULL                                             , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_DE_SPELL                                   , 0, { gCardEffectDestroyFlip_08066448                  , gCardEffectDestroySpellTrapFlip_08050214         , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_POT_OF_GREED                               , 0, { gCardEffectDraw_080656E0                         , NULL                                             , gCardEffectDraw_0805CF98                         , NULL                                             , gCardEffectGainLPDraw_08081D9C                    } },
    { KONAMI_GRAVEDIGGER_GHOUL                          , 0, { gCardEffectBanishGraveyard_08069C68              , NULL                                             , gCardEffectGraveyardBanish_0805CFEC              , NULL                                             , gCardEffectGraveyardBanish_080829BC               } },
    { KONAMI_BURNING_SPEAR_NONE                         , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_GUST_FAN_NONE                              , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_THE_INEXPERIENCED_SPY_NONE                 , 0, { gCardEffectUnknown_08069D08                      , NULL                                             , gCardEffectDamageDiscard_0805CD88                , NULL                                             , gCardEffectDamage_08081DB0                        } },
    { KONAMI_REINFORCEMENTS                             , 0, { gCardEffectEndPhaseBoostATK_08069DF8             , gCardEffectBoostATKSpecialSummon_0805086C        , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_CASTLE_WALLS                               , 0, { gCardEffectEndPhaseBoostATK_08069DF8             , gCardEffectBoostATKSpecialSummon_0805086C        , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_ULTIMATE_OFFERING                          , 0, { gCardEffectUnknown_08069E40                      , NULL                                             , gCardEffectUnknown_0805D020                      , gCardEffectNegateDiscard_0805715C                , NULL                                              } },
    { KONAMI_ANCIENT_TELESCOPE_NONE                     , 0, { gCardEffectUnknown_0806A004                      , NULL                                             , gCardEffectGraveyardSendToGY_0805FA5C            , NULL                                             , NULL                                              } },
    { KONAMI_WHITE_HOLE_NONE                            , 0, { gCardEffectNegateDestroy_0806A054                , NULL                                             , gCardEffectNegateDestroy_0805D118                , NULL                                             , NULL                                              } },
    { KONAMI_CALL_OF_THE_GRAVE_NONE                     , 0, { gCardEffectNegateDestroy_0806A054                , NULL                                             , gCardEffectNegateDestroy_0805D118                , NULL                                             , NULL                                              } },
    { KONAMI_ANTI_RAIGEKI_NONE                          , 0, { gCardEffectNegateDestroy_0806A054                , NULL                                             , gCardEffectNegateDestroy_0805D118                , NULL                                             , NULL                                              } },
    { KONAMI_TRIBUTE_TO_THE_DOOMED                      , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroy_08050994                      , gCardEffectDiscard_0805C1E4                      , gCardEffectDiscard_08056380                      , gCardEffectDestroy_0808198C                       } },
    { KONAMI_SOUL_RELEASE                               , 0, { gCardEffectBanishGraveyard_08069C68              , NULL                                             , gCardEffectBanishGraveyard_0805D740              , NULL                                             , gCardEffectGraveyardBanish_080829BC               } },
    { KONAMI_THE_CHEERFUL_COFFIN                        , 0, { gCardEffectDiscardGraveyard_0806A118             , NULL                                             , gCardEffectDiscardGraveyard_0805D7A4             , NULL                                             , gCardEffectGainLPDraw_08081D9C                    } },
    { KONAMI_CALL_OF_DARKNESS_NONE                      , 0, { gCardEffectSendToGYGraveyard_0806A240            , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_CHANGE_OF_HEART                            , 0, { gCardEffectTakeControlEndPhase_0806A2EC          , gCardEffectTakeControlDestroy_0804F618           , gCardEffectTakeControlFlip_0805D824              , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_SOLEMN_JUDGMENT                            , 0, { gCardEffectSpecialSummonNegate_0806A334          , NULL                                             , gCardEffectSpecialSummonNegate_0805D840          , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_MAGIC_JAMMER                               , 0, { gCardEffectNegateDestroy_08065698                , NULL                                             , gCardEffectNegateDestroy_0805D118                , gCardEffectDiscard_08056380                      , NULL                                              } },
    { KONAMI_SEVEN_TOOLS_OF_THE_BANDIT                  , 0, { gCardEffectNegateDestroy_08065698                , NULL                                             , gCardEffectNegateDestroy_0805D118                , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_HORN_OF_HEAVEN                             , 0, { gCardEffectSpecialSummonDestroy_0806A3EC         , NULL                                             , gCardEffectSpecialSummonNegate_0805D8BC          , gCardEffectSpecialSummonNegate_08057270          , NULL                                              } },
    { KONAMI_JUST_DESSERTS                              , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectDamageSearch_0805C318                 , NULL                                             , NULL                                              } },
    { KONAMI_ROYAL_DECREE                               , 0, { gCardEffectNegate_08068828                       , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_POLYMERIZATION_2                           , 0, { gCardEffectSpecialSummonSendToGY_0807FDE8        , NULL                                             , gCardEffectSpecialSummonGraveyard_0807FD84       , NULL                                             , NULL                                              } },
    { KONAMI_LAST_DAY_OF_WITCH_NONE                     , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroyAll_08050A54                   , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_EXILE_OF_THE_WICKED_NONE                   , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroyAll_08050A54                   , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_RESTRUCTER_REVOLUTION                      , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectDamageDiscard_0805CD88                , NULL                                             , gCardEffectDamage_08081DB0                        } },
    { KONAMI_FUSION_SAGE                                , 0, { gCardEffectSearchDiscard_0806A424                , NULL                                             , gCardEffectSearchGraveyard_0805C43C              , NULL                                             , NULL                                              } },
    { KONAMI_SWORD_OF_DEEP_SEATED                       , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_BLOCK_ATTACK                               , 0, { gCardEffectChangePosition_0806A4BC               , gCardEffectChangePosition_08051924               , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_THE_UNHAPPY_MAIDEN                         , 0, { gCardEffectSendToGYGraveyard_0806A520            , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_GERM_INFECTION                             , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_PARALYZING_POTION_NONE                     , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_LAST_WILL                                  , 0, { gCardEffectSpecialSummonSendToGY_0806A700        , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_WABOKU                                     , 0, { gCardEffectUnknown_0806A760                      , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MIRROR_FORCE                               , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroyAllChangePosition_08051DD8     , gCardEffectDestroyChangePosition_0805D998        , NULL                                             , NULL                                              } },
    { KONAMI_RING_OF_MAGNETISM                          , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_SHARE_THE_PAIN                             , 0, { gCardEffectTribute_0806A784                      , NULL                                             , gCardEffectTribute_0805D9CC                      , gCardEffectTribute_080567A0                      , NULL                                              } },
    { KONAMI_STIM_PACK                                  , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_HEAVY_STORM                                , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroySpellTrapDestroyAll_08051998   , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_GRYPHON_WING_NONE                          , 0, { gCardEffectNegateDestroy_0806A054                , gCardEffectDestroySpellTrapDestroyAll_08051ABC   , gCardEffectNegateDestroy_0805D118                , NULL                                             , NULL                                              } },
    { KONAMI_CURSE_OF_FIEND_NONE                        , 0, { gCardEffectChangePositionStandbyPhase_0806A7C4   , NULL                                             , gCardEffectChangePositionStandbyPhase_0805DA04   , NULL                                             , NULL                                              } },
    { KONAMI_UPSTART_GOBLIN                             , 0, { gCardEffectDrawGainLP_0806A884                   , NULL                                             , gCardEffectDraw_0805CF98                         , NULL                                             , NULL                                              } },
    { KONAMI_FINAL_DESTINY                              , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroyAllDamage_0805501C             , gCardEffectDiscardDestroyAll_0805DA74            , gCardEffectDiscard_08056380                      , NULL                                              } },
    { KONAMI_SNATCH_STEAL                               , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , gCardEffectTakeControlFlip_0805D824              , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_CHORUS_OF_SANCTUARY                        , 0, { gCardEffectBoostATKBoostDEF_08064760             , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_CONFISCATION                               , 0, { gCardEffectDiscardGraveyard_0806A8BC             , NULL                                             , gCardEffectDamageDiscard_0805CD88                , gCardEffectDamage_0805635C                       , gCardEffectDamage_08081DB0                        } },
    { KONAMI_DELINQUENT_DUO                             , 0, { gCardEffectDiscardDamage_0806A954                , NULL                                             , gCardEffectDamageDiscard_0805CD88                , gCardEffectDamage_0805635C                       , gCardEffectDamage_08081DB0                        } },
    { KONAMI_DARKNESS_APPROACHES_NONE                   , 0, { gCardEffectDiscardChangePosition_0806A9A4        , gCardEffectChangePosition_08051364               , gCardEffectDiscardChangePosition_0805DAA4        , gCardEffectDiscard_08056380                      , gCardEffectDestroy_0808198C                       } },
    { KONAMI_FAIRY_S_HAND_MIRROR                        , 0, { gCardEffectUnknown_0806AA14                      , NULL                                             , gCardEffectUnknown_0805DB60                      , NULL                                             , gCardEffectUnknown_08082B88                       } },
    { KONAMI_TAILOR_OF_THE_FICKLE                       , 0, { gCardEffectEquip_0806AA64                        , gCardEffectEquip_08051A08                        , NULL                                             , NULL                                             , gCardEffectEquip_08082D0C                         } },
    { KONAMI_RUSH_RECKLESSLY                            , 0, { gCardEffectEndPhaseBoostATK_08069DF8             , gCardEffectBoostATKSpecialSummon_0805086C        , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_THE_RELIABLE_GUARDIAN                      , 0, { gCardEffectEndPhaseBoostATK_08069DF8             , gCardEffectBoostATKSpecialSummon_0805086C        , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_THE_FORCEFUL_SENTRY                        , 0, { gCardEffectUnknown_0806AB0C                      , NULL                                             , gCardEffectDamageDiscard_0805CD88                , NULL                                             , gCardEffectDamage_08081DB0                        } },
    { KONAMI_MYSTICAL_SPACE_TYPHOON                     , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroySpellTrap_08051B20             , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_GIANT_TRUNADE                              , 0, { gCardEffectReturnToHand_0806ABD4                 , gCardEffectReturnToHand_08051B9C                 , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_PAINFUL_CHOICE                             , 0, { gCardEffectSearchDiscard_0806ABEC                , NULL                                             , gCardEffectSearchDiscard_0805DBE0                , NULL                                             , NULL                                              } },
    { KONAMI_SNAKE_FANG                                 , 0, { gCardEffectEndPhaseBoostATK_08069DF8             , gCardEffectBoostATKSpecialSummon_0805086C        , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_GAIA_POWER                                 , 0, { gCardEffectBoostATKBoostDEF_08064760             , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_UMIIRUKA                                   , 0, { gCardEffectBoostATKBoostDEF_08064760             , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MOLTEN_DESTRUCTION                         , 0, { gCardEffectBoostATKBoostDEF_08064760             , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_RISING_AIR_CURRENT                         , 0, { gCardEffectBoostATKBoostDEF_08064760             , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_LUMINOUS_SPARK                             , 0, { gCardEffectBoostATKBoostDEF_08064760             , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MYSTIC_PLASMA_ZONE                         , 0, { gCardEffectBoostATKBoostDEF_08064760             , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MICHIZURE                                  , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroy_08050994                      , gCardEffectSendToGYDestroy_0805DC00              , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_GUST                                       , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroySpellTrap_08051B20             , gCardEffectSendToGYDestroySpellTrap_0805DC6C     , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_DRIVING_SNOW                               , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroySpellTrap_08051B20             , gCardEffectSendToGYDestroySpellTrap_0805DC6C     , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_ARMORED_GLASS_NONE                         , 0, { gCardEffectNegate_0806B558                       , NULL                                             , gCardEffectNegateEquip_0805DD40                  , NULL                                             , NULL                                              } },
    { KONAMI_WORLD_SUPPRESSION_NONE                     , 0, { gCardEffectNegate_0806B558                       , NULL                                             , gCardEffectNegate_0805DD58                       , NULL                                             , NULL                                              } },
    { KONAMI_MYSTIC_PROBE_NONE                          , 0, { gCardEffectNegate_0806B558                       , NULL                                             , gCardEffectNegate_0805DD58                       , NULL                                             , NULL                                              } },
    { KONAMI_METAL_DETECTOR_NONE                        , 0, { gCardEffectNegate_0806B558                       , NULL                                             , gCardEffectNegate_0805DD58                       , NULL                                             , NULL                                              } },
    { KONAMI_NUMINOUS_HEALER                            , 0, { gCardEffectDamageGraveyard_0806B56C              , NULL                                             , gCardEffectDamageGraveyard_0805DDDC              , NULL                                             , NULL                                              } },
    { KONAMI_APPROPRIATE                                , 0, { NULL                                             , NULL                                             , gCardEffectDraw_0805DE10                         , NULL                                             , NULL                                              } },
    { KONAMI_FORCED_REQUISITION                         , 0, { NULL                                             , NULL                                             , gCardEffectDiscard_0805DE50                      , NULL                                             , NULL                                              } },
    { KONAMI_MINOR_GOBLIN_OFFICIAL                      , 0, { NULL                                             , NULL                                             , gCardEffectDamageStandbyPhase_0805DE7C           , NULL                                             , NULL                                              } },
    { KONAMI_GAMBLE                                     , 0, { gCardEffectDrawRNG_0806B694                      , NULL                                             , gCardEffectDrawRNG_0805DEAC                      , NULL                                             , NULL                                              } },
    { KONAMI_DNA_SURGERY                                , 0, { NULL                                             , NULL                                             , NULL                                             , NULL                                             , gCardEffectDestroyPreventAttack_08082E98          } },
    { KONAMI_THE_REGULATION_OF_TRIBE                    , 0, { NULL                                             , NULL                                             , NULL                                             , NULL                                             , gCardEffectDestroyPreventAttack_08082E98          } },
    { KONAMI_BACKUP_SOLDIER                             , 0, { gCardEffectGraveyardSearch_08066530              , NULL                                             , gCardEffectGraveyardDraw_0805DF14                , NULL                                             , gCardEffectGraveyard_08082F44                     } },
    { KONAMI_ATTACK_AND_RECEIVE                         , 0, { gCardEffectDamageGraveyard_0806B56C              , NULL                                             , gCardEffectDamageGraveyard_0805DDDC              , NULL                                             , NULL                                              } },
    { KONAMI_MAJOR_RIOT_NONE                            , 0, { gCardEffectSpecialSummonReturnToHand_0806B784    , NULL                                             , gCardEffectSendToGYDestroySpellTrap_0805DC6C     , NULL                                             , NULL                                              } },
    { KONAMI_CEASEFIRE                                  , 0, { gCardEffectChangePositionBoostDEF_0806BA78       , NULL                                             , gCardEffectChangePositionBoostDEF_0805DF44       , NULL                                             , NULL                                              } },
    { KONAMI_IMPERIAL_ORDER                             , 0, { gCardEffectNegate_08068828                       , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MAGICAL_HATS                               , 0, { gCardEffectDestroyChangePosition_0806BB74        , gCardEffectDestroyChangePosition_08051E24        , gCardEffectDestroyChangePosition_0805DFA0        , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_NOBLEMAN_OF_CROSSOUT                       , 0, { gCardEffectBanishDestroy_0806BF68                , gCardEffectBanishDestroy_08051BFC                , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_NOBLEMAN_OF_EXTERMINATION                  , 0, { gCardEffectBanishDestroy_0806BF68                , gCardEffectBanishDestroySpellTrap_08051C3C       , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_THE_SHALLOW_GRAVE                          , 0, { gCardEffectSpecialSummonChangePosition_0806C0CC  , NULL                                             , gCardEffectSpecialSummonChangePosition_0805E008  , NULL                                             , gCardEffectSpecialSummonChangePosition_08083170   } },
    { KONAMI_PREMATURE_BURIAL                           , 0, { gCardEffectSpecialSummonDestroy_0806C978         , NULL                                             , gCardEffectSpecialSummonGraveyard_0805C248       , gCardEffectDamage_0805635C                       , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_PROHIBITION_NONE                           , 0, { gCardEffectUnknown_0806C368                      , NULL                                             , NULL                                             , NULL                                             , gCardEffectSearchDiscard_08083280                 } },
    { KONAMI_TIME_SEAL                                  , 0, { gCardEffectSpecialSummonDestroy_0806C764         , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_GRAVEROBBER                                , 0, { gCardEffectGraveyard_0806C780                    , NULL                                             , gCardEffectGraveyard_0805E0EC                    , NULL                                             , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_GIFT_OF_THE_MYSTICAL_ELF                   , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectDamageSearch_0805C318                 , NULL                                             , NULL                                              } },
    { KONAMI_THE_EYE_OF_TRUTH                           , 0, { gCardEffectGainLPStandbyPhase_0806C808           , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DUST_TORNADO                               , 0, { gCardEffectDestroySpellTrap_0806C828             , gCardEffectDestroySpellTrap_08051E94             , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_CALL_OF_THE_HAUNTED                        , 0, { gCardEffectSpecialSummonDestroy_0806C978         , NULL                                             , gCardEffectSpecialSummonGraveyard_0805C248       , NULL                                             , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_SOLOMON_S_LAWBOOK                          , 0, { gCardEffectStandbyPhase_0806CB54                 , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_EARTHSHAKER_NONE                           , 0, { gCardEffectDestroy_0806CBE8                      , NULL                                             , gCardEffectDestroy_0805E188                      , NULL                                             , NULL                                              } },
    { KONAMI_ENCHANTED_JAVELIN                          , 0, { gCardEffectNegateBoostATK_0806CD40               , NULL                                             , gCardEffectNegateBoostATK_0805E1B0               , NULL                                             , gCardEffectNegateGainLP_08081DCC                  } },
    { KONAMI_MIRROR_WALL                                , 0, { gCardEffectDestroyReduceATK_0806CE68             , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_WINDSTORM_OF_ETAQUA                        , 0, { gCardEffectChangePosition_0806D0CC               , gCardEffectDiscardDestroyAll_08051F04            , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_RING_OF_DESTRUCTION                        , 0, { gCardEffectDestroyDamage_0806D224                , gCardEffectDestroyDamage_08051F60                , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_SEBEK_S_BLESSING                           , 0, { gCardEffectGainLPDamage_0806D2D0                 , NULL                                             , gCardEffectGainLPDamage_0805E30C                 , NULL                                             , gCardEffectNegateGainLP_08081DCC                  } },
    { KONAMI_RIRYOKU                                    , 0, { gCardEffectBoostATKReduceATK_0806D2F0            , gCardEffectDestroyBoostATK_08051FD0              , gCardEffectFlipDestroy_0805C680                  , NULL                                             , gCardEffectBoostATKReduceATK_08083450             } },
    { KONAMI_SWORD_OF_DRAGON_S_SOUL                     , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_SEAL_OF_THE_ANCIENTS_NONE                  , 0, { gCardEffectDamageChangePosition_0806A548         , gCardEffectStandbyPhaseDamage_08054F64           , NULL                                             , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_THE_MASK_OF_REMNANTS_NONE                  , 0, { gCardEffectEquip_0806DA84                        , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_SOUL_EXCHANGE                              , 0, { gCardEffectTributeBattlePhase_0806DAB4           , gCardEffectReturnToHandChangePosition_0804F4EC   , gCardEffectBattlePhaseDamage_0805E55C            , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_CHOSEN_ONE_NONE                            , 0, { gCardEffectSpecialSummonSendToGY_0806DBCC        , NULL                                             , gCardEffectSpecialSummonSendToGY_0805E578        , NULL                                             , NULL                                              } },
    { KONAMI_MASK_OF_WEAKNESS                           , 0, { gCardEffectReduceATK_0806E00C                    , NULL                                             , gCardEffectReduceATK_0805E694                    , NULL                                             , gCardEffectNegateGainLP_08081DCC                  } },
    { KONAMI_CURSE_OF_THE_MASKED_BEAST                  , 0, { gCardEffectRitualSummonTribute_08086CDC          , NULL                                             , gCardEffectRitualSummonTribute_08086C80          , NULL                                             , NULL                                              } },
    { KONAMI_MASK_OF_DISPEL                             , 0, { gCardEffectDestroyStandbyPhase_0806E070          , gCardEffectDestroyStandbyPhase_080526CC          , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_MASK_OF_THE_ACCURSED                       , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_MASK_OF_BRUTALITY                          , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_RETURN_OF_THE_DOOMED                       , 0, { gCardEffectDiscardReturnToHand_0806E118          , NULL                                             , gCardEffectDiscardReturnToHand_0805E6F4          , gCardEffectDiscardReturnToHand_08057458          , NULL                                              } },
    { KONAMI_LIGHTNING_BLADE                            , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_TORNADO_WALL                               , 0, { NULL                                             , NULL                                             , gCardEffectDestroyDamage_0805E734                , NULL                                             , NULL                                              } },
    { KONAMI_FAIRY_BOX                                  , 0, { gCardEffectDestroyDamage_0806E1C4                , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_TORRENTIAL_TRIBUTE                         , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroyAll_08050750                   , gCardEffectSpecialSummonDestroyAll_0805E778      , NULL                                             , NULL                                              } },
    { KONAMI_MULTIPLICATION_OF_ANTS                     , 0, { gCardEffectSpecialSummonTribute_0806E308         , gCardEffectSpecialSummonTribute_08052224         , gCardEffectSpecialSummon_0805C218                , gCardEffectTributeSpecialSummon_08056930         , NULL                                              } },
    { KONAMI_DE_FUSION                                  , 0, { gCardEffectSpecialSummonChangePosition_0806E3FC  , gCardEffectSpecialSummonChangePosition_08052734  , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_JAM_DEFENDER                               , 0, { gCardEffectUnknown_0806E62C                      , gCardEffectUnknown_08052790                      , gCardEffectSpecialSummonSendToGY_0805E790        , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_MAGIC_CYLINDER                             , 0, { gCardEffectNegateBoostATK_0806CD40               , NULL                                             , gCardEffectNegateBoostATK_0805E1B0               , NULL                                             , gCardEffectNegateGainLP_08081DCC                  } },
    { KONAMI_BURNING_LAND                               , 0, { gCardEffectDestroyAllDamage_0806E6F8             , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_COLD_WAVE                                  , 0, { gCardEffectUnknown_0806E76C                      , NULL                                             , gCardEffectUnknown_0805E81C                      , NULL                                             , NULL                                              } },
    { KONAMI_FAIRY_METEOR_CRUSH                         , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_LIMITER_REMOVAL                            , 0, { gCardEffectEndPhaseBoostATK_0806E780             , gCardEffectDestroyEndPhase_08052398              , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_SHIFT                                      , 0, { gCardEffectUnknown_0806E840                      , gCardEffectUnknown_08052674                      , gCardEffectUnknown_0805E864                      , NULL                                             , gCardEffectUnknown_08083704                       } },
    { KONAMI_INSECT_IMITATION                           , 0, { gCardEffectSpecialSummonSendToGY_0806E898        , gCardEffectSpecialSummonTribute_08052224         , gCardEffectSpecialSummonTribute_0805E92C         , gCardEffectTributeSpecialSummon_08056930         , NULL                                              } },
    { KONAMI_DIMENSIONHOLE                              , 0, { gCardEffectBanishStandbyPhase_0806EA00           , gCardEffectBanishStandbyPhase_08052820           , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_MAGIC_DRAIN                                , 0, { gCardEffectNegateDiscard_0806EBD4                , NULL                                             , gCardEffectNegateDestroy_0805D118                , NULL                                             , NULL                                              } },
    { KONAMI_SHADOW_OF_EYES                             , 0, { gCardEffectChangePositionFlip_0806ECB0           , gCardEffectChangePositionBanish_08052884         , gCardEffectChangePositionFlip_0805E9BC           , NULL                                             , gCardEffectSpecialSummonDestroyAll_0808263C       } },
    { KONAMI_RAIN_OF_MERCY                              , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MONSTER_RECOVERY                           , 0, { gCardEffectDraw_0806EE54                         , gCardEffectDraw_080525D0                         , gCardEffectDraw_0805EAE8                         , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_TYPE_ZERO_MAGIC_CRUSHER                    , 0, { gCardEffectDiscardDamage_0806EF88                , NULL                                             , gCardEffectDiscardDamage_0805EBC4                , gCardEffectDiscardDamage_08057470                , NULL                                              } },
    { KONAMI_CREATURE_SWAP                              , 0, { gCardEffectTakeControlChangePosition_0806F008    , gCardEffectTakeControlChangePosition_080508CC    , gCardEffectTakeControlDestroy_0805EC40           , NULL                                             , NULL                                              } },
    { KONAMI_THOUSAND_KNIVES                            , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroy_0804F550                      , gCardEffectDestroy_0805EC00                      , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_MYSTIC_BOX                                 , 0, { gCardEffectDestroy_0806F1C8                      , gCardEffectDestroy_08050924                      , gCardEffectTakeControlDestroy_0805EC40           , NULL                                             , gCardEffectDestroy_080839B4                       } },
    { KONAMI_GROUND_COLLAPSE                            , 0, { gCardEffectUnknown_0806F2CC                      , NULL                                             , gCardEffectUnknown_0805EC74                      , NULL                                             , gCardEffectUnknown_08083BA0                       } },
    { KONAMI_JAR_OF_GREED                               , 0, { gCardEffectDraw_080656E0                         , NULL                                             , gCardEffectDraw_0805CF98                         , NULL                                             , gCardEffectGainLPDraw_08081D9C                    } },
    { KONAMI_SCROLL_OF_BEWITCHMENT                      , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquip_08083C98                         } },
    { KONAMI_UNITED_WE_STAND                            , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_MAGE_POWER                                 , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_OFFERINGS_TO_THE_DOOMED                    , 0, { gCardEffectDestroy_0806F5D0                      , gCardEffectDestroyDamage_08051F60                , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_METEOR_OF_DESTRUCTION                      , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectDamage_0805EDF0                       , NULL                                             , NULL                                              } },
    { KONAMI_LIGHTNING_VORTEX                           , 0, { gCardEffectDestroy_08064660                      , gCardEffectDiscardDestroyAll_08051F04            , gCardEffectDiscard_0805C1E4                      , gCardEffectDiscard_08056380                      , NULL                                              } },
    { KONAMI_EXCHANGE                                   , 0, { gCardEffectSearchSendToGY_0806F5F0               , NULL                                             , gCardEffectSearchBanish_0805EE20                 , NULL                                             , NULL                                              } },
    { KONAMI_DARK_MAGICIAN_S_TOME_OF_BLACK_MAGIC        , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_DESTINY_BOARD                              , 0, { gCardEffectSendToGYGraveyard_0806F85C            , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DARK_SPIRIT_OF_THE_SILENT                  , 0, { gCardEffectNegateChangePosition_0806FB88         , gCardEffectNegateChangePosition_0805153C         , gCardEffectNegateBoostATK_0805E1B0               , NULL                                             , gCardEffectNegateChangePosition_08083D38          } },
    { KONAMI_JUDGMENT_OF_ANUBIS                         , 0, { gCardEffectNegateDiscard_0806FF50                , NULL                                             , gCardEffectNegateDestroy_0805D118                , gCardEffectDiscard_08056380                      , NULL                                              } },
    { KONAMI_EMBODIMENT_OF_APOPHIS                      , 0, { gCardEffectSpecialSummon_0807004C                , NULL                                             , gCardEffectSpecialSummon_0805EEE4                , NULL                                             , NULL                                              } },
    { KONAMI_FOOLISH_BURIAL                             , 0, { gCardEffectSendToGYGraveyard_080700F4            , NULL                                             , gCardEffectSearchGraveyard_0805C43C              , NULL                                             , NULL                                              } },
    { KONAMI_MAKIU                                      , 0, { gCardEffectDestroyBattlePhase_080701A4           , gCardEffectDestroyDamage_08052AA8                , gCardEffectDestroyBattlePhase_0805EF10           , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_SPIRITUALISM                               , 0, { gCardEffectReturnToHand_0806734C                 , gCardEffectNegateReturnToHand_08052FD4           , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_COLLECTED_POWER                            , 0, { gCardEffectDestroyEquip_0807076C                 , gCardEffectDestroyBoostATK_08051FD0              , gCardEffectDestroyEquip_0805F088                 , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_ROYAL_COMMAND                              , 0, { gCardEffectNegateFlip_08070900                   , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_RIRYOKU_FIELD                              , 0, { gCardEffectNegateDestroy_08065698                , NULL                                             , gCardEffectNegateDestroy_0805D118                , NULL                                             , NULL                                              } },
    { KONAMI_SKULL_LAIR                                 , 0, { gCardEffectBanishDestroy_0807097C                , gCardEffectBanishDestroy_08052F10                , gCardEffectBanishDestroy_0805F0D8                , gCardEffectBanishDestroy_08057874                , NULL                                              } },
    { KONAMI_DEAL_OF_PHANTOM                            , 0, { gCardEffectBoostATKEndPhase_08076EBC             , gCardEffectBoostATKSpecialSummon_0805086C        , gCardEffectBoostATKGraveyard_0805F1B0            , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_DESTRUCTION_PUNCH                          , 0, { gCardEffectDestroyChangePosition_08070AA4        , NULL                                             , gCardEffectDestroyChangePosition_0805F1CC        , NULL                                             , NULL                                              } },
    { KONAMI_THE_EMPEROR_S_HOLIDAY                      , 0, { gCardEffectNegate_08068828                       , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_CYCLON_LASER                               , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_SPIRIT_MESSAGE_I                           , 0, { NULL                                             , NULL                                             , gCardEffectSendToGYDestroy_080904EC              , NULL                                             , NULL                                              } },
    { KONAMI_SPIRIT_MESSAGE_N                           , 0, { NULL                                             , NULL                                             , gCardEffectSendToGYDestroy_080904EC              , NULL                                             , NULL                                              } },
    { KONAMI_SPIRIT_MESSAGE_A                           , 0, { NULL                                             , NULL                                             , gCardEffectSendToGYDestroy_080904EC              , NULL                                             , NULL                                              } },
    { KONAMI_SPIRIT_MESSAGE_L                           , 0, { NULL                                             , NULL                                             , gCardEffectSendToGYDestroy_080904EC              , NULL                                             , NULL                                              } },
    { KONAMI_BAIT_DOLL                                  , 0, { gCardEffectNegateDestroy_08070B14                , gCardEffectNegateDestroy_08053098                , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_FUSION_GATE                                , 0, { gCardEffectBoostATKBoostDEF_08064760             , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_EKIBYO_DRAKMORD                            , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_MIRACLE_DIG                                , 0, { gCardEffectBanishGraveyard_08070CA4              , NULL                                             , gCardEffectBanishGraveyard_0805F23C              , NULL                                             , gCardEffectGraveyard_08082F44                     } },
    { KONAMI_DRAGONIC_ATTACK_NONE                       , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_SPIRIT_ELIMINATION_NONE                    , 0, { gCardEffectDiscardEndPhase_08070D00              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_AMAZONESS_ARCHERS                          , 0, { gCardEffectReduceATKChangePosition_08070D2C      , NULL                                             , gCardEffectReduceATKChangePosition_0805F26C      , NULL                                             , NULL                                              } },
    { KONAMI_ROPE_OF_LIFE                               , 0, { gCardEffectSpecialSummonDiscard_08070E18         , NULL                                             , gCardEffectSpecialSummonDiscard_0805F298         , gCardEffectSpecialSummonDiscard_08057C28         , NULL                                              } },
    { KONAMI_ENCHANTED_ARROW                            , 0, { gCardEffectDestroyGainLP_08070EF4                , gCardEffectDestroy_08053110                      , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_NIGHTMARE_WHEEL                            , 0, { gCardEffectDestroyChangePosition_08066C40        , gCardEffectDestroyPreventAttack_0804F5C4         , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_BARK_OF_DARK_RULER                         , 0, { gCardEffectBoostATKEndPhase_08076EBC             , gCardEffectReduceATKDamage_080531F0              , gCardEffectReduceATKDamage_0805F33C              , NULL                                             , gCardEffectReduceATKDamage_08084038               } },
    { KONAMI_DOUBLE_SNARE                               , 0, { gCardEffectDestroy_08064654                      , gCardEffectNegateDestroy_080551BC                , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_REINFORCEMENT_OF_THE_ARMY                  , 0, { gCardEffectSearchSendToGY_080661FC               , NULL                                             , gCardEffectSearchGraveyard_0805C43C              , NULL                                             , NULL                                              } },
    { KONAMI_ARRAY_OF_REVEALING_LIGHT                   , 0, { gCardEffectBoostATKBoostDEF_08064760             , NULL                                             , NULL                                             , NULL                                             , gCardEffectDestroyPreventAttack_08082E98          } },
    { KONAMI_THE_WARRIOR_RETURNING_ALIVE                , 0, { gCardEffectGraveyardSearch_08066530              , NULL                                             , gCardEffectGraveyard_0805C2F0                    , NULL                                             , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_READY_FOR_INTERCEPTING                     , 0, { gCardEffectChangePosition_0807142C               , gCardEffectDestroyEndPhase_080502B0              , gCardEffectChangePosition_0805FAD0               , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_A_FEINT_PLAN                               , 0, { gCardEffectPreventAttackDirectAttack_08071488    , NULL                                             , gCardEffectPreventAttack_0805F480                , NULL                                             , NULL                                              } },
    { KONAMI_THE_DRAGON_S_BEAD                          , 0, { gCardEffectNegateDiscard_080714AC                , NULL                                             , gCardEffectNegateDiscard_0805F550                , gCardEffectNegateDiscard_0805715C                , NULL                                              } },
    { KONAMI_A_WINGBEAT_OF_GIANT_DRAGON                 , 0, { gCardEffectReturnToHandDestroySpellTrap_080714EC , gCardEffectReturnToHandDestroySpellTrap_080537C0 , gCardEffectReturnToHandDestroySpellTrap_0805F5E8 , NULL                                             , NULL                                              } },
    { KONAMI_DRAGON_S_GUNFIRE                           , 0, { gCardEffectDestroyDamage_0807158C                , gCardEffectDestroyEndPhase_080502B0              , gCardEffectDestroyDamage_0805F614                , gCardEffectDestroyDamage_08056BC4                , gCardEffectDestroyDamage_0808416C                 } },
    { KONAMI_STAMPING_DESTRUCTION                       , 0, { gCardEffectDestroySpellTrapDamage_080715AC       , gCardEffectDestroySpellTrap_08051B20             , gCardEffectDestroySpellTrapDamage_0805F628       , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_SUPER_REJUVENATION                         , 0, { gCardEffectDiscardEndPhase_08070D00              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_BURST_BREATH                               , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroyAllTribute_08053294            , NULL                                             , gCardEffectTributeSpecialSummon_08056930         , NULL                                              } },
    { KONAMI_EMERGENCY_PROVISIONS                       , 0, { gCardEffectDamageGraveyard_080655EC              , gCardEffectSendToGYGainLP_080537DC               , gCardEffectGraveyardSendToGY_08061D40            , gCardEffectSendToGYGainLP_08057D0C               , NULL                                              } },
    { KONAMI_DRAGGED_DOWN_INTO_THE_GRAVE                , 0, { gCardEffectDrawDiscard_080716FC                  , NULL                                             , gCardEffectDrawDiscard_0805F644                  , NULL                                             , NULL                                              } },
    { KONAMI_SPELL_REPRODUCTION                         , 0, { gCardEffectGraveyardSearch_08066530              , NULL                                             , gCardEffectSearchSendToGY_0805F698               , gCardEffectSearchSendToGY_08057EA8               , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_COLLAPSE                                   , 0, { gCardEffectEndPhaseBoostATK_08069DF8             , gCardEffectBoostATKSpecialSummon_0805086C        , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_CESTUS_OF_DAGLA                            , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_DE_SPELL_GERM_WEAPON                       , 0, { gCardEffectSendToGYGraveyard_080717F0            , gCardEffectTributeDestroy_08050EAC               , gCardEffectGraveyardSendToGY_0805FA5C            , gCardEffectSendToGYGraveyard_08057ECC            , NULL                                              } },
    { KONAMI_REVERSAL_OF_GRAVES                         , 0, { gCardEffectDamageGraveyard_080718C4              , NULL                                             , gCardEffectDamageGraveyard_080613B4              , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_BLAST_HELD_BY_A_TRIBUTE                    , 0, { gCardEffectDestroyAllDamage_080718D0             , gCardEffectDestroyAllDamage_080532B8             , gCardEffectDestroyAllDamage_0805F6E4             , NULL                                             , NULL                                              } },
    { KONAMI_SILENT_FIEND                               , 0, { gCardEffectSpecialSummonPreventAttack_080719FC   , NULL                                             , gCardEffectSpecialSummonGraveyard_0805C248       , NULL                                             , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_FENGSHENG_MIRROR                           , 0, { gCardEffectDiscardGraveyard_08071F58             , NULL                                             , gCardEffectDamageDiscard_0805CD88                , NULL                                             , NULL                                              } },
    { KONAMI_HEART_OF_CLEAR_WATER                       , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_A_LEGENDARY_OCEAN                          , 0, { gCardEffectBoostATKBoostDEF_08064760             , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_FUSION_SWORD_MURASAME_BLADE                , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_SMOKE_GRENADE_OF_THE_THIEF                 , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_THE_SECRET_OF_THE_BANDIT                   , 0, { gCardEffectBoostATKEndPhase_08076EBC             , gCardEffectBoostATKSpecialSummon_0805086C        , gCardEffectBattlePhaseDamage_0805E55C            , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_AFTER_THE_STRUGGLE                         , 0, { gCardEffectDiscardEndPhase_08070D00              , NULL                                             , gCardEffectBattlePhaseDamage_0805E55C            , NULL                                             , NULL                                              } },
    { KONAMI_BLAST_WITH_CHAIN                           , 0, { gCardEffectDestroyBoostATK_08072154              , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_DISAPPEAR                                  , 0, { gCardEffectBanishGraveyard_08069C68              , NULL                                             , gCardEffectGraveyardBanish_0805CFEC              , NULL                                             , gCardEffectGraveyardBanish_080829BC               } },
    { KONAMI_BOTTOMLESS_TRAP_HOLE                       , 0, { gCardEffectSpecialSummonBanish_0807220C          , gCardEffectSpecialSummonBanish_08053374          , NULL                                             , NULL                                             , gCardEffectSpecialSummonBanish_080841C0           } },
    { KONAMI_NUTRIENT_Z                                 , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectGainLPDamage_0805F85C                 , NULL                                             , NULL                                              } },
    { KONAMI_DROP_OFF                                   , 0, { gCardEffectDrawDiscard_080723D0                  , NULL                                             , gCardEffectDrawDiscard_0805F8B4                  , NULL                                             , NULL                                              } },
    { KONAMI_FIEND_COMEDIAN                             , 0, { gCardEffectBanishSendToGY_08072404               , NULL                                             , gCardEffectBanishSendToGY_0805F8F4               , NULL                                             , NULL                                              } },
    { KONAMI_LAST_TURN                                  , 0, { gCardEffectSpecialSummonSendToGY_08072540        , gCardEffectSpecialSummonSendToGY_08053F10        , gCardEffectSpecialSummonSendToGY_0805F930        , NULL                                             , NULL                                              } },
    { KONAMI_BOOK_OF_LIFE                               , 0, { gCardEffectSpecialSummonBanish_08072AAC          , NULL                                             , gCardEffectSpecialSummonBanish_0805FA84          , NULL                                             , gCardEffectSpecialSummonBanish_08084210           } },
    { KONAMI_BOOK_OF_TAIYOU                             , 0, { gCardEffectChangePosition_08072B7C               , gCardEffectBanishDestroy_08051BFC                , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_BOOK_OF_MOON                               , 0, { gCardEffectChangePosition_0807142C               , gCardEffectChangePosition_08051364               , gCardEffectChangePosition_0805FAD0               , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_TIMIDITY                                   , 0, { gCardEffectDestroySpellTrapEndPhase_08072D20     , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_PYRAMID_ENERGY                             , 0, { gCardEffectEndPhaseBoostATK_0806E780             , gCardEffectDestroyEndPhase_08052398              , NULL                                             , NULL                                             , gCardEffectBoostATKBoostDEF_08084318              } },
    { KONAMI_TUTAN_MASK                                 , 0, { gCardEffectNegateDestroy_08065698                , NULL                                             , gCardEffectNegateDestroy_0805D118                , NULL                                             , NULL                                              } },
    { KONAMI_ORDEAL_OF_A_TRAVELER                       , 0, { gCardEffectReturnToHand_08072D34                 , NULL                                             , gCardEffectReturnToHand_0805FBB8                 , NULL                                             , NULL                                              } },
    { KONAMI_CURSE_OF_ROYAL                             , 0, { gCardEffectNegateDestroy_08065698                , NULL                                             , gCardEffectNegateDestroy_0805D118                , NULL                                             , NULL                                              } },
    { KONAMI_NEEDLE_CEILING                             , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroyAll_08050A54                   , gCardEffectDestroyAll_0805FBE0                   , NULL                                             , NULL                                              } },
    { KONAMI_STATUE_OF_THE_WICKED                       , 0, { NULL                                             , NULL                                             , gCardEffectSendToGYDestroy_080904EC              , NULL                                             , NULL                                              } },
    { KONAMI_DARK_COFFIN                                , 0, { NULL                                             , NULL                                             , gCardEffectSendToGYDestroy_080904EC              , NULL                                             , NULL                                              } },
    { KONAMI_TRAP_DUSTSHOOT                             , 0, { gCardEffectUnknown_08073140                      , NULL                                             , gCardEffectUnknown_0805FC10                      , NULL                                             , NULL                                              } },
    { KONAMI_RECKLESS_GREED                             , 0, { gCardEffectDraw_080732A8                         , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_TOON_DEFENSE                               , 0, { gCardEffectDirectAttack_080732FC                 , NULL                                             , gCardEffectDirectAttack_0805FC94                 , NULL                                             , NULL                                              } },
    { KONAMI_TOON_TABLE_OF_CONTENTS                     , 0, { gCardEffectSearchSendToGY_080661FC               , NULL                                             , gCardEffectSearchGraveyard_0805C43C              , NULL                                             , NULL                                              } },
    { KONAMI_CARD_OF_SANCTITY                           , 0, { gCardEffectDraw_080656E0                         , NULL                                             , gCardEffectDrawBanish_0805FD3C                   , gCardEffectDrawBanish_080583BC                   , NULL                                              } },
    { KONAMI_DARK_DESIGNATOR_NONE                       , 0, { gCardEffectSearch_0807338C                       , NULL                                             , gCardEffectGraveyardSendToGY_0805FA5C            , NULL                                             , gCardEffectSearchDiscard_08083280                 } },
    { KONAMI_HIDDEN_SOLDIER                             , 0, { gCardEffectSpecialSummon_080659E8                , NULL                                             , gCardEffectSpecialSummon_0805FEB0                , NULL                                             , NULL                                              } },
    { KONAMI_CALAMITY_OF_THE_WICKED                     , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroySpellTrapDestroyAll_08051998   , gCardEffectDestroyChangePosition_0805D998        , NULL                                             , NULL                                              } },
    { KONAMI_MONSTER_RELIEF                             , 0, { gCardEffectSpecialSummonReturnToHand_08073454    , gCardEffectSpecialSummonReturnToHand_08054834    , gCardEffectSpecialSummonReturnToHand_0805FF3C    , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_MACHINE_DUPLICATION                        , 0, { gCardEffectSpecialSummon_0807356C                , gCardEffectSpecialSummon_080557E0                , gCardEffectSpecialSummon_0805FF64                , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_ENEMY_CONTROLLER                           , 0, { gCardEffectTakeControlChangePosition_080737AC    , gCardEffectTakeControlChangePosition_080538A8    , NULL                                             , gCardEffectDestroyDamage_08056BC4                , gCardEffectDestroy_0808198C                       } },
    { KONAMI_REASONING                                  , 0, { gCardEffectSpecialSummonSendToGY_08073B1C        , NULL                                             , gCardEffectSpecialSummonSendToGY_0806008C        , NULL                                             , NULL                                              } },
    { KONAMI_DIFFERENT_DIMENSION_CAPSULE                , 0, { gCardEffectSearchBanish_08073D84                 , NULL                                             , gCardEffectSearchGraveyard_0805C43C              , NULL                                             , NULL                                              } },
    { KONAMI_NECROVALLEY                                , 0, { gCardEffectBoostATKBoostDEF_08064760             , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_BUSTER_RANCHER                             , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_HIEROGLYPH_LITHOGRAPH                      , 0, { gCardEffectDamage_08073E94                       , NULL                                             , NULL                                             , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_TERRAFORMING                               , 0, { gCardEffectSearchSendToGY_080661FC               , NULL                                             , gCardEffectSearchGraveyard_0805C43C              , NULL                                             , NULL                                              } },
    { KONAMI_METAMORPHOSIS                              , 0, { gCardEffectSpecialSummonFusion_08066E0C          , gCardEffectSpecialSummonTribute_08052224         , gCardEffectSpecialSummonTribute_0805E92C         , gCardEffectTributeSpecialSummon_08056930         , NULL                                              } },
    { KONAMI_ROYAL_TRIBUTE                              , 0, { gCardEffectDiscardGraveyard_08073EB0             , NULL                                             , gCardEffectDiscardGraveyard_080600B4             , NULL                                             , NULL                                              } },
    { KONAMI_REVERSAL_QUIZ                              , 0, { gCardEffectSendToGYGraveyard_08073FE0            , NULL                                             , gCardEffectSendToGYGraveyard_08060104            , gCardEffectSendToGYGraveyard_080584CC            , NULL                                              } },
    { KONAMI_CURSE_OF_AGING                             , 0, { gCardEffectDirectAttackDiscard_08069104          , gCardEffectDiscardDestroyAll_08051F04            , gCardEffectDiscard_0805C1E4                      , gCardEffectDiscard_08056380                      , NULL                                              } },
    { KONAMI_RAIGEKI_BREAK                              , 0, { gCardEffectDestroy_08064654                      , gCardEffectDiscardDestroy_08055078               , gCardEffectDiscard_0805C1E4                      , gCardEffectDiscard_08056380                      , gCardEffectDestroy_0808198C                       } },
    { KONAMI_DISTURBANCE_STRATEGY                       , 0, { gCardEffectDraw_080741F8                         , NULL                                             , gCardEffectDamageDiscard_0805CD88                , NULL                                             , NULL                                              } },
    { KONAMI_RITE_OF_SPIRIT                             , 0, { gCardEffectSpecialSummonGraveyard_080687A8       , NULL                                             , gCardEffectSpecialSummonGraveyard_0805C248       , NULL                                             , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_NON_AGGRESSION_AREA                        , 0, { gCardEffectSpecialSummonDiscard_08074318         , NULL                                             , gCardEffectSpecialSummonDiscard_0806015C         , gCardEffectDiscard_08056380                      , NULL                                              } },
    { KONAMI_D_TRIBE                                    , 0, { gCardEffectEndPhaseBoostATK_0806E780             , gCardEffectDestroyEndPhase_08052398              , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_ROPE_OF_SPIRIT                             , 0, { gCardEffectSpecialSummonSendToGY_0806E898        , NULL                                             , gCardEffectSpecialSummonSendToGY_080601DC        , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_INTERDIMENSIONAL_MATTER_TRANSPORTER        , 0, { gCardEffectBanishEndPhase_080744F8               , gCardEffectEndPhaseDestroy_080541CC              , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_COST_DOWN                                  , 0, { gCardEffectDiscardEndPhase_08070D00              , NULL                                             , gCardEffectDiscard_0805C1E4                      , gCardEffectDiscard_08056380                      , NULL                                              } },
    { KONAMI_WHITE_DRAGON_RITUAL                        , 0, { gCardEffectRitualSummonTribute_08086CDC          , NULL                                             , gCardEffectRitualSummonTribute_08086C80          , NULL                                             , NULL                                              } },
    { KONAMI_DEMOTION                                   , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_COMBINATION_ATTACK                         , 0, { gCardEffectChangePositionEquip_08074B2C          , gCardEffectDestroyEndPhase_080502B0              , gCardEffectChangePositionEquip_08060484          , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_AUTONOMOUS_ACTION_UNIT                     , 0, { gCardEffectSpecialSummonDestroy_0806C978         , NULL                                             , gCardEffectSpecialSummonGraveyard_0805C248       , gCardEffectDamage_0805635C                       , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_POISON_OF_THE_OLD_MAN                      , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , gCardEffectDestroyDamage_08056BC4                , NULL                                              } },
    { KONAMI_DARK_CORE                                  , 0, { gCardEffectBanishSpecialSummon_08076DE0          , gCardEffectBoostATKSpecialSummon_0805086C        , gCardEffectDiscard_0805C1E4                      , gCardEffectDiscard_08056380                      , gCardEffectDestroy_0808198C                       } },
    { KONAMI_RAREGOLD_ARMOR                             , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_METALSILVER_ARMOR_NONE                     , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_TRIBUTE_DOLL                               , 0, { gCardEffectSpecialSummon_080659E8                , gCardEffectSpecialSummonPreventAttack_08053D40   , gCardEffectSpecialSummonTribute_080604AC         , gCardEffectTribute_080567A0                      , NULL                                              } },
    { KONAMI_HUGE_REVOLUTION                            , 0, { gCardEffectSendToGYDestroyAll_08074C8C           , gCardEffectDestroyAll_08055138                   , gCardEffectSendToGYDestroyAll_08060514           , NULL                                             , NULL                                              } },
    { KONAMI_THUNDER_OF_RULER                           , 0, { gCardEffectPreventAttackDirectAttack_08071488    , NULL                                             , gCardEffectStandbyPhaseBattlePhase_08060588      , NULL                                             , NULL                                              } },
    { KONAMI_SPELL_SHIELD_TYPE_8                        , 0, { gCardEffectNegateDestroy_08065698                , NULL                                             , gCardEffectNegateDestroy_0805D118                , gCardEffectDestroyDamage_08056BC4                , NULL                                              } },
    { KONAMI_METEORAIN                                  , 0, { gCardEffectDiscardEndPhase_08070D00              , NULL                                             , gCardEffectDamageChangePosition_080605B8         , NULL                                             , NULL                                              } },
    { KONAMI_PINEAPPLE_BLAST                            , 0, { gCardEffectDestroy_08074CE4                      , NULL                                             , gCardEffectDestroy_080605F0                      , NULL                                             , NULL                                              } },
    { KONAMI_SECRET_BARREL                              , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectDamage_08060640                       , NULL                                             , NULL                                              } },
    { KONAMI_FORMATION_UNION                            , 0, { gCardEffectSpecialSummonChangePosition_08074D78  , gCardEffectSpecialSummonChangePosition_080538E8  , gCardEffectSpecialSummonChangePosition_08060684  , gCardEffectDestroyDamage_08056BC4                , gCardEffectSpecialSummonChangePosition_08084460   } },
    { KONAMI_ADHESION_TRAP_HOLE                         , 0, { gCardEffectDestroyFlip_08074F74                  , gCardEffectSpecialSummonBanish_08053374          , NULL                                             , NULL                                             , gCardEffectSpecialSummonBanish_080841C0           } },
    { KONAMI_DIFFUSION_WAVE_MOTION                      , 0, { gCardEffectDestroyDamage_08074FB8                , gCardEffectDestroyDamage_08052AA8                , gCardEffectDestroyDamage_080606CC                , gCardEffectDamage_0805635C                       , gCardEffectDestroy_0808198C                       } },
    { KONAMI_FIEND_S_SANCTUARY                          , 0, { gCardEffectSpecialSummonDestroy_08072EB4         , NULL                                             , gCardEffectSpecialSummon_0805C218                , NULL                                             , NULL                                              } },
    { KONAMI_PITCH_BLACK_POWER_STONE                    , 0, { gCardEffectDestroyCounter_080752CC               , gCardEffectDestroyCounter_080552A0               , gCardEffectDestroyCounter_08060800               , gCardEffectDestroyCounter_080585E8               , gCardEffectDestroyCounter_08084594                } },
    { KONAMI_BIG_BANG_SHOT                              , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_GATHER_YOUR_MIND                           , 0, { gCardEffectSearchSendToGY_080661FC               , NULL                                             , gCardEffectSearch_08060854                       , gCardEffectSearch_0805861C                       , NULL                                              } },
    { KONAMI_EMBLEM_OF_DRAGON_DESTROYER                 , 0, { gCardEffectSearchGraveyard_08075378              , NULL                                             , gCardEffectSearchGraveyard_08060898              , NULL                                             , NULL                                              } },
    { KONAMI_JAR_ROBBER                                 , 0, { gCardEffectNegateDestroy_0806A054                , NULL                                             , gCardEffectNegateDestroy_0805D118                , NULL                                             , NULL                                              } },
    { KONAMI_SPELLBOOK_ORGANIZATION_NONE                , 0, { gCardEffectFlip_080665D4                         , NULL                                             , gCardEffectSearchGraveyard_0805C43C              , NULL                                             , NULL                                              } },
    { KONAMI_MEGA_TON_MAGICAL_CANNON                    , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroyAll_08055138                   , gCardEffectDestroyAllCounter_080608E0            , gCardEffectCounterDestroy_08058684               , NULL                                              } },
    { KONAMI_EXHAUSTING_SPELL                           , 0, { gCardEffectCounter_080754B8                      , NULL                                             , gCardEffectCounter_08060908                      , NULL                                             , NULL                                              } },
    { KONAMI_HIDDEN_BOOK_OF_SPELL                       , 0, { gCardEffectGraveyard_08076908                    , NULL                                             , gCardEffectGraveyard_08060938                    , NULL                                             , gCardEffectGraveyard_08082F44                     } },
    { KONAMI_MIRACLE_RESTORING                          , 0, { gCardEffectSpecialSummonGraveyard_080687A8       , NULL                                             , gCardEffectSpecialSummonChangePosition_08060974  , gCardEffectCounterDestroy_08058684               , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_DISARMAMENT                                , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroyAllEquip_08053AF8              , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_ANTI_SPELL                                 , 0, { gCardEffectNegateDestroy_08065698                , NULL                                             , gCardEffectNegateDestroy_0805D118                , gCardEffectCounterDestroy_08058684               , NULL                                              } },
    { KONAMI_THE_SPELL_ABSORBING_LIFE                   , 0, { gCardEffectChangePositionBoostDEF_0806BA78       , NULL                                             , gCardEffectChangePositionBoostDEF_0805DF44       , NULL                                             , NULL                                              } },
    { KONAMI_METAL_REFLECT_SLIME                        , 0, { gCardEffectSpecialSummonChangePosition_08075530  , NULL                                             , gCardEffectSpecialSummonChangePosition_080609A4  , NULL                                             , NULL                                              } },
    { KONAMI_EXCAVATION_OF_MAGE_STONES                  , 0, { gCardEffectGraveyardSearch_08066530              , NULL                                             , gCardEffectDiscardGraveyard_080609D0             , gCardEffectDiscard_08056380                      , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_SHINATO_S_ARK                              , 0, { gCardEffectRitualSummonTribute_08086CDC          , NULL                                             , gCardEffectRitualSummonTribute_08086C80          , NULL                                             , NULL                                              } },
    { KONAMI_A_DEAL_WITH_DARK_RULER                     , 0, { gCardEffectSpecialSummonGraveyard_08066858       , NULL                                             , gCardEffectSpecialSummonSendToGY_08060A5C        , NULL                                             , NULL                                              } },
    { KONAMI_CONTRACT_WITH_EXODIA                       , 0, { gCardEffectSpecialSummon_080659E8                , NULL                                             , gCardEffectSpecialSummonGraveyard_08060A88       , NULL                                             , NULL                                              } },
    { KONAMI_BUTTERFLY_DAGGER_ELMA                      , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_SHOOTING_STAR_BOW_CEAL                     , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_GRAVITY_AXE_GRARL                          , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_WICKED_BREAKING_FLAMBERGE_BAOU             , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , gCardEffectSendToGYGraveyard_08060B18            , gCardEffectSendToGYGraveyard_08058754            , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_ROD_OF_SILENCE_KAY_EST                     , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_TWIN_SWORDS_OF_FLASHING_LIGHT_TRYCE        , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , gCardEffectSendToGYGraveyard_08060B18            , gCardEffectSendToGYGraveyard_08058754            , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_ROD_OF_THE_MIND_S_EYE                      , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_FAIRY_OF_THE_SPRING                        , 0, { gCardEffectSearchGraveyard_08075AC0              , NULL                                             , gCardEffectGraveyard_0805C2F0                    , NULL                                             , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_TOKEN_THANKSGIVING                         , 0, { gCardEffectDestroyGainLP_08070EF4                , gCardEffectDestroyAllSpecialSummon_08054234      , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_STAUNCH_DEFENDER                           , 0, { gCardEffectUnknown_08075B44                      , gCardEffectSpecialSummon_080557E0                , gCardEffectDestroyChangePosition_0805D998        , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_OJAMA_TRIO                                 , 0, { gCardEffectSpecialSummonDestroy_08075BA4         , NULL                                             , gCardEffectSpecialSummonDestroy_08060B4C         , NULL                                             , NULL                                              } },
    { KONAMI_ARSENAL_ROBBER                             , 0, { gCardEffectSendToGYGraveyard_080729DC            , NULL                                             , gCardEffectGraveyardSendToGY_0805FA5C            , NULL                                             , NULL                                              } },
    { KONAMI_SKILL_DRAIN                                , 0, { gCardEffectNegateDamage_08075C40                 , NULL                                             , NULL                                             , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_REALLY_ETERNAL_REST                        , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroyAll_08050A54                   , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_SOUL_TAKER                                 , 0, { gCardEffectDestroy_08075CB0                      , gCardEffectSpecialSummonChangePosition_0805174C  , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_MAGICAL_DIMENSION                          , 0, { gCardEffectSpecialSummonDestroy_08075D0C         , gCardEffectSpecialSummonDestroy_08053E14         , gCardEffectSpecialSummonDestroy_08060B80         , NULL                                             , NULL                                              } },
    { KONAMI_JUDGEMENT_OF_PHARAOH                       , 0, { gCardEffectSpecialSummonDamage_08075F70          , NULL                                             , gCardEffectSpecialSummonDamage_08060BF8          , gCardEffectDestroyDamage_08056BC4                , NULL                                              } },
    { KONAMI_FRIENDSHIP                                 , 0, { gCardEffectEndPhase_08075F90                     , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_UNITY                                      , 0, { gCardEffectEndPhase_0807615C                     , gCardEffectEndPhaseDestroy_080541CC              , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_KNIGHT_S_TITLE                             , 0, { gCardEffectSpecialSummonGraveyard_08066858       , gCardEffectSpecialSummonTribute_08051CC4         , gCardEffectSpecialSummonTribute_08061660         , gCardEffectTributeSpecialSummon_08056930         , NULL                                              } },
    { KONAMI_SAGE_S_STONE                               , 0, { gCardEffectSpecialSummonGraveyard_08066858       , NULL                                             , gCardEffectSpecialSummon_08060C30                , NULL                                             , NULL                                              } },
    { KONAMI_INCANDESCENT_ORDEAL                        , 0, { gCardEffectRitualSummonTribute_08086CDC          , NULL                                             , gCardEffectRitualSummonTribute_08086C80          , NULL                                             , NULL                                              } },
    { KONAMI_CONTRACT_WITH_THE_ABYSS                    , 0, { gCardEffectRitualSummonTribute_08086CDC          , NULL                                             , gCardEffectRitualSummonTribute_08086C80          , NULL                                             , NULL                                              } },
    { KONAMI_CONTRACT_WITH_THE_DARK_MASTER              , 0, { gCardEffectRitualSummonTribute_08086CDC          , NULL                                             , gCardEffectRitualSummonTribute_08086C80          , NULL                                             , NULL                                              } },
    { KONAMI_FALLING_DOWN                               , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_CHECKMATE                                  , 0, { gCardEffectEndPhaseBoostATK_08069DF8             , gCardEffectDestroyTribute_08053704               , gCardEffectBattlePhaseDamage_0805E55C            , gCardEffectTributeSpecialSummon_08056930         , gCardEffectDestroy_0808198C                       } },
    { KONAMI_FINAL_COUNTDOWN                            , 0, { gCardEffectDamage_08076454                       , NULL                                             , NULL                                             , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_MUSTERING_OF_THE_DARK_SCORPIONS            , 0, { gCardEffectSpecialSummon_080765B0                , NULL                                             , gCardEffectSpecialSummon_08060C30                , NULL                                             , NULL                                              } },
    { KONAMI_PANDEMONIUM                                , 0, { gCardEffectBoostATKBoostDEF_08064760             , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_ALTAR_FOR_TRIBUTE                          , 0, { gCardEffectDamageGraveyard_080655EC              , gCardEffectSendToGYBoostATK_08053EBC             , gCardEffectGraveyardSendToGY_08061D40            , gCardEffectSendToGYGraveyard_0805738C            , NULL                                              } },
    { KONAMI_FROZEN_SOUL                                , 0, { gCardEffectBattlePhase_0807678C                  , NULL                                             , gCardEffectBattlePhase_08060D08                  , NULL                                             , NULL                                              } },
    { KONAMI_BATTLE_SCARRED                             , 0, { gCardEffectDestroyChangePosition_08066C40        , gCardEffectDestroyDamage_08052AA8                , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_DARK_SCORPION_COMBINATION                  , 0, { gCardEffectDirectAttackDiscard_08069104          , gCardEffectDestroyEndPhase_08052398              , gCardEffectDirectAttack_08060D48                 , NULL                                             , NULL                                              } },
    { KONAMI_ARCHFIEND_S_ROAR                           , 0, { gCardEffectSpecialSummonGraveyard_080687A8       , NULL                                             , gCardEffectSpecialSummonGraveyard_0805C248       , gCardEffectDamage_0805635C                       , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_DICE_RE_ROLL                               , 0, { gCardEffectDiscardEndPhase_08070D00              , NULL                                             , gCardEffectNegate_08060DE0                       , NULL                                             , NULL                                              } },
    { KONAMI_SPELL_VANISHING                            , 0, { gCardEffectNegateDiscard_080767AC                , NULL                                             , gCardEffectNegateDestroy_0805D118                , gCardEffectDiscard_08056380                      , NULL                                              } },
    { KONAMI_SAKURETSU_ARMOR                            , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroy_08053B84                      , gCardEffectDestroyChangePosition_0805D998        , NULL                                             , gCardEffectNegateGainLP_08081DCC                  } },
    { KONAMI_RAY_OF_HOPE                                , 0, { gCardEffectGraveyard_08076908                    , NULL                                             , gCardEffectGraveyard_08060E04                    , NULL                                             , gCardEffectGraveyard_08082F44                     } },
    { KONAMI_FUHMA_SHURIKEN                             , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_WILD_NATURE_S_RELEASE                      , 0, { gCardEffectBoostATKEndPhase_08076EBC             , gCardEffectDestroyEndPhase_080502B0              , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_OJAMA_DELTA_HURRICANE                      , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroyAll_08055138                   , gCardEffectDestroyAll_080611D0                   , NULL                                             , NULL                                              } },
    { KONAMI_CHAOS_END                                  , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroyAll_08050750                   , gCardEffectBanishDestroyAll_0806121C             , NULL                                             , NULL                                              } },
    { KONAMI_CHAOS_GREED                                , 0, { gCardEffectDraw_080656E0                         , NULL                                             , gCardEffectDrawBanish_08061244                   , NULL                                             , NULL                                              } },
    { KONAMI_D_D_DESIGNATOR_NONE                        , 0, { gCardEffectBanish_08077118                       , NULL                                             , gCardEffectSearchBanish_0805EE20                 , NULL                                             , gCardEffectSearchDiscard_08083280                 } },
    { KONAMI_PRIMAL_SEED                                , 0, { gCardEffectSearchBanish_08077318                 , NULL                                             , gCardEffectSearchBanish_0806129C                 , NULL                                             , gCardEffectGraveyard_08082F44                     } },
    { KONAMI_THUNDER_CRASH                              , 0, { gCardEffectDestroyGainLP_08070EF4                , gCardEffectSpecialSummonSendToGY_08053F10        , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DIMENSION_DISTORTION                       , 0, { gCardEffectSpecialSummonBanish_0807738C          , NULL                                             , gCardEffectSpecialSummonBanish_080612E4          , NULL                                             , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_RELOAD                                     , 0, { gCardEffectDraw_080741F8                         , NULL                                             , gCardEffectGraveyardDraw_0806131C                , NULL                                             , NULL                                              } },
    { KONAMI_BIG_BURN                                   , 0, { gCardEffectBanishGraveyard_08077414              , NULL                                             , gCardEffectBanishGraveyard_08061338              , NULL                                             , NULL                                              } },
    { KONAMI_BLASTING_THE_RUINS                         , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectDamageGraveyard_080613B4              , NULL                                             , NULL                                              } },
    { KONAMI_CURSED_SEAL_OF_THE_FORBIDDEN_SPELL         , 0, { gCardEffectNegateDiscard_080774F4                , NULL                                             , gCardEffectNegateDestroy_0805D118                , gCardEffectNegateDiscard_08058A04                , NULL                                              } },
    { KONAMI_SPATIAL_COLLAPSE                           , 0, { gCardEffectUnknown_0807757C                      , NULL                                             , gCardEffectUnknown_08061404                      , NULL                                             , NULL                                              } },
    { KONAMI_CHAIN_DISAPPEARANCE                        , 0, { gCardEffectSpecialSummonBanish_08077678          , gCardEffectSpecialSummonBanish_08053F5C          , NULL                                             , NULL                                             , gCardEffectSpecialSummonBanish_080841C0           } },
    { KONAMI_ZERO_GRAVITY                               , 0, { gCardEffectChangePosition_0806D0CC               , gCardEffectChangePositionEndPhase_08050C58       , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DARK_MIRROR_FORCE                          , 0, { gCardEffectBanishChangePosition_080777B0         , gCardEffectChangePositionBanish_0805402C         , gCardEffectDestroyChangePosition_0805D998        , NULL                                             , NULL                                              } },
    { KONAMI_ENERGY_DRAIN                               , 0, { gCardEffectBoostATKEndPhase_08076EBC             , gCardEffectEndPhaseDestroy_080541CC              , gCardEffectDamageDiscard_0805CD88                , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_GRYPHON_S_FEATHER_DUSTER                   , 0, { gCardEffectDestroyGainLP_08070EF4                , gCardEffectDestroySpellTrapDestroyAll_08054154   , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_STRAY_LAMBS                                , 0, { gCardEffectSpecialSummonChangePosition_080694A8  , NULL                                             , gCardEffectSpecialSummonChangePosition_0805C7A4  , NULL                                             , NULL                                              } },
    { KONAMI_SMASHING_GROUND                            , 0, { gCardEffectDestroy_08069984                      , gCardEffectDestroy_08054284                      , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DIMENSION_FUSION                           , 0, { gCardEffectSpecialSummonBanish_080779E4          , NULL                                             , gCardEffectSpecialSummonBanish_08061624          , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_DEDICATION_THROUGH_LIGHT_AND_DARKNESS      , 0, { gCardEffectSpecialSummonGraveyard_08066858       , gCardEffectSpecialSummonTribute_08052224         , gCardEffectSpecialSummonTribute_08061660         , gCardEffectTributeSpecialSummon_08056930         , NULL                                              } },
    { KONAMI_SALVAGE                                    , 0, { gCardEffectGraveyardSearch_08066530              , NULL                                             , gCardEffectGraveyard_0805F068                    , NULL                                             , gCardEffectGraveyard_08082F44                     } },
    { KONAMI_ULTRA_EVOLUTION_PILL                       , 0, { gCardEffectSpecialSummon_080659E8                , gCardEffectSpecialSummonTribute_08052224         , gCardEffectSpecialSummonTribute_080604AC         , gCardEffectTributeSpecialSummon_08056930         , NULL                                              } },
    { KONAMI_EARTH_CHANT                                , 0, { gCardEffectRitualSummonTribute_08086CDC          , NULL                                             , gCardEffectRitualSummonTribute_08086C80          , NULL                                             , NULL                                              } },
    { KONAMI_JADE_INSECT_WHISTLE                        , 0, { gCardEffectUnknown_08077B34                      , NULL                                             , gCardEffectGraveyardSendToGY_0805FA5C            , NULL                                             , NULL                                              } },
    { KONAMI_DESTRUCTION_RING                           , 0, { gCardEffectDestroyDamage_0806D224                , gCardEffectEndPhaseDestroy_080541CC              , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_FIEND_S_HAND_MIRROR                        , 0, { gCardEffectUnknown_0806AA14                      , NULL                                             , gCardEffectUnknown_08061688                      , NULL                                             , gCardEffectUnknown_08082B88                       } },
    { KONAMI_COMPULSORY_EVACUATION_DEVICE               , 0, { gCardEffectReturnToHand_0806734C                 , gCardEffectReturnToHandFlip_080509FC             , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_A_HERO_EMERGES                             , 0, { gCardEffectSpecialSummonSendToGY_08077C50        , NULL                                             , gCardEffectSpecialSummonSendToGY_080617AC        , NULL                                             , NULL                                              } },
    { KONAMI_SELF_DESTRUCT_BUTTON                       , 0, { gCardEffectUnknown_08077D58                      , NULL                                             , gCardEffectUnknown_08061874                      , NULL                                             , NULL                                              } },
    { KONAMI_DNA_TRANSPLANT                             , 0, { NULL                                             , NULL                                             , NULL                                             , NULL                                             , gCardEffectUnknown_080845E0                       } },
    { KONAMI_TRAP_JAMMER                                , 0, { gCardEffectNegateDestroy_08065698                , NULL                                             , gCardEffectNegateDestroy_0805D118                , NULL                                             , NULL                                              } },
    { KONAMI_SKULL_ZOMA                                 , 0, { gCardEffectSpecialSummonChangePosition_08075530  , NULL                                             , gCardEffectSpecialSummonChangePosition_080609A4  , NULL                                             , NULL                                              } },
    { KONAMI_SIXTH_SENSE                                , 0, { gCardEffectDrawSendToGY_08078004                 , NULL                                             , gCardEffectSearchGraveyard_0805C43C              , NULL                                             , NULL                                              } },
    { KONAMI_OPTI_CAMOUFLAGE_ARMOR                      , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_MYSTIK_WOK                                 , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectTributeDamage_0805C3EC                , gCardEffectBoostATKBoostDEF_08058CEC             , NULL                                              } },
    { KONAMI_BURST_STREAM_OF_DESTRUCTION                , 0, { gCardEffectDestroyAll_0807822C                   , gCardEffectDestroy_080507AC                      , gCardEffectDestroyAllDamage_08061AC0             , NULL                                             , NULL                                              } },
    { KONAMI_MONSTER_GATE                               , 0, { gCardEffectSpecialSummonSendToGY_080782C0        , NULL                                             , gCardEffectSpecialSummonSendToGY_08061B14        , gCardEffectTribute_080567A0                      , NULL                                              } },
    { KONAMI_THE_SANCTUARY_IN_THE_SKY                   , 0, { gCardEffectBoostATKBoostDEF_08064760             , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_EARTHQUAKE                                 , 0, { gCardEffectChangePosition_080784B4               , gCardEffectChangePosition_080543B4               , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_GOBLIN_THIEF                               , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MICRO_RAY                                  , 0, { gCardEffectEndPhaseBoostATK_08069DF8             , gCardEffectBoostATKSpecialSummon_0805086C        , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_LIGHT_OF_JUDGMENT                          , 0, { gCardEffectDiscardSendToGY_08078550              , gCardEffectDestroyAll_08055138                   , gCardEffectDiscardSendToGY_08061B54              , gCardEffectDiscardGraveyard_08058E44             , NULL                                              } },
    { KONAMI_WALL_OF_REVEALING_LIGHT                    , 0, { NULL                                             , NULL                                             , NULL                                             , gCardEffectDamage_08058F90                       , NULL                                              } },
    { KONAMI_SOLAR_RAY                                  , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectDamage_08061BA8                       , NULL                                             , NULL                                              } },
    { KONAMI_NINJITSU_ART_OF_TRANSFORMATION             , 0, { gCardEffectSpecialSummonDestroy_08078658         , gCardEffectSpecialSummonTribute_08051CC4         , gCardEffectSpecialSummonDestroy_08061BC4         , gCardEffectTributeSpecialSummon_08056930         , NULL                                              } },
    { KONAMI_BECKONING_LIGHT                            , 0, { gCardEffectSearchDiscard_080786A8                , NULL                                             , gCardEffectSearchDiscard_08061C10                , NULL                                             , NULL                                              } },
    { KONAMI_DRAINING_SHIELD                            , 0, { gCardEffectNegateBoostATK_0806CD40               , NULL                                             , gCardEffectNegateBoostATK_0805E1B0               , NULL                                             , gCardEffectNegateGainLP_08081DCC                  } },
    { KONAMI_ARMOR_BREAK                                , 0, { gCardEffectNegateDestroy_08065698                , NULL                                             , gCardEffectNegateDestroy_0805D118                , NULL                                             , NULL                                              } },
    { KONAMI_SHIELD_CRASH                               , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroyChangePosition_08053C00        , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_CORPSE_OF_YATA_GARASU                      , 0, { gCardEffectDraw_080656E0                         , gCardEffectUnknown_08053C70                      , gCardEffectUnknown_08061C68                      , gCardEffectDestroyDamage_08056BC4                , NULL                                              } },
    { KONAMI_EARTHBOUND_SPIRIT_S_INVITATION             , 0, { gCardEffectDestroyChangePosition_08070AA4        , NULL                                             , gCardEffectUnknown_08061C90                      , NULL                                             , NULL                                              } },
    { KONAMI_SPECIAL_HURRICANE                          , 0, { gCardEffectDestroy_08064660                      , gCardEffectSpecialSummonDiscard_08053034         , gCardEffectDiscard_0805C1E4                      , gCardEffectDiscard_08056380                      , NULL                                              } },
    { KONAMI_ORDER_TO_CHARGE                            , 0, { gCardEffectDestroyTribute_0807965C               , gCardEffectDestroyDamage_08052AA8                , gCardEffectDestroyTribute_08061D5C               , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_SWORD_OF_THE_SOUL_EATER                    , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectBoostATKEquip_08084674                 } },
    { KONAMI_SOUL_REVERSAL                              , 0, { gCardEffectGraveyardDamage_08078954              , NULL                                             , gCardEffectGraveyard_0805C2F0                    , NULL                                             , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_7                                          , 0, { gCardEffectDrawSendToGY_08078C3C                 , gCardEffectDrawSendToGY_080544D4                 , gCardEffectDrawSendToGY_08061D78                 , NULL                                             , NULL                                              } },
    { KONAMI_ENCHANTING_FITTING_ROOM                    , 0, { gCardEffectSpecialSummonDamage_08078C94          , NULL                                             , gCardEffectSpecialSummonDamage_08061DCC          , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_THE_LAW_OF_THE_NORMAL                      , 0, { gCardEffectDiscardDestroyAll_08078EC8            , gCardEffectDiscardDestroyAll_08054518            , gCardEffectDiscardDestroyAll_08061E04            , NULL                                             , NULL                                              } },
    { KONAMI_DARK_MAGIC_ATTACK                          , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroySpellTrapDestroyAll_08051ABC   , gCardEffectDestroy_0805EC00                      , NULL                                             , NULL                                              } },
    { KONAMI_DELTA_ATTACKER                             , 0, { gCardEffectDirectAttackDiscard_08069104          , gCardEffectDirectAttack_08054570                 , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_THOUSAND_ENERGY                            , 0, { gCardEffectDestroyAllBoostATK_08078F7C           , gCardEffectDestroyEndPhase_08052398              , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_TRIANGLE_POWER                             , 0, { gCardEffectDestroyAllBoostATK_08078F7C           , gCardEffectDestroyEndPhase_08052398              , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_THE_THIRD_SARCOPHAGUS                      , 0, { NULL                                             , NULL                                             , gCardEffectSendToGYDestroy_080904EC              , NULL                                             , NULL                                              } },
    { KONAMI_THE_SECOND_SARCOPHAGUS                     , 0, { NULL                                             , NULL                                             , gCardEffectSendToGYDestroy_080904EC              , NULL                                             , NULL                                              } },
    { KONAMI_CURSE_OF_ANUBIS                            , 0, { gCardEffectChangePosition_08079500               , gCardEffectChangePositionEndPhase_08050C58       , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DESERT_SUNLIGHT                            , 0, { gCardEffectChangePosition_08079594               , gCardEffectChangePosition_08054614               , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_SOUL_RESURRECTION                          , 0, { gCardEffectSpecialSummonDestroy_0806C978         , NULL                                             , gCardEffectSpecialSummonGraveyard_0805C248       , NULL                                             , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_ORDER_TO_SMASH                             , 0, { gCardEffectDestroyTribute_0807965C               , gCardEffectDestroyDamage_08052AA8                , gCardEffectDestroySpellTrapTribute_08061E98      , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_RETURN_FROM_THE_DIFFERENT_DIMENSION        , 0, { gCardEffectSpecialSummonBanish_08079944          , NULL                                             , gCardEffectSpecialSummonGraveyard_0805C248       , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_INFERNO_TEMPEST                            , 0, { gCardEffectBanishGraveyard_08079BDC              , NULL                                             , gCardEffectBanishGraveyard_08062048              , NULL                                             , NULL                                              } },
    { KONAMI_DARK_FACTORY_OF_MASS_PRODUCTION            , 0, { gCardEffectGraveyardSearch_08066530              , NULL                                             , gCardEffectGraveyard_0805F068                    , NULL                                             , gCardEffectGraveyard_08082F44                     } },
    { KONAMI_HAMMER_SHOT                                , 0, { gCardEffectDestroy_08069984                      , gCardEffectDestroyChangePosition_0805474C        , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MIND_WIPE                                  , 0, { gCardEffectDraw_080741F8                         , NULL                                             , gCardEffectUnknown_08062378                      , NULL                                             , NULL                                              } },
    { KONAMI_ABYSSAL_DESIGNATOR                         , 0, { gCardEffectSendToGYDamage_08079FAC               , NULL                                             , gCardEffectSendToGYDamage_080623A4               , gCardEffectDamage_0805635C                       , gCardEffectSendToGYDamage_08084C40                } },
    { KONAMI_LEVEL_UP                                   , 0, { gCardEffectSpecialSummonGraveyard_08066858       , gCardEffectSpecialSummonSendToGY_080547B4        , gCardEffectSpecialSummonSendToGY_0805CD6C        , gCardEffectSendToGYGraveyard_0805738C            , NULL                                              } },
    { KONAMI_INFERNO_FIRE_BLAST                         , 0, { gCardEffectDamagePreventAttack_0807A0F4          , gCardEffectDestroyDamage_08052AA8                , gCardEffectDestroyAllDamage_08061AC0             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_THE_GRAVEYARD_IN_THE_FOURTH_DIMENSION      , 0, { gCardEffectGraveyard_08076908                    , NULL                                             , gCardEffectGraveyard_08060E04                    , NULL                                             , gCardEffectGraveyard_08082F44                     } },
    { KONAMI_BIG_WAVE_SMALL_WAVE                        , 0, { gCardEffectSpecialSummonDestroyAll_0807A138      , gCardEffectDestroyEndPhase_08052398              , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_FUSION_WEAPON                              , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_RITUAL_WEAPON                              , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_TAUNT                                      , 0, { gCardEffectUnknown_0807A2C4                      , gCardEffectDestroyBoostDEF_08054898              , gCardEffectUnknown_080623EC                      , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_ABSOLUTE_END                               , 0, { gCardEffectPreventAttackDirectAttack_08071488    , NULL                                             , gCardEffectNegatePreventAttack_08062EC0          , NULL                                             , NULL                                              } },
    { KONAMI_NINJITSU_ART_OF_DECOY                      , 0, { gCardEffectDestroyChangePosition_08066C40        , gCardEffectDestroyDamage_08052AA8                , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_HEAVY_SLUMP                                , 0, { gCardEffectUnknown_0807A308                      , NULL                                             , gCardEffectUnknown_08062420                      , NULL                                             , NULL                                              } },
    { KONAMI_MIND_CRUSH_NONE                            , 0, { gCardEffectDiscardDamage_0807A3B8                , NULL                                             , gCardEffectSearchBanish_0805EE20                 , NULL                                             , gCardEffectSearchDiscard_08083280                 } },
    { KONAMI_CEMETARY_BOMB                              , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectDamageGraveyard_08062470              , NULL                                             , gCardEffectDamage_08081DB0                        } },
    { KONAMI_HALLOWED_LIFE_BARRIER                      , 0, { gCardEffectDiscardEndPhase_08070D00              , NULL                                             , gCardEffectDiscard_0805C1E4                      , gCardEffectDiscard_08056380                      , NULL                                              } },
    { KONAMI_STRONGHOLD                                 , 0, { gCardEffectSpecialSummonChangePosition_08075530  , NULL                                             , gCardEffectSpecialSummonChangePosition_080609A4  , NULL                                             , NULL                                              } },
    { KONAMI_TRICKY_S_MAGIC_4                           , 0, { gCardEffectSpecialSummonSendToGY_0807A5A4        , gCardEffectGraveyardEquip_080548EC               , gCardEffectSpecialSummonSendToGY_08062498        , gCardEffectSendToGYGraveyard_0805738C            , NULL                                              } },
    { KONAMI_MAGICIAN_S_CIRCLE                          , 0, { gCardEffectSpecialSummonChangePosition_0807A688  , NULL                                             , gCardEffectSpecialSummonChangePosition_08062704  , NULL                                             , NULL                                              } },
    { KONAMI_MAGICIAN_S_UNITE                           , 0, { gCardEffectPreventAttackChangePosition_0807A814  , gCardEffectDestroyDamage_08052AA8                , gCardEffectPreventAttackChangePosition_0806276C  , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_SERIAL_SPELL                               , 0, { gCardEffectDiscardGraveyard_0807AE84             , gCardEffectDiscardGraveyard_08054B80             , gCardEffectDiscardGraveyard_08062888             , gCardEffectDiscardGraveyard_080596EC             , gCardEffectDiscardGraveyard_08084CEC              } },
    { KONAMI_HARPIES_HUNTING_GROUND                     , 0, { gCardEffectBoostATKBoostDEF_08064760             , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_TRIANGLE_ECSTASY_SPARK                     , 0, { gCardEffectNegateEndPhase_0807AEA0               , gCardEffectChangePositionEndPhase_08050C58       , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_NECKLACE_OF_COMMAND                        , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_FLINT                                      , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_BACK_TO_SQUARE_ONE                         , 0, { gCardEffectDiscard_0807AF28                      , gCardEffectReturnToHandFlip_080509FC             , gCardEffectDiscard_0805C1E4                      , gCardEffectDiscard_08056380                      , gCardEffectDestroy_0808198C                       } },
    { KONAMI_MONSTER_REINCARNATION                      , 0, { gCardEffectGraveyardSearch_08066530              , NULL                                             , gCardEffectDiscardGraveyard_080609D0             , gCardEffectDiscard_08056380                      , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_BALLISTA_OF_RAMPART_SMASHING               , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_MALICE_DISPERSION                          , 0, { gCardEffectDestroy_08064660                      , gCardEffectDiscardDestroyAll_08054ACC            , gCardEffectDiscard_0805C1E4                      , gCardEffectDiscard_08056380                      , NULL                                              } },
    { KONAMI_DIVINE_WRATH                               , 0, { gCardEffectNegateDiscard_0807B0C8                , NULL                                             , gCardEffectNegateDiscard_080629C8                , gCardEffectDiscard_08056380                      , NULL                                              } },
    { KONAMI_XING_ZHEN_HU                               , 0, { gCardEffectUnknown_0807B188                      , gCardEffectUnknown_08050DE4                      , gCardEffectUnknown_08062A0C                      , NULL                                             , gCardEffectDestroyFlip_08081F28                   } },
    { KONAMI_RARE_METALMORPH                            , 0, { gCardEffectDestroyChangePosition_08066C40        , gCardEffectDestroySpecialSummon_080513D0         , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_FRUITS_OF_KOZAKY_S_STUDIES_NONE            , 0, { gCardEffectFlip_080665D4                         , NULL                                             , gCardEffectSearchGraveyard_0805C43C              , NULL                                             , NULL                                              } },
    { KONAMI_MIND_HAXORZ                                , 0, { gCardEffectDamageChangePosition_0806A548         , gCardEffectDamage_08055318                       , gCardEffectDamage_08062A9C                       , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_FUH_RIN_KA_ZAN                             , 0, { gCardEffectDiscardDestroySpellTrap_0807B240      , NULL                                             , gCardEffectDiscardDestroySpellTrap_08062AC8      , NULL                                             , NULL                                              } },
    { KONAMI_PIKERU_S_CIRCLE_OF_ENCHANTMENT             , 0, { gCardEffectDiscardEndPhase_08070D00              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_SPELL_PURIFICATION                         , 0, { gCardEffectDestroy_08064660                      , gCardEffectDiscardDestroyAll_08054BA0            , gCardEffectDiscard_0805C1E4                      , gCardEffectDiscard_08056380                      , NULL                                              } },
    { KONAMI_ASTRAL_BARRIER                             , 0, { gCardEffectDirectAttack_080732FC                 , NULL                                             , gCardEffectDirectAttack_08062BE8                 , NULL                                             , NULL                                              } },
    { KONAMI_COVERING_FIRE                              , 0, { gCardEffectBoostATK_0807B418                     , gCardEffectBoostATK_08054BEC                     , gCardEffectBoostATK_08062C54                     , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_OWNER_S_SEAL                               , 0, { gCardEffectUnknown_0807B490                      , gCardEffectUnknown_08054C50                      , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_A_FEATHER_OF_THE_PHOENIX                   , 0, { gCardEffectGraveyardDamage_08078954              , NULL                                             , gCardEffectDiscardGraveyard_080609D0             , gCardEffectDiscard_08056380                      , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_SWORDS_OF_CONCEALING_LIGHT                 , 0, { gCardEffectDestroyChangePosition_0807BB30        , gCardEffectDestroyChangePosition_08054DF4        , gCardEffectDestroyDamage_080904F0                , NULL                                             , NULL                                              } },
    { KONAMI_RELEASE_RESTRAINT                          , 0, { gCardEffectSpecialSummonGraveyard_08066858       , gCardEffectSpecialSummonTribute_08052224         , gCardEffectSpecialSummonTribute_08061660         , gCardEffectTributeSpecialSummon_08056930         , NULL                                              } },
    { KONAMI_CENTRIFUGAL_FIELD                          , 0, { gCardEffectBoostATKBoostDEF_08064760             , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_FULFILLMENT_OF_THE_CONTRACT                , 0, { gCardEffectSpecialSummonDestroy_0806C978         , NULL                                             , gCardEffectSpecialSummonGraveyard_0805C248       , gCardEffectDamage_0805635C                       , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_RE_FUSION                                  , 0, { gCardEffectSpecialSummonDestroy_0806C978         , NULL                                             , gCardEffectSpecialSummonGraveyard_0805C248       , gCardEffectDamage_0805635C                       , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_THE_BIG_MARCH_OF_ANIMALS                   , 0, { gCardEffectEndPhaseBoostATK_0806E780             , gCardEffectDestroyEndPhase_08052398              , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_CROSS_COUNTER                              , 0, { gCardEffectDestroyChangePosition_08070AA4        , NULL                                             , gCardEffectDestroyChangePosition_0805F1CC        , NULL                                             , NULL                                              } },
    { KONAMI_THREATENING_ROAR                           , 0, { gCardEffectPreventAttackDirectAttack_08071488    , NULL                                             , gCardEffectNegatePreventAttack_08062EC0          , NULL                                             , NULL                                              } },
    { KONAMI_PHOENIX_WING_WIND_BLAST                    , 0, { gCardEffectDiscard_0807BB8C                      , gCardEffectSpecialSummonDestroy_08054FBC         , gCardEffectDiscard_0805C1E4                      , gCardEffectDiscard_08056380                      , gCardEffectDestroy_0808198C                       } },
    { KONAMI_GOOD_GOBLIN_HOUSEKEEPING                   , 0, { gCardEffectDrawDestroy_0807BBCC                  , NULL                                             , gCardEffectDrawGraveyard_08062EFC                , NULL                                             , NULL                                              } },
    { KONAMI_BEAST_SOUL_SWAP                            , 0, { gCardEffectSpecialSummonReturnToHand_0807BC48    , gCardEffectDestroyDamage_08052AA8                , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_ASSAULT_ON_GHQ                             , 0, { gCardEffectSendToGYDestroy_0807BDB8              , gCardEffectSpecialSummonReturnToHand_08054834    , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_D_D_DYNAMITE                               , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectBanishDamage_08062F38                 , NULL                                             , gCardEffectDamage_08081DB0                        } },
    { KONAMI_DECK_DEVASTATION_VIRUS                     , 0, { gCardEffectDestroyAllTribute_08067C0C            , gCardEffectTributeDestroy_08050EAC               , NULL                                             , gCardEffectTributeSpecialSummon_08056930         , NULL                                              } },
    { KONAMI_ELEMENTAL_BURST                            , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroyAll_08055138                   , gCardEffectDestroyAllTribute_08062F60            , gCardEffectDestroyAllTribute_08059A78            , NULL                                              } },
    { KONAMI_FORCED_CEASEFIRE                           , 0, { gCardEffectNegate_0806B558                       , NULL                                             , gCardEffectDiscard_0805C1E4                      , gCardEffectDiscard_08056380                      , NULL                                              } },
    { KONAMI_UNION_ATTACK                               , 0, { gCardEffectBoostATKEndPhase_08076EBC             , gCardEffectDestroyDamage_08052AA8                , gCardEffectBattlePhaseDamage_0805E55C            , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_OVERPOWERING_EYE                           , 0, { gCardEffectEndPhaseBoostATK_08069DF8             , gCardEffectDestroyDamage_08052AA8                , gCardEffectDirectAttack_08063020                 , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_GIFT_OF_THE_MARTYR                         , 0, { gCardEffectBoostATKEndPhase_08076EBC             , gCardEffectSendToGYBoostATK_08054E5C             , gCardEffectGraveyardSendToGY_08061D40            , gCardEffectSendToGYGraveyard_0805738C            , gCardEffectDestroy_0808198C                       } },
    { KONAMI_DOUBLE_ATTACK                              , 0, { gCardEffectEndPhaseBoostATK_08069DF8             , gCardEffectDestroyDamage_08052AA8                , gCardEffectDiscardGraveyard_080632CC             , gCardEffectDiscardGraveyard_08058E44             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_BATTERY_CHARGER                            , 0, { gCardEffectSpecialSummonGraveyard_080687A8       , NULL                                             , gCardEffectSpecialSummonGraveyard_0805C248       , gCardEffectDamage_0805635C                       , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_KAMINOTE_BLOW                              , 0, { gCardEffectDirectAttackDiscard_08069104          , gCardEffectDestroyEndPhase_08052398              , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DORIADO_S_BLESSING                         , 0, { gCardEffectRitualSummonTribute_08086CDC          , NULL                                             , gCardEffectRitualSummonTribute_08086C80          , NULL                                             , NULL                                              } },
    { KONAMI_FINAL_RITUAL_OF_THE_ANCIENTS               , 0, { gCardEffectRitualSummonTribute_08086CDC          , NULL                                             , gCardEffectRitualSummonTribute_08086C80          , NULL                                             , NULL                                              } },
    { KONAMI_LEGENDARY_BLACK_BELT                       , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_NITRO_UNIT                                 , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_IMPENETRABLE_FORMATION                     , 0, { gCardEffectDestroyChangePosition_08066C40        , gCardEffectDestroyBoostDEF_08054898              , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_HERO_SIGNAL                                , 0, { gCardEffectSpecialSummonGraveyard_08066858       , NULL                                             , gCardEffectSpecialSummonSendToGY_08063320        , NULL                                             , NULL                                              } },
    { KONAMI_PIKERU_S_SECOND_SIGHT                      , 0, { gCardEffectSearchEndPhase_0807C16C               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MINEFIELD_ERUPTION                         , 0, { gCardEffectDestroyAllDamage_0807C1A8             , gCardEffectDestroyEndPhase_08052398              , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_KOZAKY_S_SELF_DESTRUCT_BUTTON              , 0, { NULL                                             , NULL                                             , gCardEffectSendToGYDestroy_080904EC              , NULL                                             , NULL                                              } },
    { KONAMI_MISPOLYMERIZATION                          , 0, { gCardEffectReturnToHand_0806ABD4                 , gCardEffectSpecialSummonFusion_08054F08          , gCardEffectSpecialSummonFusion_080633AC          , NULL                                             , NULL                                              } },
    { KONAMI_LEVEL_CONVERSION_LAB                       , 0, { gCardEffectSendToGYGraveyard_0807C1F8            , NULL                                             , gCardEffectSendToGYGraveyard_080633E8            , NULL                                             , NULL                                              } },
    { KONAMI_ROCK_BOMBARDMENT                           , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectSearchGraveyard_0805C43C              , gCardEffectSendToGYDamage_08059C08               , NULL                                              } },
    { KONAMI_TOKEN_FEASTEVIL                            , 0, { gCardEffectDestroyGainLP_08070EF4                , gCardEffectDestroyAllSpecialSummon_08054234      , gCardEffectSpecialSummonDestroyAll_08063404      , NULL                                             , NULL                                              } },
    { KONAMI_SPELL_STOPPING_STATUTE                     , 0, { gCardEffectNegateDestroy_08065698                , NULL                                             , gCardEffectNegateDestroy_0805D118                , NULL                                             , NULL                                              } },
    { KONAMI_ROYAL_SURRENDER                            , 0, { gCardEffectNegateDestroy_08065698                , NULL                                             , gCardEffectNegateDestroy_0805D118                , NULL                                             , NULL                                              } },
    { KONAMI_POWER_BOND                                 , 0, { gCardEffectSpecialSummonSendToGY_0807FDE8        , NULL                                             , gCardEffectSpecialSummonGraveyard_0807FD84       , NULL                                             , NULL                                              } },
    { KONAMI_SKYSCRAPER                                 , 0, { gCardEffectBoostATKBoostDEF_08064760             , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_TRANSCENDENT_WINGS                         , 0, { gCardEffectSpecialSummonGraveyard_08066858       , gCardEffectSpecialSummonSendToGY_08052A20        , gCardEffectSpecialSummonSendToGY_08063600        , gCardEffectSpecialSummonSendToGY_08059DE0        , NULL                                              } },
    { KONAMI_BUBBLE_SHUFFLE                             , 0, { gCardEffectSpecialSummonChangePosition_0807C590  , gCardEffectSpecialSummonChangePosition_080554A0  , gCardEffectSpecialSummonChangePosition_0806363C  , NULL                                             , gCardEffectSpecialSummonChangePosition_08084D5C   } },
    { KONAMI_SPARK_BLASTER                              , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_FUSION_RECOVERY                            , 0, { gCardEffectGraveyardSearch_08066530              , NULL                                             , gCardEffectSearchFusionSummon_08063794           , NULL                                             , gCardEffectSearchGraveyard_08084E70               } },
    { KONAMI_MIRACLE_FUSION                             , 0, { gCardEffectSpecialSummonFusionSummon_08080944    , NULL                                             , gCardEffectSpecialSummonGraveyard_0807FD84       , NULL                                             , gCardEffectSpecialSummonFusionSummon_08080690     } },
    { KONAMI_DRAGON_S_MIRROR                            , 0, { gCardEffectSpecialSummonFusionSummon_08080944    , NULL                                             , gCardEffectSpecialSummonGraveyard_0807FD84       , NULL                                             , gCardEffectSpecialSummonFusionSummon_08080690     } },
    { KONAMI_SYSTEM_DOWN                                , 0, { gCardEffectBanishDamage_0807CA84                 , gCardEffectBanishDamage_08055524                 , gCardEffectBanishDamage_080637C0                 , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_DES_CROAKING                               , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroyAll_08055138                   , gCardEffectDestroyAll_080637F4                   , NULL                                             , NULL                                              } },
    { KONAMI_POT_OF_GENEROSITY                          , 0, { gCardEffectUnknown_0807CB80                      , NULL                                             , gCardEffectUnknown_08063814                      , NULL                                             , NULL                                              } },
    { KONAMI_SHIEN_S_SPY                                , 0, { gCardEffectTakeControlEndPhase_0806A2EC          , gCardEffectEndPhase_08055590                     , gCardEffectEndPhase_08063830                     , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_FIRE_DARTS                                 , 0, { gCardEffectDamage_0807CC2C                       , NULL                                             , gCardEffectDamageSearch_08063850                 , NULL                                             , NULL                                              } },
    { KONAMI_SPIRITUAL_EARTH_ART_KUROGANE               , 0, { gCardEffectSpecialSummonGraveyard_080687A8       , gCardEffectSpecialSummonTribute_08052224         , gCardEffectSpecialSummonTribute_0805EF88         , gCardEffectTributeSpecialSummon_08056930         , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_SPIRITUAL_WATER_ART_AOI                    , 0, { gCardEffectSendToGYGraveyard_0807CCA0            , gCardEffectTributeDestroy_08050EAC               , gCardEffectDamageDiscard_0805CD88                , gCardEffectTributeSpecialSummon_08056930         , NULL                                              } },
    { KONAMI_SPIRITUAL_FIRE_ART_KURENAI                 , 0, { gCardEffectDamageGraveyard_080655EC              , gCardEffectTributeDestroy_08050EAC               , NULL                                             , gCardEffectTributeSpecialSummon_08056930         , NULL                                              } },
    { KONAMI_SPIRITUAL_WIND_ART_MIYABI                  , 0, { gCardEffectTribute_0807CD28                      , gCardEffectSpecialSummonDestroy_08054FBC         , gCardEffectTribute_08063878                      , gCardEffectTributeSpecialSummon_08056930         , gCardEffectDestroy_0808198C                       } },
    { KONAMI_A_RIVAL_APPEARS                            , 0, { gCardEffectSpecialSummon_0807CD68                , gCardEffectSpecialSummon_08055624                , gCardEffectSpecialSummon_0805C218                , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_MAGICAL_EXPLOSION                          , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectDamageGraveyard_08063894              , NULL                                             , NULL                                              } },
    { KONAMI_RISING_ENERGY                              , 0, { gCardEffectEndPhaseBoostATK_08069DF8             , gCardEffectBoostATKSpecialSummon_0805086C        , gCardEffectDiscard_0805C1E4                      , gCardEffectDiscard_08056380                      , gCardEffectDestroy_0808198C                       } },
    { KONAMI_D_D_TRAP_HOLE                              , 0, { gCardEffectBanishDestroy_0807CE50                , gCardEffectChangePositionBanish_08052884         , gCardEffectBanishDestroy_080638D8                , NULL                                             , gCardEffectBanishDestroy_08084F40                 } },
    { KONAMI_CONSCRIPTION                               , 0, { gCardEffectSearchSpecialSummon_0807CEF0          , NULL                                             , gCardEffectSearchSpecialSummon_08063918          , NULL                                             , NULL                                              } },
    { KONAMI_DIMENSION_WALL                             , 0, { gCardEffectDestroyChangePosition_08070AA4        , NULL                                             , gCardEffectDestroyChangePosition_0805D998        , NULL                                             , NULL                                              } },
    { KONAMI_PREPARE_TO_STRIKE_BACK                     , 0, { gCardEffectChangePositionRNG_0807D014            , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_TRIAGE                                     , 0, { gCardEffectSpecialSummonDestroy_0806A3EC         , NULL                                             , gCardEffectSpecialSummonDestroyAll_080639C8      , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_DIVINE_SWORD_PHOENIX_BLADE                 , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_LEVEL_MODULATION                           , 0, { gCardEffectSpecialSummonPreventAttack_0807D2E0   , NULL                                             , gCardEffectSpecialSummonPreventAttack_08063C14   , NULL                                             , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_OJAMUSCLE                                  , 0, { gCardEffectDestroyAllBoostATK_0807D36C           , gCardEffectDestroyDamage_08052AA8                , gCardEffectDestroyAllBoostATK_08063C50           , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_OJAMAGIC                                   , 0, { NULL                                             , NULL                                             , gCardEffectSendToGYDestroy_080904EC              , NULL                                             , NULL                                              } },
    { KONAMI_CHTHONIAN_ALLIANCE                         , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_FEATHER_SHOT                               , 0, { gCardEffectPreventAttackDirectAttack_0807D59C    , gCardEffectDestroyDamage_08052AA8                , gCardEffectBattlePhaseDamage_0805E55C            , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_BONDING_H2O                                , 0, { gCardEffectSpecialSummonGraveyard_08066858       , gCardEffectTributeDestroy_08050EAC               , gCardEffectSpecialSummonRevive_08063D04          , gCardEffectSpecialSummonRevive_0805A0AC          , NULL                                              } },
    { KONAMI_CHTHONIAN_POLYMER                          , 0, { gCardEffectFusionSummonTakeControl_0807D65C      , NULL                                             , gCardEffectFusionSummonTakeControl_08063D38      , gCardEffectTribute_080567A0                      , NULL                                              } },
    { KONAMI_CHTHONIAN_BLAST                            , 0, { gCardEffectSendToGYDestroy_0807D69C              , gCardEffectDestroySendToGY_0805577C              , gCardEffectSendToGYDestroy_08063DB4              , NULL                                             , NULL                                              } },
    { KONAMI_HERO_BARRIER                               , 0, { gCardEffectNegate_0807D700                       , NULL                                             , gCardEffectNegatePreventAttack_08062EC0          , NULL                                             , NULL                                              } },
    { KONAMI_FEATHER_WIND                               , 0, { gCardEffectNegateDestroy_08065698                , NULL                                             , gCardEffectNegateDestroy_0805D118                , NULL                                             , NULL                                              } },
    { KONAMI_POT_OF_AVARICE                             , 0, { gCardEffectDrawGraveyard_0807D970                , NULL                                             , gCardEffectGraveyardDraw_0805DF14                , NULL                                             , gCardEffectGraveyard_08082F44                     } },
    { KONAMI_DARK_WORLD_LIGHTNING                       , 0, { gCardEffectDiscardDestroy_0807DA70               , gCardEffectDestroyDiscard_08055360               , gCardEffectGraveyardDraw_0806131C                , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_BOSS_RUSH                                  , 0, { NULL                                             , NULL                                             , gCardEffectSpecialSummonSendToGY_08063E94        , NULL                                             , NULL                                              } },
    { KONAMI_GATEWAY_TO_DARK_WORLD                      , 0, { gCardEffectSpecialSummonRevive_0807DAB0          , NULL                                             , gCardEffectSpecialSummonRevive_08063F28          , NULL                                             , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_THE_FORCES_OF_DARKNESS                     , 0, { gCardEffectGraveyardSearch_08066530              , NULL                                             , gCardEffectGraveyard_0805F068                    , NULL                                             , gCardEffectGraveyard_08082F44                     } },
    { KONAMI_DARK_DEAL                                  , 0, { gCardEffectDiscardDamage_0807DB14                , NULL                                             , gCardEffectDiscardDamage_08063F68                , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_SIMULTANEOUS_LOSS                          , 0, { gCardEffectSendToGYGraveyard_0807DB20            , NULL                                             , gCardEffectSendToGYGraveyard_08063FC4            , NULL                                             , NULL                                              } },
    { KONAMI_WEED_OUT                                   , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroyAll_08050A54                   , NULL                                             , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_THE_LEAGUE_OF_UNIFORM_NOMENCLATURE         , 0, { gCardEffectSpecialSummon_0807356C                , gCardEffectSpecialSummon_080557E0                , gCardEffectSpecialSummon_0805FF64                , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_ROLL_OUT                                   , 0, { gCardEffectGraveyardEquip_0807DB5C               , gCardEffectGraveyardEquip_080548EC               , gCardEffectGraveyardEquip_08063B68               , NULL                                             , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_ARMED_CHANGER                              , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , gCardEffectGraveyardDiscard_080619F0             , gCardEffectSendToGYGraveyard_08058C40            , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_HERO_HEYRO                                 , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_MAGICAL_BLAST                              , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectDamageSearch_0805C318                 , NULL                                             , NULL                                              } },
    { KONAMI_BURST_RETURN                               , 0, { gCardEffectReturnToHand_0806ABD4                 , gCardEffectChangePositionEndPhase_08050C58       , gCardEffectReturnToHand_08063FE8                 , NULL                                             , NULL                                              } },
    { KONAMI_BUBBLE_BLASTER                             , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_BUBBLE_ILLUSION                            , 0, { gCardEffectDiscardEndPhase_08070D00              , NULL                                             , gCardEffectReturnToHand_08063FE8                 , NULL                                             , NULL                                              } },
    { KONAMI_CLAY_CHARGE                                , 0, { gCardEffectDestroyDamage_0807DCF8                , NULL                                             , gCardEffectDestroyDamage_08064028                , NULL                                             , gCardEffectDestroyDamage_0808527C                 } },
    { KONAMI_MAGICAL_MALLET                             , 0, { gCardEffectDraw_0807DD68                         , NULL                                             , gCardEffectGraveyardDraw_0806131C                , NULL                                             , NULL                                              } },
    { KONAMI_INFERNO_RECKLESS_SUMMON                    , 0, { gCardEffectSpecialSummonChangePosition_0807DEE0  , NULL                                             , gCardEffectSpecialSummonChangePosition_08064074  , NULL                                             , gCardEffectSpecialSummonChangePosition_080852CC   } },
    { KONAMI_MISTOBODY                                  , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_HERO_HEART                                 , 0, { gCardEffectBoostATKEndPhase_08076EBC             , gCardEffectDestroyDamage_08052AA8                , gCardEffectBattlePhaseDamage_0805E55C            , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_MAGNET_CIRCLE_LV2                          , 0, { gCardEffectSpecialSummon_080659E8                , NULL                                             , gCardEffectSpecialSummonChangePosition_0805C294  , NULL                                             , NULL                                              } },
    { KONAMI_ANCIENT_GEAR_DRILL                         , 0, { gCardEffectDiscard_0807E398                      , NULL                                             , gCardEffectDiscard_080641B8                      , gCardEffectDiscard_08056380                      , NULL                                              } },
    { KONAMI_PHANTASMAL_MARTYRS                         , 0, { gCardEffectSpecialSummonTribute_0806E308         , NULL                                             , gCardEffectSpecialSummonSendToGY_08064204        , gCardEffectSpecialSummonSendToGY_0805A030        , NULL                                              } },
    { KONAMI_CYCLONE_BOOMERANG                          , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_PHOTON_GENERATOR_UNIT                      , 0, { gCardEffectSpecialSummonGraveyard_08066858       , gCardEffectSpecialSummonTribute_08052224         , gCardEffectSpecialSummonRevive_08064260          , gCardEffectSpecialSummonRevive_0805A0AC          , NULL                                              } },
    { KONAMI_MIRACLE_KIDS                               , 0, { gCardEffectBoostATKEndPhase_08076EBC             , gCardEffectSpecialSummonChangePosition_0805174C  , gCardEffectReduceATKGraveyard_08064288           , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_ATTACK_REFLECTOR_UNIT                      , 0, { gCardEffectSpecialSummonGraveyard_08066858       , gCardEffectSpecialSummonTribute_08052224         , gCardEffectSpecialSummonTribute_08061660         , gCardEffectTributeSpecialSummon_08056930         , NULL                                              } },
    { KONAMI_DAMAGE_CONDENSER                           , 0, { gCardEffectSpecialSummonSendToGY_0806B030        , NULL                                             , gCardEffectSpecialSummonDiscard_080642AC         , gCardEffectDiscard_08056380                      , NULL                                              } },
    { KONAMI_SYMBOL_OF_HERITAGE                         , 0, { gCardEffectSpecialSummonDestroy_0806C978         , NULL                                             , gCardEffectSpecialSummonGraveyard_0805C248       , NULL                                             , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_TRIAL_OF_THE_PRINCESSES                    , 0, { gCardEffectEquipBoostATK_08064678                , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectEquipBoostATK_08081C54                 } },
    { KONAMI_END_OF_THE_WORLD                           , 0, { gCardEffectRitualSummonTribute_08086CDC          , NULL                                             , gCardEffectRitualSummonTribute_08086C80          , NULL                                             , NULL                                              } },
    { KONAMI_KARMA_CUT                                  , 0, { gCardEffectBanishDiscard_0807EC10                , gCardEffectSpecialSummonChangePosition_0805174C  , gCardEffectDiscard_0805C1E4                      , gCardEffectDiscard_08056380                      , gCardEffectDestroy_0808198C                       } },
    { KONAMI_NEXT_TO_BE_LOST                            , 0, { gCardEffectSendToGYGraveyard_0807ED04            , gCardEffectDestroyDamage_08052AA8                , gCardEffectSearchGraveyard_0805C43C              , NULL                                             , gCardEffectSendToGYGraveyard_080852E4             } },
    { KONAMI_GENERATION_SHIFT                           , 0, { gCardEffectSearchDestroy_0807EE74                , gCardEffectEndPhaseDestroy_080541CC              , gCardEffectSearchGraveyard_0805C43C              , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_FULL_SALVO                                 , 0, { gCardEffectSendToGYDamage_0807EFEC               , NULL                                             , gCardEffectGraveyardDraw_0806131C                , NULL                                             , NULL                                              } },
    { KONAMI_SUCCESS_PROBABILITY_0                      , 0, { gCardEffectSendToGYGraveyard_0807F0A4            , NULL                                             , gCardEffectSendToGYGraveyard_0806456C            , NULL                                             , NULL                                              } },
    { KONAMI_OPTION_HUNTER                              , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectSendToGYDestroy_08064598              , NULL                                             , NULL                                              } },
    { KONAMI_GOBLIN_OUT_OF_THE_FRYING_PAN               , 0, { gCardEffectNegateReturnToHand_0807F158           , NULL                                             , gCardEffectNegateDestroy_0805D118                , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_MALFUNCTION                                , 0, { gCardEffectNegateDamage_0807F1EC                 , NULL                                             , gCardEffectNegateDestroy_0805D118                , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_THE_FLUTE_OF_SUMMONING_KURIBOH             , 0, { gCardEffectSearchSpecialSummon_0807F280          , NULL                                             , gCardEffectSearchGraveyard_0805C43C              , NULL                                             , NULL                                              } },
    { KONAMI_FAULT_ZONE                                 , 0, { gCardEffectBoostATKBoostDEF_08064760             , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    // My Body as a Shield (slotted in as KONAMI_GIGOBYTE).
    // slot 0: negate + destroy the opponent's card (copied from Magic Jammer's gCardEffectNegateDestroy_08065698)
    // slot 2: eligibility check -- opponent activated a spell or trap (new function in new_code.s/new_code.c)
    // slot 3: pay 1500 LP (new function in new_code.s)
    { KONAMI_GIGOBYTE                                   , 0, { gCardEffectMBaaS_NegateDestroy                   , NULL                                             , gCardEffectMBaaS_CheckTrigger                    , gCardEffectMBaaS_PayLP1500                       , NULL                                              } },
};

// gFlipEffects  (392 entries)
const struct CardEffects gFlipCardEffects[] = {
//  KonamiId                                             pad  eff1  eff2  eff3  eff4  eff5
    { KONAMI_DRAGON_PIPER_NONE                          , 0, { gCardEffectDestroyAllChangePosition_080660D8     , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_CASTLE_OF_DARK_ILLUSIONS                   , 0, { gCardEffectBoostATKBoostDEF_08066338             , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_REAPER_OF_THE_CARDS                        , 0, { gCardEffectDestroyFlip_08066448                  , gCardEffectDestroyFlip_0804F440                  , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_CRASS_CLOWN                                , 0, { gCardEffectReturnToHand_0806734C                 , gCardEffectReturnToHandChangePosition_0804F4EC   , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_MASK_OF_DARKNESS                           , 0, { gCardEffectGraveyardSearch_08066530              , NULL                                             , gCardEffectGraveyard_0805C2F0                    , NULL                                             , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_WHITE_MAGICAL_HAT                          , 0, { gCardEffectDiscardDestroy_080665A4               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DREAM_CLOWN                                , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroy_0804F550                      , gCardEffectChangePositionDestroy_0805C40C        , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_TAINTED_WISDOM_NONE                        , 0, { gCardEffectChangePosition_080665C0               , NULL                                             , gCardEffectChangePositionDestroy_0805C40C        , NULL                                             , NULL                                              } },
    { KONAMI_MYSTERIOUS_PUPPETEER                       , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_BIG_EYE_NONE                               , 0, { gCardEffectFlip_080665D4                         , NULL                                             , gCardEffectSearchGraveyard_0805C43C              , NULL                                             , NULL                                              } },
    { KONAMI_MASKED_SORCERER                            , 0, { gCardEffectDraw_080656E0                         , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_TRAP_MASTER                                , 0, { gCardEffectDestroyFlip_08066448                  , gCardEffectDestroyFlip_0804F440                  , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_DIMENSIONAL_WARRIOR                        , 0, { gCardEffectBanish_080666F4                       , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_PRINCESS_OF_TSURUGI                        , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_BLAST_JUGGLER_NONE                         , 0, { gCardEffectDestroyTribute_08066DAC               , gCardEffectDestroyTribute_0805018C               , gCardEffectDestroyTribute_0805C598               , gCardEffectDestroyTribute_0805663C               , gCardEffectDestroyTribute_08081E10                } },
    { KONAMI_MAGICIAN_OF_FAITH                          , 0, { gCardEffectGraveyardSearch_08066530              , NULL                                             , NULL                                             , NULL                                             , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_THE_IMMORTAL_OF_THUNDER                    , 0, { gCardEffectSendToGYGainLP_08067160               , NULL                                             , NULL                                             , gCardEffectSendToGYGraveyard_08056658            , NULL                                              } },
    { KONAMI_ARMED_NINJA                                , 0, { gCardEffectDestroyFlip_08066448                  , gCardEffectDestroySpellTrapFlip_08050214         , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_AMEBA                                      , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_NEEDLE_BALL_NONE                           , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , gCardEffectDamageFlip_080566F4                   , NULL                                              } },
    { KONAMI_YADO_KARU_NONE                             , 0, { gCardEffectChangePosition_080671E8               , NULL                                             , gCardEffectChangePositionDestroy_0805C40C        , NULL                                             , NULL                                              } },
    { KONAMI_DRAGON_SEEKER                              , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroyEndPhase_080502B0              , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_MAN_EATER_BUG                              , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroy_08050994                      , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_THE_BISTRO_BUTCHER                         , 0, { gCardEffectDamage_08067334                       , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_SKELENGEL                                  , 0, { gCardEffectDraw_080656E0                         , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_HANE_HANE                                  , 0, { gCardEffectReturnToHand_0806734C                 , gCardEffectReturnToHandFlip_080509FC             , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_GRIGGLE                                    , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MUSHROOM_MAN_2                             , 0, { gCardEffectUnknown_0806738C                      , NULL                                             , gCardEffectUnknown_0805C630                      , gCardEffectUnknown_080567BC                      , NULL                                              } },
    { KONAMI_NEEDLE_WORM                                , 0, { gCardEffectGraveyardSendToGY_080673E0            , NULL                                             , gCardEffectGraveyardSendToGY_0805FA5C            , NULL                                             , NULL                                              } },
    { KONAMI_PATROL_ROBO_NONE                           , 0, { gCardEffectStandbyPhase_08067440                 , gCardEffectStandbyPhaseDamage_08054F64           , NULL                                             , gCardEffectGraveyardSpecialSummon_080563CC       , gCardEffectDestroy_0808198C                       } },
    { KONAMI_WEATHER_REPORT_NONE                        , 0, { gCardEffectDestroyFlip_080674B8                  , NULL                                             , gCardEffectDestroyFlip_0805C660                  , NULL                                             , NULL                                              } },
    { KONAMI_GREENKAPPA                                 , 0, { gCardEffectDestroyFlip_08067594                  , gCardEffectDestroySpellTrapSpecialSummon_08050D78, gCardEffectFlipDestroy_0805C680                  , NULL                                             , gCardEffectDestroyFlip_08081F28                   } },
    { KONAMI_MORPHING_JAR                               , 0, { gCardEffectDrawDiscard_08067614                  , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_PENGUIN_SOLDIER                            , 0, { gCardEffectReturnToHandFlip_080676E0             , gCardEffectReturnToHandFlip_080509FC             , NULL                                             , NULL                                             , gCardEffectReturnToHandFlip_08082048              } },
    { KONAMI_HIRO_S_SHADOW_SCOUT                        , 0, { gCardEffectDiscardGraveyard_08067750             , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_HOURGLASS_OF_COURAGE_NONE                  , 0, { gCardEffectReduceATKEndPhase_08067804            , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_INVADER_OF_THE_THRONE                      , 0, { gCardEffectTakeControlFlip_080678C8              , gCardEffectTakeControlDestroy_0804F618           , gCardEffectTakeControlFlip_0805C694              , gCardEffectTakeControlFlip_08056874              , gCardEffectDestroy_0808198C                       } },
    { KONAMI_DARK_EYES_ILLUSIONIST_NONE                 , 0, { gCardEffectSpecialSummonDestroy_080682AC         , gCardEffectPreventAttackFlip_08051274            , NULL                                             , NULL                                             , gCardEffectDestroyPreventAttack_080824A4          } },
    { KONAMI_JIGEN_BAKUDAN_NONE                         , 0, { gCardEffectDestroyAllDamage_0806843C             , NULL                                             , gCardEffectDestroyAllDamage_0805CA94             , gCardEffectDestroyAllDamage_08056BA0             , NULL                                              } },
    { KONAMI_BLAST_SPHERE                               , 0, { gCardEffectDestroyChangePosition_080684E0        , NULL                                             , gCardEffectDestroyChangePosition_0805CAF0        , NULL                                             , NULL                                              } },
    { KONAMI_INVITATION_TO_A_DARK_SLEEP_NONE            , 0, { gCardEffectSpecialSummonDestroy_080682AC         , gCardEffectDestroyPreventAttack_0804F5C4         , NULL                                             , NULL                                             , gCardEffectDestroyPreventAttack_080824A4          } },
    { KONAMI_HANNIBAL_NECROMANCER                       , 0, { gCardEffectDestroyCounter_0807500C               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_BERFOMET                                   , 0, { gCardEffectSearchSpecialSummon_08068684          , NULL                                             , NULL                                             , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_CYBER_RAIDER                               , 0, { gCardEffectSpecialSummonDestroy_0806882C         , gCardEffectSpecialSummonDestroy_08051670         , NULL                                             , gCardEffectDestroyDamage_08056BC4                , gCardEffectDestroy_0808198C                       } },
    { KONAMI_REFLECT_BOUNDER                            , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_BIG_SHIELD_GARDNA                          , 0, { gCardEffectNegateChangePosition_080688DC         , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_INSECT_QUEEN                               , 0, { gCardEffectSpecialSummonDestroy_08072EB4         , NULL                                             , gCardEffectEndPhaseSpecialSummon_0806244C        , NULL                                             , NULL                                              } },
    { KONAMI_PARASITE_PARACIDE                          , 0, { gCardEffectSpecialSummonDamage_08068990          , NULL                                             , gCardEffectSpecialSummonDamage_0805CB44          , NULL                                             , NULL                                              } },
    { KONAMI_LITTLE_WINGUARD                            , 0, { gCardEffectChangePositionEndPhase_08068B58       , NULL                                             , NULL                                             , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_DRILL_BUG                                  , 0, { gCardEffectDamage_08068BF4                       , NULL                                             , gCardEffectGraveyard_0805C2F0                    , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_BITE_SHOES_NONE                            , 0, { gCardEffectChangePositionFlip_08068C9C           , gCardEffectBoostATKSpecialSummon_0805086C        , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_SATELLITE_CANNON                           , 0, { gCardEffectDestroyBoostATK_08070274              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_THE_LAST_WARRIOR_FROM_ANOTHER_PLANET       , 0, { gCardEffectDestroy_08064660                      , gCardEffectSpecialSummonDestroyAll_08053698      , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_TOTAL_DEFENSE_SHOGUN                       , 0, { gCardEffectChangePosition_08068CD8               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_COPYCAT                                    , 0, { gCardEffectSpecialSummon_08068E0C                , gCardEffectSpecialSummonChangePosition_0805174C  , gCardEffectDestroyDamage_080904F0                , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_ECTOPLASMER                                , 0, { gCardEffectDamageEndPhase_080696F4               , gCardEffectDamageEndPhase_080512C0               , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_ROBBIN_GOBLIN                              , 0, { gCardEffectDiscardDestroy_080665A4               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_THE_STERN_MYSTIC_NONE                      , 0, { gCardEffectDamageChangePosition_0806A548         , gCardEffectSpecialSummonReturnToHand_08055188    , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_WALL_OF_ILLUSION                           , 0, { gCardEffectReturnToHand_0806A694                 , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_SNATCH_STEAL                               , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_CYBER_JAR                                  , 0, { gCardEffectSpecialSummonDestroyAll_0806ADB8      , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_SENJU_OF_THE_THOUSAND_HANDS                , 0, { gCardEffectSearchRitual_0806B200                 , NULL                                             , NULL                                             , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_SPEAR_CRETIN                               , 0, { gCardEffectSpecialSummonSendToGY_0806B53C        , NULL                                             , NULL                                             , gCardEffectSendToGYGraveyard_08056658            , NULL                                              } },
    { KONAMI_SONIC_BIRD                                 , 0, { gCardEffectSearchRitual_0806B200                 , NULL                                             , NULL                                             , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_APPROPRIATE                                , 0, { gCardEffectDraw_080656E0                         , NULL                                             , gCardEffectDraw_0805DE10                         , NULL                                             , NULL                                              } },
    { KONAMI_FORCED_REQUISITION                         , 0, { gCardEffectDiscard_0806B60C                      , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MINOR_GOBLIN_OFFICIAL                      , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_INSPECTION_NONE                            , 0, { gCardEffectDamageStandbyPhase_0806C204           , NULL                                             , gCardEffectDamageStandbyPhase_0805E048           , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_MORPHING_JAR_2                             , 0, { gCardEffectDrawDiscard_0806C3D8                  , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_BUBONIC_VERMIN                             , 0, { gCardEffectSpecialSummonSendToGY_0806B030        , NULL                                             , NULL                                             , gCardEffectSpecialSummonGraveyard_08057294       , NULL                                              } },
    { KONAMI_KISEITAI                                   , 0, { gCardEffectBoostATKBoostDEF_0806C6D8             , NULL                                             , gCardEffectChangePositionSpecialSummon_0805E09C  , NULL                                             , NULL                                              } },
    { KONAMI_THE_EYE_OF_TRUTH                           , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectGainLPStandbyPhase_0805E170           , NULL                                             , NULL                                              } },
    { KONAMI_SLIFER_THE_SKY_DRAGON_NONE                 , 0, { gCardEffectSpecialSummonDestroy_0806CF40         , NULL                                             , gCardEffectSpecialSummonNegate_0805E208          , NULL                                             , NULL                                              } },
    { KONAMI_THE_WINGED_DRAGON_OF_RA_NONE               , 0, { gCardEffectSpecialSummonNegate_0806CFE8          , gCardEffectDestroy_08050994                      , gCardEffectSpecialSummonNegate_0805E260          , gCardEffectSpecialSummonNegate_080572B8          , gCardEffectDamageSendToGY_080833A8                } },
    { KONAMI_KING_TIGER_WANGHU                          , 0, { gCardEffectSpecialSummonDestroy_0806CF40         , NULL                                             , gCardEffectSpecialSummonDestroyAll_0805E358      , NULL                                             , NULL                                              } },
    { KONAMI_AIRKNIGHT_PARSHATH                         , 0, { gCardEffectDraw_080656E0                         , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_KINETIC_SOLDIER                            , 0, { gCardEffectBoostATKBoostDEF_0806D514             , NULL                                             , gCardEffectBoostATKBoostDEF_0805E450             , NULL                                             , NULL                                              } },
    { KONAMI_JOWLS_OF_DARK_DEMISE                       , 0, { gCardEffectTakeControlEndPhase_0806A2EC          , gCardEffectTakeControlDestroy_0804F618           , gCardEffectTakeControlFlip_0805D824              , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_SLATE_WARRIOR                              , 0, { gCardEffectDestroyBoostATK_0806D5B0              , NULL                                             , gCardEffectBoostATKBoostDEF_0805E4B0             , NULL                                             , NULL                                              } },
    { KONAMI_ELECTROMAGNETIC_BAGWORM_NONE               , 0, { gCardEffectTakeControlFlip_0806D618              , gCardEffectTakeControlFlip_08052080              , gCardEffectTakeControlFlip_0805D824              , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_TIMEATER                                   , 0, { gCardEffectDestroyPreventAttack_0806D680         , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MUCUS_YOLK                                 , 0, { gCardEffectBoostATKDamage_0806D6C0               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_RIGRAS_LEEVER                              , 0, { gCardEffectDiscardDestroy_0806D770               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MOISTURE_CREATURE                          , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroySpellTrapDestroyAll_08051ABC   , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_SONIC_JAMMER                               , 0, { gCardEffectSpecialSummonDiscard_08074318         , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_GEARFRIED_THE_IRON_KNIGHT                  , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroyEquip_080521A0                 , gCardEffectDestroyDamage_080904F0                , NULL                                             , NULL                                              } },
    { KONAMI_MASK_OF_DISPEL                             , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectStandbyPhaseDestroy_0805F2C0          , NULL                                             , NULL                                              } },
    { KONAMI_MASK_OF_THE_ACCURSED                       , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectStandbyPhaseDestroy_0805F2C0          , NULL                                             , NULL                                              } },
    { KONAMI_FAIRY_BOX                                  , 0, { gCardEffectDestroyDamage_0806E1C4                , NULL                                             , gCardEffectDestroyDamage_0805E744                , NULL                                             , NULL                                              } },
    { KONAMI_JAM_BREEDING_MACHINE                       , 0, { gCardEffectSpecialSummonDestroy_08072EB4         , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_CARD_OF_SAFE_RETURN                        , 0, { gCardEffectDraw_080656E0                         , NULL                                             , gCardEffectSearchGraveyard_0805C43C              , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_BOMBARDMENT_BEETLE                         , 0, { gCardEffectDestroyChangePosition_0806ED20        , gCardEffectDestroyChangePosition_08052954        , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_4_STARRED_LADYBUG_OF_DOOM                  , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroyAllFlip_080529A8               , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_LADY_ASSAILANT_OF_FLAMES_NONE              , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectBanishDamage_0805ED4C                 , gCardEffectBanishDamage_08057588                 , NULL                                              } },
    { KONAMI_FIRE_SORCERER_NONE                         , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectBanishDamage_0805ED74                 , gCardEffectBanishDamage_0805759C                 , NULL                                              } },
    { KONAMI_SPIRIT_OF_THE_BREEZE                       , 0, { gCardEffectGainLPStandbyPhase_0806F500           , NULL                                             , gCardEffectChangePositionDestroy_0805ED90        , NULL                                             , NULL                                              } },
    { KONAMI_DANCING_FAIRY                              , 0, { gCardEffectGainLPStandbyPhase_0806F500           , NULL                                             , gCardEffectBoostDEFGainLP_0805EDC0               , NULL                                             , NULL                                              } },
    { KONAMI_CURE_MERMAID                               , 0, { gCardEffectGainLPStandbyPhase_0806F500           , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DESTINY_BOARD                              , 0, { gCardEffectSendToGYGraveyard_0806F85C            , NULL                                             , gCardEffectSendToGYGraveyard_0805EE9C            , NULL                                             , NULL                                              } },
    { KONAMI_ANCIENT_LAMP                               , 0, { gCardEffectSpecialSummonChangePosition_080706F4  , gCardEffectSpecialSummonChangePosition_08052DF8  , gCardEffectChangePositionSpecialSummon_0805E09C  , NULL                                             , gCardEffectSpecialSummonChangePosition_08083E14   } },
    { KONAMI_MYSTICAL_BEAST_SERKET                      , 0, { gCardEffectDestroyBoostATK_08070274              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_KYCOO_THE_GHOST_DESTROYER                  , 0, { gCardEffectBanishGraveyard_08069C68              , NULL                                             , gCardEffectGraveyardBanish_0805CFEC              , gCardEffectGraveyardSpecialSummon_080563CC       , gCardEffectGraveyardBanish_080829BC               } },
    { KONAMI_SUMMONER_OF_ILLUSIONS                      , 0, { gCardEffectSpecialSummonFusion_0807039C          , gCardEffectSpecialSummonTribute_08054CB0         , gCardEffectSpecialSummonTribute_0805EF88         , NULL                                             , NULL                                              } },
    { KONAMI_AQUA_SPIRIT                                , 0, { gCardEffectChangePositionSpecialSummon_0807051C  , gCardEffectSpecialSummonChangePosition_0805174C  , NULL                                             , gCardEffectGraveyardSpecialSummon_080563CC       , gCardEffectDestroy_0808198C                       } },
    { KONAMI_GARUDA_THE_WIND_SPIRIT                     , 0, { gCardEffectChangePositionSpecialSummon_0807051C  , gCardEffectSpecialSummonChangePosition_0805174C  , NULL                                             , gCardEffectGraveyardSpecialSummon_080563CC       , gCardEffectDestroy_0808198C                       } },
    { KONAMI_GILASAURUS                                 , 0, { gCardEffectSpecialSummonRevive_08070580          , NULL                                             , gCardEffectSpecialSummonRevive_0805F020          , NULL                                             , NULL                                              } },
    { KONAMI_TORNADO_BIRD                               , 0, { gCardEffectReturnToHandFlip_0807067C             , gCardEffectReturnToHandFlip_08052E60             , gCardEffectFlipDestroy_0805C680                  , NULL                                             , gCardEffectReturnToHandFlip_08083F4C              } },
    { KONAMI_DREAMSPRITE                                , 0, { gCardEffectSpecialSummonChangePosition_080706F4  , gCardEffectUnknown_08052ECC                      , NULL                                             , NULL                                             , gCardEffectSpecialSummonChangePosition_08083E14   } },
    { KONAMI_SUPPLY                                     , 0, { gCardEffectGraveyardSearch_08066530              , NULL                                             , gCardEffectGraveyard_0805F068                    , NULL                                             , gCardEffectGraveyard_08082F44                     } },
    { KONAMI_BLIND_DESTRUCTION                          , 0, { gCardEffectDestroyAllStandbyPhase_08070AC0       , gCardEffectDestroyAllStandbyPhase_08052F6C       , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_VISER_DES                                  , 0, { gCardEffectSpecialSummonDestroy_080682AC         , gCardEffectDestroyPreventAttack_0804F5C4         , NULL                                             , NULL                                             , gCardEffectDestroyPreventAttack_080824A4          } },
    { KONAMI_NIGHTMARE_WHEEL                            , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectStandbyPhaseDestroy_0805F2C0          , NULL                                             , NULL                                              } },
    { KONAMI_BYSER_SHOCK                                , 0, { gCardEffectReturnToHand_0806ABD4                 , gCardEffectSpecialSummonReturnToHand_08055188    , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_RYU_KISHIN_CLOWN                           , 0, { gCardEffectChangePositionSpecialSummon_0807051C  , gCardEffectBoostATKSpecialSummon_0805086C        , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_LIFE_ABSORBING_MACHINE                     , 0, { gCardEffectGainLP_08071284                       , NULL                                             , gCardEffectGainLP_0805F3A4                       , NULL                                             , NULL                                              } },
    { KONAMI_FREED_THE_MATCHLESS_GENERAL                , 0, { gCardEffectSearchNegate_080712A0                 , NULL                                             , gCardEffectSearchGraveyard_0805C43C              , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_MARAUDING_CAPTAIN                          , 0, { gCardEffectSpecialSummon_080659E8                , NULL                                             , gCardEffectSpecialSummon_0805CBCC                , gCardEffectSpecialSummon_08059448                , NULL                                              } },
    { KONAMI_THE_HUNTER_WITH_7_WEAPONS                  , 0, { gCardEffectBoostATK_08071404                     , NULL                                             , gCardEffectBoostATK_0805F3E8                     , NULL                                             , gCardEffectBoostATK_08084144                      } },
    { KONAMI_SHADOW_TAMER                               , 0, { gCardEffectTakeControlFlip_0806D618              , gCardEffectTakeControlFlip_08052080              , gCardEffectTakeControlFlip_0805D824              , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_DRAGON_MANIPULATOR                         , 0, { gCardEffectTakeControlFlip_0806D618              , gCardEffectTakeControlFlip_08052080              , gCardEffectTakeControlFlip_0805D824              , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_CESTUS_OF_DAGLA                            , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DES_FERAL_IMP                              , 0, { gCardEffectGraveyard_08076908                    , NULL                                             , gCardEffectGraveyard_0805C2F0                    , NULL                                             , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_KELBEK                                     , 0, { gCardEffectReturnToHand_0806A694                 , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_FIBER_JAR                                  , 0, { gCardEffectDrawGraveyard_08071A94                , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_GRADIUS_OPTION                             , 0, { gCardEffectSpecialSummonDestroy_080682AC         , gCardEffectDestroyDamage_08052AA8                , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_MAHARAGHI                                  , 0, { gCardEffectSpecialSummonReturnToHand_08071D64    , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_INABA_WHITE_RABBIT                         , 0, { gCardEffectSpecialSummonReturnToHand_08071D64    , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_YATA_GARASU                                , 0, { gCardEffectSpecialSummonReturnToHand_08071D64    , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_SUSA_SOLDIER                               , 0, { gCardEffectSpecialSummonReturnToHand_08071D64    , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_YAMATA_DRAGON                              , 0, { gCardEffectSpecialSummonReturnToHand_08071D64    , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_GREAT_LONG_NOSE                            , 0, { gCardEffectSpecialSummonReturnToHand_08071D64    , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_OTOHIME                                    , 0, { gCardEffectSpecialSummonReturnToHand_08071D64    , gCardEffectSpecialSummonChangePosition_0805174C  , gCardEffectSpecialSummonReturnToHand_0805F784    , gCardEffectSpecialSummonReturnToHand_08057F98    , gCardEffectSpecialSummonReturnToHand_08084180     } },
    { KONAMI_HINO_KAGU_TSUCHI                           , 0, { gCardEffectSpecialSummonReturnToHand_08071D64    , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_ASURA_PRIEST                               , 0, { gCardEffectSpecialSummonReturnToHand_08071D64    , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_FUSHI_NO_TORI                              , 0, { gCardEffectSpecialSummonReturnToHand_08071D64    , NULL                                             , gCardEffectSpecialSummonReturnToHand_0805F784    , NULL                                             , NULL                                              } },
    { KONAMI_SMOKE_GRENADE_OF_THE_THIEF                 , 0, { gCardEffectDiscardGraveyard_0806A8BC             , NULL                                             , NULL                                             , NULL                                             , gCardEffectDamage_08081DB0                        } },
    { KONAMI_BLAST_WITH_CHAIN                           , 0, { gCardEffectDestroy_08064654                      , gCardEffectReturnToHandDestroy_080550E4          , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_OMINOUS_FORTUNETELLING                     , 0, { gCardEffectDamageStandbyPhase_08072228           , NULL                                             , gCardEffectDamageDiscard_0805CD88                , NULL                                             , NULL                                              } },
    { KONAMI_DES_VOLSTGALPH                             , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectSendToGYDestroy_08061018              , NULL                                             , NULL                                              } },
    { KONAMI_VAMPIRE_LORD                               , 0, { gCardEffectSendToGYDamage_080726F4               , NULL                                             , gCardEffectGraveyardSendToGY_0805FA5C            , NULL                                             , NULL                                              } },
    { KONAMI_SASUKE_SAMURAI                             , 0, { gCardEffectDestroyChangePosition_08072870        , NULL                                             , gCardEffectDestroyChangePosition_0805F9A4        , NULL                                             , NULL                                              } },
    { KONAMI_POISON_MUMMY                               , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DARK_DUST_SPIRIT                           , 0, { gCardEffectSpecialSummonReturnToHand_08071D64    , gCardEffectSpecialSummonReturnToHand_08053850    , gCardEffectSpecialSummonReturnToHand_0805F784    , NULL                                             , NULL                                              } },
    { KONAMI_ROYAL_KEEPER                               , 0, { gCardEffectBoostATKBoostDEF_0806678C             , NULL                                             , gCardEffectBoostATKBoostDEF_0805E4B0             , NULL                                             , NULL                                              } },
    { KONAMI_SWARM_OF_SCARABS                           , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroy_0804F550                      , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_SWARM_OF_LOCUSTS                           , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroySpellTrap_08051E94             , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_GUARDIAN_SPHINX                            , 0, { gCardEffectReturnToHandChangePosition_080728F0   , gCardEffectReturnToHandChangePosition_08053460   , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DICE_JAR                                   , 0, { gCardEffectDamageFlip_0807290C                   , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DARK_SCORPION_BURGLARS                     , 0, { gCardEffectSendToGYGraveyard_080729DC            , NULL                                             , gCardEffectGraveyardSendToGY_0805FA5C            , NULL                                             , NULL                                              } },
    { KONAMI_DON_ZALOOG                                 , 0, { gCardEffectDiscardSendToGY_08072A74              , NULL                                             , NULL                                             , gCardEffectDamageGraveyard_08057FF4              , NULL                                              } },
    { KONAMI_DES_LACOODA                                , 0, { gCardEffectDraw_080656E0                         , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_FUSHIOH_RICHIE                             , 0, { gCardEffectSpecialSummonGraveyard_080687A8       , NULL                                             , gCardEffectSpecialSummonGraveyard_0805C248       , NULL                                             , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_COBRAMAN_SAKUZY                            , 0, { gCardEffectDamageChangePosition_0806A548         , gCardEffectChangePosition_080534B8               , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MIRAGE_OF_NIGHTMARE                        , 0, { gCardEffectDrawDiscard_08072BFC                  , NULL                                             , gCardEffectDrawDiscard_0805FAEC                  , NULL                                             , NULL                                              } },
    { KONAMI_ORDEAL_OF_A_TRAVELER                       , 0, { gCardEffectReturnToHand_08072D34                 , NULL                                             , gCardEffectReturnToHand_0805FBB8                 , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_BOTTOMLESS_SHIFTING_SAND                   , 0, { gCardEffectDestroy_08069984                      , gCardEffectDestroySendToGY_0805577C              , gCardEffectDestroyDamage_080904F0                , NULL                                             , NULL                                              } },
    { KONAMI_NEEDLE_WALL                                , 0, { gCardEffectDestroyStandbyPhase_080730E0          , gCardEffectDestroy_080507AC                      , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_GILFORD_THE_LIGHTNING                      , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroy_080507AC                      , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_EXARION_UNIVERSE                           , 0, { gCardEffectBoostATKBoostDEF_0806678C             , NULL                                             , gCardEffectReduceATKDamage_0805FC3C              , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_LEGENDARY_FIEND                            , 0, { gCardEffectDestroyBoostATK_08070274              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_TOON_MASKED_SORCERER                       , 0, { gCardEffectDraw_080656E0                         , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_TOON_GEMINI_ELF                            , 0, { gCardEffectDiscardDestroy_080665A4               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_PUPPET_MASTER                              , 0, { gCardEffectSpecialSummonRevive_0806D124          , NULL                                             , gCardEffectSpecialSummonDamage_0805FDF4          , gCardEffectDamageGraveyard_080565E8              , gCardEffectGraveyard_08082F44                     } },
    { KONAMI_LAVA_GOLEM                                 , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DARK_JEROID                                , 0, { gCardEffectSpecialSummonBoostATK_08073760        , gCardEffectBoostATKSpecialSummon_0805086C        , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_GRAVEKEEPER_S_SPY                          , 0, { gCardEffectSpecialSummonSendToGY_0806B030        , NULL                                             , gCardEffectSpecialSummon_0805C218                , NULL                                             , NULL                                              } },
    { KONAMI_GRAVEKEEPER_S_CURSE                        , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_GRAVEKEEPER_S_GUARD                        , 0, { gCardEffectReturnToHand_0806734C                 , gCardEffectReturnToHandChangePosition_0804F4EC   , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_GRAVEKEEPER_S_ASSAILANT                    , 0, { gCardEffectChangePositionSpecialSummon_0807051C  , gCardEffectSpecialSummonChangePosition_0805174C  , gCardEffectPreventAttackChangePosition_0805FF9C  , gCardEffectGraveyardSpecialSummon_080563CC       , gCardEffectDestroy_0808198C                       } },
    { KONAMI_A_MAN_WITH_WDJAT                           , 0, { gCardEffectStandbyPhase_08067440                 , gCardEffectStandbyPhaseDamage_08054F64           , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_MYSTICAL_KNIGHT_OF_JACKAL                  , 0, { gCardEffectSendToGYGraveyard_0807381C            , NULL                                             , gCardEffectSendToGYDestroy_0805FFB8              , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_A_CAT_OF_ILL_OMEN                          , 0, { gCardEffectSearchFlip_08073864                   , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_WINGED_SAGE_FALCOS                         , 0, { gCardEffectSendToGYGraveyard_0807381C            , NULL                                             , gCardEffectSendToGYChangePosition_0806001C       , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_AN_OWL_OF_LUCK                             , 0, { gCardEffectSearchFlip_08073864                   , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_COBRA_JAR                                  , 0, { gCardEffectSpecialSummonDestroy_08072EB4         , NULL                                             , gCardEffectSpecialSummon_0805C218                , NULL                                             , NULL                                              } },
    { KONAMI_SPIRIT_REAPER                              , 0, { gCardEffectDiscardDestroy_080665A4               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_REAPER_ON_THE_NIGHTMARE                    , 0, { gCardEffectDiscardDestroy_080665A4               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DARK_ROOM_OF_NIGHTMARE                     , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , gCardEffectDamage_0805847C                       , NULL                                              } },
    { KONAMI_KING_S_KNIGHT                              , 0, { gCardEffectSpecialSummonSendToGY_0806B030        , NULL                                             , gCardEffectSpecialSummon_08060C30                , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_GOBLIN_ZOMBIE                              , 0, { gCardEffectSearchSendToGY_080746EC               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DECAYED_COMMANDER                          , 0, { gCardEffectSpecialSummonDiscard_08074770         , NULL                                             , gCardEffectSpecialSummonDiscard_08060328         , gCardEffectSpecialSummonDiscard_08058550         , NULL                                              } },
    { KONAMI_ZOMBIE_TIGER                               , 0, { gCardEffectDiscardDestroy_080665A4               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_VAMPIRE_ORCHIS                             , 0, { gCardEffectSpecialSummon_080659E8                , NULL                                             , gCardEffectSpecialSummon_0805CBCC                , gCardEffectSpecialSummon_08059448                , NULL                                              } },
    { KONAMI_DES_DENDLE                                 , 0, { gCardEffectSpecialSummonDestroy_08072EB4         , NULL                                             , gCardEffectSpecialSummon_0805C218                , NULL                                             , NULL                                              } },
    { KONAMI_BURNING_BEAST                              , 0, { gCardEffectDestroy_08064654                      , gCardEffectSpecialSummonDestroySpellTrap_08050E40, NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_FREEZING_BEAST                             , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroySpellTrapSpecialSummon_08050D78, NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_D_D_CRAZY_BEAST                            , 0, { gCardEffectBanishDestroy_08074834                , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_HELPING_ROBO_FOR_COMBAT                    , 0, { gCardEffectDrawDestroy_0807BBCC                  , NULL                                             , gCardEffectDrawDestroy_08060388                  , NULL                                             , NULL                                              } },
    { KONAMI_DIMENSION_JAR                              , 0, { gCardEffectBanishGraveyard_08074854              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_GREAT_PHANTOM_THIEF_NONE                   , 0, { gCardEffectDiscardDamage_0807A3B8                , NULL                                             , gCardEffectDamageDiscard_0805CD88                , NULL                                             , gCardEffectSearchDiscard_08083280                 } },
    { KONAMI_PALADIN_OF_WHITE_DRAGON                    , 0, { gCardEffectDestroyChangePosition_08072870        , NULL                                             , gCardEffectDestroyChangePosition_0805F9A4        , NULL                                             , NULL                                              } },
    { KONAMI_AMAZONESS_BLOWPIPER                        , 0, { gCardEffectEndPhaseBoostATK_08069DF8             , gCardEffectSpecialSummonChangePosition_0805174C  , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_APPRENTICE_MAGICIAN                        , 0, { gCardEffectSpecialSummonDestroy_080750EC         , gCardEffectDestroyCounter_080552A0               , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_OLD_VINDICTIVE_MAGICIAN                    , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroy_0804F550                      , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_BREAKER_THE_MAGICAL_WARRIOR                , 0, { gCardEffectDestroyCounter_0807500C               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MAGICAL_PLANT_MANDRAGOLA                   , 0, { gCardEffectFlipCounter_08075074                  , gCardEffectFlipCounter_08055248                  , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DES_KOALA                                  , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectDamageDiscard_0805CD88                , NULL                                             , NULL                                              } },
    { KONAMI_CLIFF_THE_TRAP_REMOVER                     , 0, { gCardEffectSendToGYDestroySpellTrap_080750C0     , gCardEffectDestroySpellTrap_08051B20             , gCardEffectDestroyDamage_080904F0                , gCardEffectDamageGraveyard_08057FF4              , gCardEffectDamageSendToGY_080833A8                } },
    { KONAMI_MAGICAL_MERCHANT                           , 0, { gCardEffectSearchSendToGY_0807512C               , NULL                                             , gCardEffectSearchGraveyard_0805C43C              , NULL                                             , NULL                                              } },
    { KONAMI_SENRI_EYE                                  , 0, { gCardEffectDamageStandbyPhase_08075328           , NULL                                             , gCardEffectGraveyardSendToGY_0805FA5C            , gCardEffectDamageGraveyard_080565E8              , NULL                                              } },
    { KONAMI_BOWGANIAN                                  , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_GRANADORA                                  , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_SHINATO_KING_OF_A_HIGHER_PLANE             , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectRitualSummonSendToGY_080609FC         , NULL                                             , NULL                                              } },
    { KONAMI_MIRAGE_KNIGHT                              , 0, { gCardEffectSpecialSummonBanish_080755DC          , NULL                                             , gCardEffectEndPhaseSpecialSummon_0806244C        , NULL                                             , NULL                                              } },
    { KONAMI_BERSERK_DRAGON                             , 0, { gCardEffectDestroyBoostATK_08070274              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_EXODIA_NECROSS                             , 0, { gCardEffectDestroyBoostATK_08070274              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_ARSENAL_SUMMONER                           , 0, { gCardEffectSearchSendToGY_080661FC               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_GUARDIAN_ELMA                              , 0, { gCardEffectGraveyardEquip_08075668               , gCardEffectGraveyardEquip_080548EC               , gCardEffectGraveyardEquip_08063B68               , gCardEffectGraveyardSpecialSummon_080563CC       , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_GUARDIAN_BAOU                              , 0, { gCardEffectDestroyBoostATK_08070274              , NULL                                             , gCardEffectSendToGYDestroy_08061018              , NULL                                             , NULL                                              } },
    { KONAMI_DARK_SCORPION_CHICK_THE_YELLOW             , 0, { gCardEffectReturnToHandDamage_080758F0           , gCardEffectReturnToHandDestroy_080550E4          , gCardEffectDestroyDamage_080904F0                , gCardEffectDamageGraveyard_08057FF4              , gCardEffectDamageSendToGY_080833A8                } },
    { KONAMI_D_D_WARRIOR_LADY                           , 0, { gCardEffectBanish_080666F4                       , NULL                                             , NULL                                             , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_PRECIOUS_CARDS_FROM_BEYOND                 , 0, { gCardEffectDraw_080656E0                         , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DARK_MAGICIAN_KNIGHT                       , 0, { gCardEffectDestroy_08064654                      , gCardEffectReturnToHandDestroy_080550E4          , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_DARK_SCORPION_GORG_THE_STRONG              , 0, { gCardEffectSendToGYDamage_080761E8               , gCardEffectReturnToHandChangePosition_0804F4EC   , gCardEffectDestroyDamage_080904F0                , gCardEffectDamageGraveyard_08057FF4              , gCardEffectDamageSendToGY_080833A8                } },
    { KONAMI_DARK_SCORPION_MEANAE_THE_THORN             , 0, { gCardEffectSearchDamage_08076214                 , NULL                                             , NULL                                             , gCardEffectDamageGraveyard_08057FF4              , NULL                                              } },
    { KONAMI_IRON_BLACKSMITH_KOTETSU                    , 0, { gCardEffectSearchSendToGY_080661FC               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MEFIST_THE_INFERNAL_GENERAL                , 0, { gCardEffectDiscardDestroy_080665A4               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_INFERNALQUEEN_ARCHFIEND                    , 0, { gCardEffectEndPhaseBoostATK_08069DF8             , gCardEffectDestroyEndPhase_080502B0              , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_TSUKUYOMI                                  , 0, { gCardEffectSpecialSummonReturnToHand_08071D64    , gCardEffectChangePosition_08051364               , gCardEffectSpecialSummonReturnToHand_0805F784    , NULL                                             , gCardEffectSpecialSummonReturnToHand_08084180     } },
    { KONAMI_FALLING_DOWN                               , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_PANDEMONIUM                                , 0, { gCardEffectSearchSendToGY_080661FC               , NULL                                             , gCardEffectSearchGraveyard_0805C43C              , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_NIGHTMARE_PENGUIN                          , 0, { gCardEffectReturnToHand_0806734C                 , gCardEffectSpecialSummonDestroy_08054FBC         , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_CRIMSON_NINJA                              , 0, { gCardEffectDestroyFlip_08066448                  , gCardEffectDestroyFlip_0804F440                  , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_GALE_LIZARD                                , 0, { gCardEffectReturnToHand_0806734C                 , gCardEffectReturnToHandChangePosition_0804F4EC   , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_CHOPMAN_THE_DESPERATE_OUTLAW               , 0, { gCardEffectGraveyardEquip_08075668               , gCardEffectGraveyardEquip_080548EC               , gCardEffectGraveyardEquip_08063B68               , gCardEffectGraveyardSpecialSummon_080563CC       , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_SASUKE_SAMURAI_3                           , 0, { gCardEffectDestroyChangePosition_08076AE8        , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_WITCH_DOCTOR_OF_CHAOS                      , 0, { gCardEffectBanishGraveyard_08069C68              , NULL                                             , gCardEffectGraveyardBanish_0805CFEC              , NULL                                             , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_INFERNO                                    , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectSendToGYDestroy_08061018              , NULL                                             , NULL                                              } },
    { KONAMI_FENRIR                                     , 0, { gCardEffectSpecialSummonDestroy_0806C764         , NULL                                             , gCardEffectSpecialSummonDestroy_08061070         , NULL                                             , NULL                                              } },
    { KONAMI_BLACK_LUSTER_SOLDIER_ENVOY_OF_THE_BEGINNING, 0, { gCardEffectDestroy_08076E20                      , NULL                                             , gCardEffectDestroySpecialSummon_08061110         , gCardEffectDestroy_08058858                      , NULL                                              } },
    { KONAMI_HEART_OF_THE_UNDERDOG                      , 0, { gCardEffectDraw_080656E0                         , NULL                                             , gCardEffectSearchGraveyard_0805C43C              , gCardEffectDraw_0805888C                         , NULL                                              } },
    { KONAMI_STUMBLING                                  , 0, { gCardEffectSpecialSummonChangePosition_080770B4  , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_RECYCLE                                    , 0, { gCardEffectGraveyardDamage_08078954              , NULL                                             , gCardEffectGraveyard_0805C2F0                    , gCardEffectDamage_0805635C                       , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_SOUL_ABSORPTION                            , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_TOWER_OF_BABEL                             , 0, { gCardEffectDestroyDamage_08077538                , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MOLTEN_ZOMBIE                              , 0, { gCardEffectDraw_080656E0                         , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DARK_MAGICIAN_OF_CHAOS                     , 0, { gCardEffectGraveyardSearch_08066530              , NULL                                             , NULL                                             , gCardEffectSearchSpecialSummon_08058A1C          , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_STEALTH_BIRD                               , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_SACRED_CRANE                               , 0, { gCardEffectDraw_080656E0                         , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DON_TURTLE                                 , 0, { gCardEffectSpecialSummon_080659E8                , NULL                                             , gCardEffectSpecialSummon_0805CBCC                , gCardEffectSpecialSummon_08059448                , NULL                                              } },
    { KONAMI_HYPER_HAMMERHEAD                           , 0, { gCardEffectChangePosition_08077920               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_PRICKLE_FAIRY                              , 0, { gCardEffectChangePosition_08077920               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_INSECT_PRINCESS                            , 0, { gCardEffectDestroyBoostATK_08070274              , NULL                                             , gCardEffectDestroyBoostATK_0806153C              , NULL                                             , NULL                                              } },
    { KONAMI_GUARDIAN_ANGEL_JOAN                        , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectSendToGYDestroy_080615D8              , NULL                                             , NULL                                              } },
    { KONAMI_MANJU_OF_THE_TEN_THOUSAND_HANDS            , 0, { gCardEffectSearchRitual_0806B200                 , NULL                                             , NULL                                             , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_GETSU_FUHMA                                , 0, { gCardEffectDestroy_080779BC                      , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_RYU_KOKKI                                  , 0, { gCardEffectDestroy_080779BC                      , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_BEGONE_KNAVE                               , 0, { gCardEffectReturnToHand_0806ABD4                 , gCardEffectDamageReturnToHand_0805465C           , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_ROBBIN_ZOMBIE                              , 0, { gCardEffectGraveyardSendToGY_080673E0            , NULL                                             , gCardEffectGraveyardSendToGY_0805FA5C            , NULL                                             , NULL                                              } },
    { KONAMI_INFERNO_HAMMER                             , 0, { gCardEffectChangePosition_0807142C               , gCardEffectSendToGYDestroy_080542F0              , gCardEffectSendToGYDestroy_08061018              , gCardEffectGraveyardSpecialSummon_080563CC       , gCardEffectDestroy_0808198C                       } },
    { KONAMI_EMES_THE_INFINITY                          , 0, { gCardEffectDestroyBoostATK_08070274              , NULL                                             , gCardEffectSendToGYDestroy_08061018              , NULL                                             , NULL                                              } },
    { KONAMI_D_D_ASSAILANT                              , 0, { gCardEffectBanish_080666F4                       , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_TEVA                                       , 0, { gCardEffectDestroyPreventAttack_0806D680         , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MAXIMUM_SIX                                , 0, { gCardEffectBoostATKTribute_08077E00              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DANGEROUS_MACHINE_TYPE_6                   , 0, { gCardEffectDrawDiscard_08077ECC                  , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_THE_AGENT_OF_WISDOM_MERCURY                , 0, { gCardEffectDraw_080656E0                         , NULL                                             , gCardEffectEndPhaseSpecialSummon_0806244C        , NULL                                             , NULL                                              } },
    { KONAMI_SOUL_ABSORBING_BONE_TOWER                  , 0, { gCardEffectGraveyardSendToGY_080673E0            , NULL                                             , gCardEffectGraveyardSendToGY_0805FA5C            , NULL                                             , NULL                                              } },
    { KONAMI_THE_KICK_MAN                               , 0, { gCardEffectGraveyardEquip_08075668               , gCardEffectGraveyardEquip_080548EC               , gCardEffectGraveyardEquip_08063B68               , gCardEffectGraveyardSpecialSummon_080563CC       , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_VAMPIRE_LADY                               , 0, { gCardEffectSendToGYDamage_080726F4               , NULL                                             , gCardEffectGraveyardSendToGY_0805FA5C            , NULL                                             , NULL                                              } },
    { KONAMI_LEGENDARY_JUJITSU_MASTER                   , 0, { gCardEffectChangePosition_08077920               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_KA_2_DES_SCISSORS                          , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectSendToGYDestroy_080615D8              , NULL                                             , NULL                                              } },
    { KONAMI_NEEDLE_BURROWER                            , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectSendToGYDestroy_080615D8              , NULL                                             , NULL                                              } },
    { KONAMI_ZABORG_THE_THUNDER_MONARCH                 , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroy_08050994                      , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_DISC_FIGHTER                               , 0, { gCardEffectDestroyChangePosition_08078158        , NULL                                             , gCardEffectDestroyChangePosition_080619C0        , NULL                                             , NULL                                              } },
    { KONAMI_SOLAR_FLARE_DRAGON                         , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_WHITE_MAGICIAN_PIKERU                      , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_BACKFIRE                                   , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MAZERA_DEVILLE                             , 0, { gCardEffectSpecialSummonDiscard_08078794         , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MARSHMALLON                                , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_SKULL_DESCOVERY_KNIGHT                     , 0, { gCardEffectSpecialSummonDestroy_080787E0         , NULL                                             , gCardEffectSpecialSummonDestroy_08061C4C         , gCardEffectSpecialSummonDestroy_08059008         , NULL                                              } },
    { KONAMI_SPIRIT_OF_THE_PHARAOH                      , 0, { gCardEffectSpecialSummonRevive_08078808          , NULL                                             , gCardEffectSpecialSummonGraveyard_0805C248       , gCardEffectGraveyardSpecialSummon_080563CC       , gCardEffectGraveyard_08082F44                     } },
    { KONAMI_ASWAN_APPARITION                           , 0, { gCardEffectGraveyardDamage_08078954              , NULL                                             , gCardEffectGraveyard_0805C2F0                    , gCardEffectGraveyardSpecialSummon_080563CC       , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_NUBIAN_GUARD                               , 0, { gCardEffectGraveyardDamage_08078954              , NULL                                             , gCardEffectGraveyard_0805C2F0                    , gCardEffectGraveyardSpecialSummon_080563CC       , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_DESERTAPIR                                 , 0, { gCardEffectChangePosition_0807142C               , gCardEffectChangePositionFlip_0805440C           , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_GHOST_KNIGHT_OF_JACKAL                     , 0, { gCardEffectSpecialSummonSendToGY_08078A24        , NULL                                             , gCardEffectSpecialSummonSendToGY_08061CC8        , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_ABSORBING_KID_FROM_THE_SKY                 , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectSendToGYDestroy_080615D8              , NULL                                             , NULL                                              } },
    { KONAMI_SPIRIT_CALLER                              , 0, { gCardEffectSpecialSummonGraveyard_080687A8       , NULL                                             , gCardEffectSpecialSummonGraveyard_0805C248       , gCardEffectGraveyardSpecialSummon_080563CC       , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_NIGHT_ASSAILANT                            , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroy_0804F550                      , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_THE_FIRST_SARCOPHAGUS                      , 0, { gCardEffectSpecialSummonSendToGY_08078FE0        , NULL                                             , gCardEffectSpecialSummonSendToGY_08061E20        , gCardEffectSpecialSummonSendToGY_08059068        , NULL                                              } },
    { KONAMI_HUMAN_WAVE_TACTICS                         , 0, { gCardEffectSpecialSummonDestroy_080792F8         , NULL                                             , gCardEffectSpecialSummonDestroy_08061E50         , NULL                                             , NULL                                              } },
    { KONAMI_DES_COUNTERBLOW                            , 0, { gCardEffectDestroy_08064660                      , gCardEffectDamageReturnToHand_0805465C           , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_LABYRINTH_OF_NIGHTMARE                     , 0, { gCardEffectChangePosition_0806D0CC               , gCardEffectChangePositionEndPhase_08050C58       , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_CRUSH_D_GANDRA                             , 0, { gCardEffectSpecialSummonSendToGY_080797D0        , NULL                                             , gCardEffectSpecialSummonSendToGY_08061EB4        , NULL                                             , NULL                                              } },
    { KONAMI_ANDRO_SPHINX                               , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectSpecialSummonDestroy_08061FF8         , NULL                                             , NULL                                              } },
    { KONAMI_SPHINX_TELEIA                              , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectSpecialSummonDestroy_08061FF8         , NULL                                             , NULL                                              } },
    { KONAMI_THEINEN_THE_GREAT_SPHINX                   , 0, { gCardEffectBoostATKBoostDEF_0806678C             , NULL                                             , NULL                                             , gCardEffectDamageGraveyard_080565E8              , NULL                                              } },
    { KONAMI_ULTIMATE_INSECT_LV1                        , 0, { gCardEffectSpecialSummonGraveyard_08066858       , NULL                                             , gCardEffectSpecialSummonSendToGY_08062564        , gCardEffectSpecialSummonSendToGY_08059174        , NULL                                              } },
    { KONAMI_HORUS_THE_BLACK_FLAME_DRAGON_LV4           , 0, { gCardEffectSpecialSummonGraveyard_08066858       , NULL                                             , gCardEffectSpecialSummonSendToGY_08062090        , gCardEffectSpecialSummonSendToGY_08059174        , NULL                                              } },
    { KONAMI_HORUS_THE_BLACK_FLAME_DRAGON_LV6           , 0, { gCardEffectSpecialSummonGraveyard_08066858       , NULL                                             , gCardEffectSpecialSummonSendToGY_08062090        , gCardEffectSpecialSummonSendToGY_08059174        , NULL                                              } },
    { KONAMI_DARK_MIMIC_LV1                             , 0, { gCardEffectDrawSpecialSummon_08079F5C            , NULL                                             , gCardEffectDrawSpecialSummon_080620C0            , gCardEffectSpecialSummonSendToGY_080592C4        , NULL                                              } },
    { KONAMI_MYSTIC_SWORDSMAN_LV2                       , 0, { gCardEffectSpecialSummonSendToGY_08079F80        , NULL                                             , gCardEffectSpecialSummonSendToGY_080620E0        , gCardEffectSpecialSummonSendToGY_080592C4        , NULL                                              } },
    { KONAMI_MYSTIC_SWORDSMAN_LV4                       , 0, { gCardEffectSpecialSummonSendToGY_08079F80        , NULL                                             , gCardEffectSpecialSummonSendToGY_080620E0        , gCardEffectSpecialSummonSendToGY_080592C4        , NULL                                              } },
    { KONAMI_ARMED_DRAGON_LV3                           , 0, { gCardEffectSpecialSummonGraveyard_08066858       , NULL                                             , gCardEffectSpecialSummonSendToGY_0806210C        , gCardEffectSpecialSummonSendToGY_08059174        , NULL                                              } },
    { KONAMI_ARMED_DRAGON_LV5                           , 0, { gCardEffectSpecialSummonGraveyard_08066858       , NULL                                             , gCardEffectSpecialSummonSendToGY_08062090        , gCardEffectSpecialSummonSendToGY_08059174        , NULL                                              } },
    { KONAMI_NINJA_GRANDMASTER_SASUKE                   , 0, { gCardEffectDestroyChangePosition_08072870        , NULL                                             , gCardEffectDestroyChangePosition_080622DC        , NULL                                             , NULL                                              } },
    { KONAMI_RAFFLESIA_SEDUCTION                        , 0, { gCardEffectTakeControlEndPhase_0806A2EC          , gCardEffectTakeControlFlip_08052080              , gCardEffectTakeControlFlip_0805D824              , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_MOBIUS_THE_FROST_MONARCH                   , 0, { gCardEffectDestroyFlip_08067594                  , gCardEffectDestroySpellTrap_08051B20             , NULL                                             , gCardEffectGraveyardSpecialSummon_080563CC       , gCardEffectDestroySpellTrapTribute_08084750       } },
    { KONAMI_ELEMENT_DRAGON                             , 0, { gCardEffectDestroy_08076E20                      , NULL                                             , gCardEffectDestroy_0806231C                      , gCardEffectDestroy_08058858                      , NULL                                              } },
    { KONAMI_NOBLEMAN_EATER_BUG                         , 0, { gCardEffectDestroyFlip_08067594                  , gCardEffectDestroy_08050994                      , gCardEffectFlipDestroy_0805C680                  , NULL                                             , gCardEffectDestroyFlip_08081F28                   } },
    { KONAMI_HADE_HANE                                  , 0, { gCardEffectReturnToHandFlip_080676E0             , gCardEffectReturnToHandFlip_080509FC             , NULL                                             , NULL                                             , gCardEffectReturnToHandFlip_080848CC              } },
    { KONAMI_OJAMA_KING                                 , 0, { gCardEffectUnknown_0806F2CC                      , NULL                                             , gCardEffectUnknown_0806234C                      , NULL                                             , gCardEffectUnknown_08084AF4                       } },
    { KONAMI_TWO_MAN_CELL_BATTLE                        , 0, { gCardEffectSpecialSummon_080659E8                , NULL                                             , gCardEffectSpecialSummon_0805CBCC                , gCardEffectSpecialSummon_08059448                , NULL                                              } },
    { KONAMI_GREED                                      , 0, { gCardEffectEndPhase_0807A580                     , NULL                                             , gCardEffectEndPhaseSpecialSummon_0806244C        , NULL                                             , NULL                                              } },
    { KONAMI_GREEN_GADGET                               , 0, { gCardEffectSearchSpecialSummon_08068684          , NULL                                             , NULL                                             , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_RED_GADGET                                 , 0, { gCardEffectSearchSpecialSummon_08068684          , NULL                                             , NULL                                             , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_YELLOW_GADGET                              , 0, { gCardEffectSearchSpecialSummon_08068684          , NULL                                             , NULL                                             , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_SILENT_SWORDSMAN_LV3                       , 0, { gCardEffectSpecialSummonGraveyard_08066858       , NULL                                             , gCardEffectSpecialSummonSendToGY_08062564        , gCardEffectSpecialSummonSendToGY_08059174        , NULL                                              } },
    { KONAMI_SILENT_SWORDSMAN_LV5                       , 0, { gCardEffectSpecialSummonGraveyard_08066858       , NULL                                             , gCardEffectSpecialSummonSendToGY_08062610        , gCardEffectSpecialSummonSendToGY_08059174        , NULL                                              } },
    { KONAMI_SILENT_MAGICIAN_LV4                        , 0, { gCardEffectSpecialSummonSendToGY_0807A65C        , NULL                                             , gCardEffectSpecialSummonSendToGY_08062640        , gCardEffectSpecialSummonSendToGY_0805951C        , NULL                                              } },
    { KONAMI_ULTIMATE_INSECT_LV3                        , 0, { gCardEffectSpecialSummonGraveyard_08066858       , NULL                                             , gCardEffectSpecialSummonSendToGY_08062564        , gCardEffectSpecialSummonSendToGY_08059174        , NULL                                              } },
    { KONAMI_MYSTIC_SWORDSMAN_LV6                       , 0, { gCardEffectSendToGYDestroy_0807A9C8              , NULL                                             , gCardEffectDestroyChangePosition_0805F9A4        , NULL                                             , NULL                                              } },
    { KONAMI_ELEMENT_MAGICIAN                           , 0, { gCardEffectDestroy_08076E20                      , NULL                                             , gCardEffectDestroy_0806231C                      , gCardEffectDestroy_08058858                      , NULL                                              } },
    { KONAMI_SASUKE_SAMURAI_4                           , 0, { gCardEffectDestroyChangePosition_0807AA98        , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_RAGING_FLAME_SPRITE                        , 0, { gCardEffectDestroyBoostATK_08070274              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_THESTALOS_THE_FIRESTORM_MONARCH            , 0, { gCardEffectDiscardDamage_0807AB6C                , NULL                                             , gCardEffectDamageDiscard_0805CD88                , NULL                                             , NULL                                              } },
    { KONAMI_GAIA_SOUL_THE_COMBUSTIBLE_COLLECTIVE       , 0, { gCardEffectDestroyBoostATK_0807AC1C              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_BIG_CORE                                   , 0, { gCardEffectDestroyCounter_0807AC84               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DEKOICHI_THE_BATTLECHANTED_LOCOMOTIVE      , 0, { gCardEffectDrawFlip_0807AD14                     , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DARK_BLADE_THE_DRAGON_KNIGHT               , 0, { gCardEffectBanishGraveyard_08069C68              , NULL                                             , gCardEffectGraveyardBanish_0805CFEC              , gCardEffectGraveyardSpecialSummon_080563CC       , gCardEffectGraveyardBanish_080829BC               } },
    { KONAMI_HARPIES_HUNTING_GROUND                     , 0, { gCardEffectDestroy_08064654                      , gCardEffectSpecialSummonDestroySpellTrap_08054B18, NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_SACRED_PHOENIX_OF_NEPHTHYS                 , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroySpellTrapDestroyAll_08051998   , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_ULTIMATE_INSECT_LV5                        , 0, { gCardEffectSpecialSummonGraveyard_08066858       , NULL                                             , gCardEffectSpecialSummonSendToGY_08062564        , gCardEffectSpecialSummonSendToGY_08059174        , NULL                                              } },
    { KONAMI_GRANMARG_THE_ROCK_MONARCH                  , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroyDiscard_08055360               , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_ELEMENT_DOOM                               , 0, { gCardEffectDestroy_08076E20                      , NULL                                             , gCardEffectDestroy_0806231C                      , gCardEffectDestroy_08058858                      , NULL                                              } },
    { KONAMI_MAJI_GIRE_PANDA                            , 0, { gCardEffectDestroyBoostATK_08070274              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_BEHEMOTH_THE_KING_OF_ALL_ANIMALS           , 0, { gCardEffectGraveyardSearch_08066530              , NULL                                             , gCardEffectReturnToHandGraveyard_08062CEC        , gCardEffectGraveyardSpecialSummon_080563CC       , gCardEffectGraveyard_08082F44                     } },
    { KONAMI_KANGAROO_CHAMP                             , 0, { gCardEffectChangePosition_08077920               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_BLADE_RABBIT                               , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroy_0804F550                      , gCardEffectChangePositionDestroy_0805C40C        , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_GEARFRIED_THE_SWORDMASTER                  , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroy_0804F550                      , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_GOLEM_SENTRY                               , 0, { gCardEffectReturnToHand_0806734C                 , gCardEffectReturnToHandChangePosition_0804F4EC   , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_FIREBIRD                                   , 0, { gCardEffectDestroyBoostATK_08070274              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_BRAIN_JACKER                               , 0, { gCardEffectTakeControlGainLP_0807B958            , gCardEffectEquipBoostATK_0805000C                , gCardEffectTakeControlGainLP_08062DFC            , NULL                                             , gCardEffectTakeControlGainLP_08084D3C             } },
    { KONAMI_POISON_FANGS                               , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_SPIRAL_SPEAR_STRIKE                        , 0, { gCardEffectDrawDiscard_08069148                  , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_CENTRIFUGAL_FIELD                          , 0, { gCardEffectSpecialSummonGraveyard_080687A8       , NULL                                             , gCardEffectSpecialSummonGraveyard_0805C248       , NULL                                             , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_BLOOD_SUCKER                               , 0, { gCardEffectGraveyardSendToGY_080673E0            , NULL                                             , gCardEffectGraveyardSendToGY_0805FA5C            , NULL                                             , NULL                                              } },
    { KONAMI_MILLENNIUM_SCORPION                        , 0, { gCardEffectDestroyBoostATK_08070274              , NULL                                             , gCardEffectSendToGYDestroy_0805FFB8              , NULL                                             , NULL                                              } },
    { KONAMI_CRIOSPHINX                                 , 0, { gCardEffectReturnToHandSendToGY_0807BE2C         , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DUMMY_GOLEM                                , 0, { gCardEffectTakeControlFlip_0807BF64              , gCardEffectTakeControlChangePosition_080508CC    , gCardEffectTakeControlFlip_080630F8              , NULL                                             , NULL                                              } },
    { KONAMI_GRAVE_OHJA                                 , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_GUARDIAN_STATUE                            , 0, { gCardEffectReturnToHand_0806734C                 , gCardEffectReturnToHandChangePosition_0804F4EC   , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_MEDUSA_WORM                                , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroy_0804F550                      , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_WHITE_NINJA                                , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroyChangePosition_08053C00        , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_AUSSA_THE_EARTH_CHARMER                    , 0, { gCardEffectTakeControlFlip_0807C088              , gCardEffectTakeControlFlip_08054D08              , gCardEffectTakeControlFlip_080631C0              , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_ERIA_THE_WATER_CHARMER                     , 0, { gCardEffectTakeControlFlip_0807C088              , gCardEffectTakeControlFlip_08054D08              , gCardEffectTakeControlFlip_080631C0              , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_HIITA_THE_FIRE_CHARMER                     , 0, { gCardEffectTakeControlFlip_0807C088              , gCardEffectTakeControlFlip_08054D08              , gCardEffectTakeControlFlip_080631C0              , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_WYNN_THE_WIND_CHARMER                      , 0, { gCardEffectTakeControlFlip_0807C088              , gCardEffectTakeControlFlip_08054D08              , gCardEffectTakeControlFlip_080631C0              , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_ELEMENTAL_HERO_FLAME_WINGMAN               , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectSendToGYDestroy_080615D8              , NULL                                             , NULL                                              } },
    { KONAMI_LEGENDARY_BLACK_BELT                       , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectSendToGYDestroy_080615D8              , NULL                                             , NULL                                              } },
    { KONAMI_KOZAKY_S_SELF_DESTRUCT_BUTTON              , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_INFERNAL_FLAME_EMPEROR                     , 0, { gCardEffectSpecialSummonBanish_0807C388          , gCardEffectSpecialSummonBanish_080553D4          , gCardEffectSpecialSummonBanish_08063254          , gCardEffectSpecialSummonBanish_08059CC8          , NULL                                              } },
    { KONAMI_HOLY_KNIGHT_ISHZARK                        , 0, { gCardEffectBanishDestroy_08074834                , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DRILLROID                                  , 0, { gCardEffectDestroyChangePosition_08078158        , NULL                                             , gCardEffectDestroyChangePosition_080622DC        , NULL                                             , NULL                                              } },
    { KONAMI_ELEMENTAL_HERO_BUBBLEMAN                   , 0, { gCardEffectDraw_080656E0                         , NULL                                             , gCardEffectDrawSpecialSummon_0806348C            , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_SUMMON_PRIEST                              , 0, { gCardEffectChangePosition_08068CD8               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DARK_RULER_VANDALGYON                      , 0, { gCardEffectSpecialSummonDestroySpellTrap_0807C750, gCardEffectSpecialSummonDestroy_08054FBC         , gCardEffectDestroyDamage_080904F0                , gCardEffectSpecialSummonDestroySpellTrap_08059E94, gCardEffectSpecialSummonDestroySpellTrap_08084E2C } },
    { KONAMI_CYBER_ARCHFIEND                            , 0, { gCardEffectDrawSearch_0807C7F0                   , NULL                                             , gCardEffectDrawSearch_080636F8                   , NULL                                             , NULL                                              } },
    { KONAMI_B_E_S_CRYSTAL_CORE                         , 0, { gCardEffectDestroyCounter_0807AC84               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DES_FROG                                   , 0, { gCardEffectSpecialSummonRevive_0807C87C          , NULL                                             , gCardEffectSpecialSummonRevive_08063730          , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_EBON_MAGICIAN_CURRAN                       , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_PREPARE_TO_STRIKE_BACK                     , 0, { gCardEffectChangePositionRNG_0807D014            , NULL                                             , gCardEffectChangePositionRNG_08063954            , NULL                                             , NULL                                              } },
    { KONAMI_GILFORD_THE_LEGEND                         , 0, { gCardEffectSpecialSummonRevive_0807D104          , gCardEffectGraveyardEquip_080548EC               , gCardEffectGraveyardEquip_08063B68               , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_ELEMENTAL_HERO_SHINING_FLARE_WINGMAN       , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectSendToGYDestroy_080615D8              , NULL                                             , NULL                                              } },
    { KONAMI_HYDROGEDDON                                , 0, { gCardEffectSpecialSummonSendToGY_0806B030        , NULL                                             , gCardEffectSpecialSummon_0805C218                , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_VWXYZ_DRAGON_CATAPULT_CANNON               , 0, { gCardEffectSpecialSummonBanish_0807D564          , NULL                                             , gCardEffectSpecialSummonBanish_08063CF0          , gCardEffectGraveyardSpecialSummon_080563CC       , gCardEffectSpecialSummonBanish_080850D8           } },
    { KONAMI_B_E_S_TETRAN                               , 0, { gCardEffectDestroyCounter_0807AC84               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_NANOBREAKER                                , 0, { gCardEffectDestroyChangePosition_08072870        , NULL                                             , gCardEffectDestroy_08063E34                      , NULL                                             , NULL                                              } },
    { KONAMI_BRRON_MAD_KING_OF_DARK_WORLD               , 0, { gCardEffectDiscardDamage_0807D7D0                , NULL                                             , gCardEffectGraveyardDraw_0806131C                , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_BOSS_RUSH                                  , 0, { gCardEffectSpecialSummonSendToGY_0806E898        , NULL                                             , gCardEffectSpecialSummonSendToGY_08063E94        , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_ARMED_CHANGER                              , 0, { gCardEffectGraveyardSearch_08066530              , NULL                                             , gCardEffectGraveyard_0805C2F0                    , gCardEffectGraveyardSpecialSummon_080563CC       , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_ELEMENTAL_HERO_STEAM_HEALER                , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectSendToGYDestroy_080615D8              , NULL                                             , NULL                                              } },
    { KONAMI_WHITE_HORNS_D                              , 0, { gCardEffectSpecialSummonBoostATK_0807E24C        , NULL                                             , gCardEffectGraveyardBanish_0805CFEC              , NULL                                             , gCardEffectGraveyardBanish_080829BC               } },
    { KONAMI_HAMON_LORD_OF_STRIKING_THUNDER             , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectSendToGYDestroy_08061018              , NULL                                             , NULL                                              } },
    { KONAMI_RAVIEL_LORD_OF_PHANTASMS                   , 0, { gCardEffectSpecialSummonDestroy_08072EB4         , NULL                                             , gCardEffectSpecialSummon_0805C218                , NULL                                             , NULL                                              } },
    { KONAMI_ELEMENTAL_HERO_NEO_BUBBLEMAN               , 0, { gCardEffectDestroy_080779BC                      , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_HERO_KID                                   , 0, { gCardEffectSpecialSummonSendToGY_0807B4D4        , gCardEffectSpecialSummon_080557E0                , gCardEffectSpecialSummon_0805FF64                , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_ADHESIVE_EXPLOSIVE                         , 0, { gCardEffectDestroyChangePosition_080684E0        , NULL                                             , gCardEffectDestroyChangePosition_0805CAF0        , NULL                                             , NULL                                              } },
    { KONAMI_B_E_S_COVERED_CORE                         , 0, { gCardEffectDestroyCounter_0807E5D4               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_D_D_GUIDE                                  , 0, { gCardEffectBanishGraveyard_0807E6E0              , NULL                                             , gCardEffectBanishGraveyard_08064314              , NULL                                             , NULL                                              } },
    { KONAMI_DISCIPLE_OF_THE_FORBIDDEN_SPELL            , 0, { gCardEffectSpecialSummonDestroy_0807E7E4         , NULL                                             , gCardEffectSpecialSummonDestroy_08064360         , NULL                                             , NULL                                              } },
    { KONAMI_SILENT_INSECT                              , 0, { gCardEffectChangePosition_08068CD8               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_CHAINSAW_INSECT                            , 0, { gCardEffectDraw_080656E0                         , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DOOM_DOZER                                 , 0, { gCardEffectGraveyardSendToGY_080673E0            , NULL                                             , gCardEffectGraveyardSendToGY_0805FA5C            , NULL                                             , NULL                                              } },
    { KONAMI_PRINCESS_PIKERU                            , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_PRINCESS_CURRAN                            , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MEMORY_CRUSHER                             , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MALICE_ASCENDANT                           , 0, { gCardEffectSendToGYGraveyard_0807E960            , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DIVINE_DRAGON_EXCELION                     , 0, { gCardEffectSendToGYDestroy_0807E9F8              , NULL                                             , gCardEffectSendToGYDestroy_08064418              , gCardEffectSendToGYDestroy_0805A1DC              , NULL                                              } },
    { KONAMI_RUIN_QUEEN_OF_OBLIVION                     , 0, { gCardEffectDestroy_08076E20                      , NULL                                             , gCardEffectDestroySpecialSummon_08061110         , gCardEffectDestroy_08058858                      , NULL                                              } },
    { KONAMI_ELEMENTAL_HERO_ERIKSHIELER                 , 0, { gCardEffectSpecialSummonFusionSummon_0807F458    , NULL                                             , gCardEffectSpecialSummonFusionSummon_080645F0    , NULL                                             , NULL                                              } },
    { KONAMI_GUARDIAN_EXODE                             , 0, { gCardEffectSpecialSummonDamage_0807F53C          , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_GREAT_SPIRIT                               , 0, { gCardEffectEndPhaseBoostATK_08069DF8             , gCardEffectDestroyEndPhase_080502B0              , NULL                                             , gCardEffectGraveyardSpecialSummon_080563CC       , gCardEffectDestroy_0808198C                       } },
};

// gEffects2  (143 entries)
const struct CardEffects gCardEffects2[] = {
//  KonamiId                                             pad  eff1  eff2  eff3  eff4  eff5
    { KONAMI_SANGAN                                     , 0, { gCardEffectSearchSendToGY_080661FC               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_KURIBOH                                    , 0, { gCardEffectDiscardDamage_08066314                , NULL                                             , gCardEffectDiscardDamage_0805C33C                , gCardEffectDiscardSearch_0805652C                , NULL                                              } },
    { KONAMI_PENGUIN_KNIGHT                             , 0, { gCardEffectSendToGYGraveyard_08066698            , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_AXE_OF_DESPAIR                             , 0, { gCardEffectSendToGYGraveyard_0806683C            , NULL                                             , gCardEffectSendToGYBoostATK_0805C48C             , gCardEffectSendToGYBoostATK_08056598             , NULL                                              } },
    { KONAMI_BLACK_PENDANT                              , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_HORN_OF_LIGHT                              , 0, { gCardEffectSendToGYGraveyard_0806683C            , NULL                                             , NULL                                             , gCardEffectDamageGraveyard_080565E8              , NULL                                              } },
    { KONAMI_HORN_OF_THE_UNICORN                        , 0, { gCardEffectSendToGYGraveyard_0806683C            , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MALEVOLENT_NUZZLER                         , 0, { gCardEffectSendToGYGraveyard_0806683C            , NULL                                             , NULL                                             , gCardEffectDamageGraveyard_080565E8              , NULL                                              } },
    { KONAMI_THUNDER_DRAGON                             , 0, { gCardEffectSearchGraveyard_08066EE0              , NULL                                             , gCardEffectSearchGraveyard_0805C43C              , gCardEffectDiscardSearch_0805652C                , NULL                                              } },
    { KONAMI_THE_IMMORTAL_OF_THUNDER                    , 0, { gCardEffectSendToGYGainLP_08067160               , NULL                                             , NULL                                             , gCardEffectSendToGYGraveyard_08056658            , NULL                                              } },
    { KONAMI_ELECTRIC_SNAKE                             , 0, { gCardEffectDraw_080656E0                         , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_SINISTER_SERPENT                           , 0, { gCardEffectGraveyardSearch_08075A7C              , NULL                                             , NULL                                             , gCardEffectGraveyardStandbyPhase_080566CC        , NULL                                              } },
    { KONAMI_COCKROACH_KNIGHT                           , 0, { gCardEffectSendToGYGraveyard_0806683C            , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MINAR                                      , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_WITCH_OF_THE_BLACK_FOREST                  , 0, { gCardEffectSearchSendToGY_080661FC               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_CHIMERA_THE_FLYING_MYTHICAL_BEAST          , 0, { gCardEffectSpecialSummonGraveyard_080687A8       , NULL                                             , gCardEffectSpecialSummonGraveyard_0805C248       , gCardEffectGraveyardSpecialSummon_080563CC       , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_PARASITE_PARACIDE                          , 0, { gCardEffectSpecialSummonDamage_08068990          , NULL                                             , NULL                                             , gCardEffectSpecialSummonDamage_08057138          , NULL                                              } },
    { KONAMI_SKULL_MARK_LADYBUG                         , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_PINCH_HOPPER                               , 0, { gCardEffectSpecialSummon_080659E8                , NULL                                             , gCardEffectSpecialSummon_0805CBCC                , gCardEffectSpecialSummon_08059448                , NULL                                              } },
    { KONAMI_SWORD_OF_DEEP_SEATED                       , 0, { gCardEffectSendToGYGraveyard_0806683C            , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_THE_UNHAPPY_MAIDEN                         , 0, { gCardEffectSendToGYGraveyard_0806A520            , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_LAST_WILL                                  , 0, { gCardEffectSpecialSummonSendToGY_0806A700        , NULL                                             , gCardEffectSpecialSummonSendToGY_0805D918        , NULL                                             , NULL                                              } },
    { KONAMI_GIANT_RAT                                  , 0, { gCardEffectSpecialSummonSendToGY_0806B030        , NULL                                             , NULL                                             , gCardEffectSpecialSummonGraveyard_08057294       , NULL                                              } },
    { KONAMI_UFO_TURTLE                                 , 0, { gCardEffectSpecialSummonSendToGY_0806B030        , NULL                                             , NULL                                             , gCardEffectSpecialSummonGraveyard_08057294       , NULL                                              } },
    { KONAMI_GIANT_GERM                                 , 0, { gCardEffectSpecialSummonSendToGY_0806B31C        , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_NIMBLE_MOMONGA                             , 0, { gCardEffectSpecialSummonSendToGY_0806B31C        , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_SPEAR_CRETIN                               , 0, { gCardEffectSpecialSummonSendToGY_0806B53C        , NULL                                             , NULL                                             , gCardEffectSendToGYGraveyard_08056658            , gCardEffectSpecialSummonChangePosition_08083170   } },
    { KONAMI_SHINING_ANGEL                              , 0, { gCardEffectSpecialSummonSendToGY_0806B030        , NULL                                             , NULL                                             , gCardEffectSpecialSummonGraveyard_08057294       , NULL                                              } },
    { KONAMI_MOTHER_GRIZZLY                             , 0, { gCardEffectSpecialSummonSendToGY_0806B030        , NULL                                             , NULL                                             , gCardEffectSpecialSummonGraveyard_08057294       , NULL                                              } },
    { KONAMI_FLYING_KAMAKIRI                            , 0, { gCardEffectSpecialSummonSendToGY_0806B030        , NULL                                             , NULL                                             , gCardEffectSpecialSummonGraveyard_08057294       , NULL                                              } },
    { KONAMI_MYSTIC_TOMATO                              , 0, { gCardEffectSpecialSummonSendToGY_0806B030        , NULL                                             , NULL                                             , gCardEffectSpecialSummonGraveyard_08057294       , NULL                                              } },
    { KONAMI_BIRDFACE                                   , 0, { gCardEffectSearchSpecialSummon_08068684          , NULL                                             , NULL                                             , gCardEffectSpecialSummonGraveyard_08057294       , NULL                                              } },
    { KONAMI_KRYUEL                                     , 0, { gCardEffectSendToGYDestroy_0806D3D8              , gCardEffectDestroy_0804F550                      , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_SERPENTINE_PRINCESS                        , 0, { gCardEffectSpecialSummonSendToGY_0806E898        , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_TWIN_HEADED_BEHEMOTH                       , 0, { gCardEffectSpecialSummonSendToGY_0806D4A4        , NULL                                             , gCardEffectSpecialSummonSendToGY_0805E3A8        , NULL                                             , NULL                                              } },
    { KONAMI_SLATE_WARRIOR                              , 0, { gCardEffectDestroyFlip_08074F74                  , gCardEffectDestroyFlip_0805214C                  , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_ELECTROMAGNETIC_BAGWORM_NONE               , 0, { gCardEffectDestroyFlip_08074F74                  , gCardEffectDestroyFlip_0805214C                  , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_RIGRAS_LEEVER                              , 0, { gCardEffectDestroyFlip_08074F74                  , gCardEffectDestroyFlip_0805214C                  , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_REVIVAL_JAM                                , 0, { gCardEffectSpecialSummonSendToGY_0806D810        , NULL                                             , gCardEffectSpecialSummonSendToGY_0805E518        , gCardEffectSpecialSummonSendToGY_08057430        , NULL                                              } },
    { KONAMI_ARCHFIEND_OF_GILFER                        , 0, { gCardEffectReduceATKEquip_0806D8C0               , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectSendToGYReduceATK_08083560             } },
    { KONAMI_MASKED_BEAST_DES_GARDIUS_NONE              , 0, { gCardEffectSpecialSummonSendToGY_0806D960        , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_RETURN_OF_THE_DOOMED                       , 0, { gCardEffectDiscardReturnToHand_0806E118          , NULL                                             , gCardEffectGraveyard_0805C2F0                    , NULL                                             , NULL                                              } },
    { KONAMI_DIMENSIONHOLE                              , 0, { gCardEffectBanishStandbyPhase_0806EA00           , NULL                                             , gCardEffectBanishStandbyPhase_0805E958           , NULL                                             , gCardEffectBanishStandbyPhase_08083824            } },
    { KONAMI_RED_MOON_BABY                              , 0, { gCardEffectSpecialSummonSendToGY_0806EDD4        , NULL                                             , gCardEffectSpecialSummonSendToGY_0805EA3C        , NULL                                             , gCardEffectSpecialSummonSendToGY_0808386C         } },
    { KONAMI_LADY_PANTHER_NONE                          , 0, { gCardEffectTributeDestroy_0806F390               , NULL                                             , gCardEffectTributeDestroy_0805ECA8               , gCardEffectTributeDestroy_08057538               , NULL                                              } },
    { KONAMI_CRIMSON_SENTRY_NONE                        , 0, { gCardEffectTributeDestroy_0806F390               , NULL                                             , gCardEffectTributeDestroy_0805ECA8               , gCardEffectTributeDestroy_08057538               , NULL                                              } },
    { KONAMI_FAIRY_GUARDIAN_NONE                        , 0, { gCardEffectTributeDestroy_0806F390               , NULL                                             , gCardEffectTributeDestroy_0805ECA8               , gCardEffectTributeDestroy_08057538               , NULL                                              } },
    { KONAMI_THE_FORGIVING_MAIDEN                       , 0, { gCardEffectTributeDestroy_0806F390               , NULL                                             , gCardEffectTributeDestroy_0805ECA8               , gCardEffectTributeDestroy_08057538               , NULL                                              } },
    { KONAMI_MARIE_THE_FALLEN_ONE                       , 0, { gCardEffectGainLPGraveyard_0806F5A4              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DARK_NECROFEAR                             , 0, { gCardEffectSpecialSummonDestroy_0806F788         , gCardEffectEquipBoostATK_0805000C                , gCardEffectSpecialSummonDestroy_0805EE60         , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_DARK_MAGICIAN_S_TOME_OF_BLACK_MAGIC        , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_AMAZONESS_CHAIN_MASTER                     , 0, { gCardEffectSearchSendToGY_0807104C               , NULL                                             , gCardEffectDamageDiscard_0805CD88                , gCardEffectDamageGraveyard_080565E8              , NULL                                              } },
    { KONAMI_TROOP_DRAGON                               , 0, { gCardEffectSpecialSummonSendToGY_0806B030        , NULL                                             , NULL                                             , gCardEffectSpecialSummonSendToGY_08057CF4        , NULL                                              } },
    { KONAMI_SUPER_REJUVENATION                         , 0, { gCardEffectDrawDiscard_08071604                  , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_KELDO                                      , 0, { gCardEffectSendToGYDestroy_08071654              , NULL                                             , gCardEffectGraveyard_0805F068                    , NULL                                             , gCardEffectGraveyard_08082F44                     } },
    { KONAMI_KAISER_GLIDER                              , 0, { gCardEffectReturnToHand_0806734C                 , gCardEffectReturnToHandFlip_080509FC             , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_ZOLGA                                      , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_AGIDO                                      , 0, { gCardEffectSpecialSummonSendToGY_0807190C        , NULL                                             , NULL                                             , gCardEffectSpecialSummonSendToGY_08057CF4        , NULL                                              } },
    { KONAMI_MAHARAGHI                                  , 0, { gCardEffectDrawSpecialSummon_08071BDC            , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_THE_SECRET_OF_THE_BANDIT                   , 0, { gCardEffectDiscardDestroy_080665A4               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_VAMPIRE_LORD                               , 0, { gCardEffectSendToGYDamage_080726F4               , NULL                                             , gCardEffectSpecialSummonDestroySpellTrap_0805F968, NULL                                             , NULL                                              } },
    { KONAMI_PYRAMID_TURTLE                             , 0, { gCardEffectSpecialSummonSendToGY_0806B030        , NULL                                             , NULL                                             , gCardEffectSpecialSummonGraveyard_08057294       , NULL                                              } },
    { KONAMI_STATUE_OF_THE_WICKED                       , 0, { gCardEffectSpecialSummonDestroy_08072EB4         , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DARK_COFFIN                                , 0, { gCardEffectDiscardSendToGY_08072FD4              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_NEWDORIA                                   , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroy_08050994                      , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_LORD_POISON                                , 0, { gCardEffectSpecialSummonGraveyard_080687A8       , NULL                                             , NULL                                             , gCardEffectSpecialSummonSendToGY_08058444        , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_HELPOEMER                                  , 0, { gCardEffectSpecialSummonDiscard_08073428         , NULL                                             , gCardEffectSpecialSummonDiscard_0805FE38         , gCardEffectSpecialSummonBanish_0805845C          , NULL                                              } },
    { KONAMI_YOMI_SHIP                                  , 0, { gCardEffectSendToGYDestroy_08073A5C              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_CHARM_OF_SHABTI                            , 0, { gCardEffectDiscardEndPhase_08070D00              , NULL                                             , NULL                                             , gCardEffectDiscardSearch_0805652C                , NULL                                              } },
    { KONAMI_INTERDIMENSIONAL_MATTER_TRANSPORTER        , 0, { gCardEffectBanishEndPhase_080744F8               , NULL                                             , gCardEffectBanishEndPhase_08060270               , NULL                                             , gCardEffectBanishEndPhase_08084418                } },
    { KONAMI_GOBLIN_ZOMBIE                              , 0, { gCardEffectSearchSendToGY_080661FC               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_APPRENTICE_MAGICIAN                        , 0, { gCardEffectSpecialSummonSendToGY_0806B030        , NULL                                             , NULL                                             , gCardEffectSpecialSummonGraveyard_08057294       , NULL                                              } },
    { KONAMI_GRANADORA                                  , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DARK_FLARE_KNIGHT                          , 0, { gCardEffectSpecialSummonGraveyard_08066858       , NULL                                             , NULL                                             , gCardEffectSpecialSummonSendToGY_08057CF4        , NULL                                              } },
    { KONAMI_GUARDIAN_TRYCE                             , 0, { gCardEffectSpecialSummonSendToGY_080757F0        , NULL                                             , gCardEffectSpecialSummon_0805C218                , NULL                                             , NULL                                              } },
    { KONAMI_DESPAIR_FROM_THE_DARK                      , 0, { gCardEffectSpecialSummonGraveyard_08075874       , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_FEAR_FROM_THE_DARK                         , 0, { gCardEffectSpecialSummonGraveyard_08075874       , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_BUTTERFLY_DAGGER_ELMA                      , 0, { gCardEffectGraveyardSearch_08075A7C              , NULL                                             , NULL                                             , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_OUTSTANDING_DOG_MARRON                     , 0, { gCardEffectSendToGYGraveyard_0807629C            , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_DESROOK_ARCHFIEND                          , 0, { gCardEffectSpecialSummonNegate_080762C8          , NULL                                             , gCardEffectSpecialSummonNegate_08060C94          , gCardEffectSpecialSummonNegate_08058794          , gCardEffectSpecialSummonNegate_080845AC           } },
    { KONAMI_STRIKE_NINJA                               , 0, { gCardEffectBanishEndPhase_080744F8               , NULL                                             , gCardEffectBanishEndPhase_08060270               , NULL                                             , gCardEffectBanishEndPhase_08084418                } },
    { KONAMI_D_D_SCOUT_PLANE                            , 0, { gCardEffectSpecialSummonBanish_08076B1C          , NULL                                             , gCardEffectSpecialSummonBanish_08060EE0          , gCardEffectSpecialSummonBanish_0805845C          , NULL                                              } },
    { KONAMI_GIGANTES                                   , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroySpellTrapDestroyAll_08051998   , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_SILPHEED                                   , 0, { gCardEffectDiscardDestroy_080665A4               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_FUHMA_SHURIKEN                             , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_BURNING_ALGAE                              , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_THE_THING_IN_THE_CRATER                    , 0, { gCardEffectSpecialSummon_080659E8                , NULL                                             , gCardEffectSpecialSummon_0805CBCC                , gCardEffectSpecialSummon_08059448                , NULL                                              } },
    { KONAMI_MANTICORE_OF_DARKNESS                      , 0, { gCardEffectSpecialSummonGraveyard_08075874       , NULL                                             , gCardEffectSpecialSummonSendToGY_08061434        , gCardEffectSpecialSummonSendToGY_08058A98        , NULL                                              } },
    { KONAMI_SKULL_ZOMA                                 , 0, { gCardEffectSpecialSummonDestroy_08077D80         , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_ATOMIC_FIREFLY                             , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_RETURN_ZOMBIE                              , 0, { gCardEffectGraveyardSearch_08075A7C              , NULL                                             , gCardEffectDamageSearch_08063850                 , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_ELEPHANT_STATUE_OF_BLESSING                , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_ELEPHANT_STATUE_OF_DISASTER                , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_EMISSARY_OF_THE_AFTERLIFE                  , 0, { gCardEffectSearchSendToGY_08078A90               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_REGENERATING_MUMMY                         , 0, { gCardEffectReturnToHandSendToGY_08078BF8         , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_NIGHT_ASSAILANT                            , 0, { gCardEffectGraveyardSearch_08066530              , NULL                                             , NULL                                             , NULL                                             , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_KING_OF_THE_SWAMP                          , 0, { gCardEffectSearchDiscard_0806A424                , NULL                                             , gCardEffectGraveyardSendToGY_08061D40            , gCardEffectDiscardSearch_0805652C                , NULL                                              } },
    { KONAMI_7                                          , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_FAMILIAR_KNIGHT                            , 0, { gCardEffectSpecialSummonSendToGY_08079A1C        , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_PETEN_THE_DARK_CLOWN                       , 0, { gCardEffectSpecialSummonGraveyard_08066858       , NULL                                             , NULL                                             , gCardEffectSpecialSummonSendToGY_08059110        , NULL                                              } },
    { KONAMI_THEINEN_THE_GREAT_SPHINX                   , 0, { gCardEffectSpecialSummonGraveyard_08066858       , NULL                                             , gCardEffectSpecialSummon_0805C218                , gCardEffectDamageGraveyard_080565E8              , gCardEffectSpecialSummonDestroy_08084738          } },
    { KONAMI_WATAPON                                    , 0, { gCardEffectSearchSpecialSummon_08079E60          , NULL                                             , gCardEffectSpecialSummon_0805C218                , gCardEffectGraveyardSpecialSummon_080563CC       , gCardEffectSpecialSummonDestroy_08084738          } },
    { KONAMI_DARK_MIMIC_LV3                             , 0, { gCardEffectDraw_080656E0                         , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_HOWLING_INSECT                             , 0, { gCardEffectSpecialSummonSendToGY_0806B030        , NULL                                             , NULL                                             , gCardEffectSpecialSummonGraveyard_08057294       , NULL                                              } },
    { KONAMI_MASKED_DRAGON                              , 0, { gCardEffectSpecialSummonSendToGY_0806B030        , NULL                                             , NULL                                             , gCardEffectSpecialSummonGraveyard_08057294       , NULL                                              } },
    { KONAMI_ROC_FROM_THE_VALLEY_OF_HAZE                , 0, { gCardEffectSendToGYGraveyard_0807629C            , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_FOX_FIRE                                   , 0, { gCardEffectSpecialSummonGraveyard_08075874       , NULL                                             , gCardEffectSpecialSummonDestroy_0806285C         , NULL                                             , NULL                                              } },
    { KONAMI_MOKEY_MOKEY_KING                           , 0, { gCardEffectSpecialSummonBanish_08079944          , NULL                                             , NULL                                             , gCardEffectSpecialSummonGraveyard_08057294       , NULL                                              } },
    { KONAMI_NECKLACE_OF_COMMAND                        , 0, { gCardEffectDiscardSendToGY_0807AEF4              , NULL                                             , gCardEffectDiscardSendToGY_080628F0              , gCardEffectDestroyDamage_08056BC4                , NULL                                              } },
    { KONAMI_FLINT                                      , 0, { gCardEffectReduceATKEquip_0806D8C0               , gCardEffectEquipBoostATK_0805000C                , NULL                                             , NULL                                             , gCardEffectDestroyReduceATK_08084D08              } },
    { KONAMI_SACRED_PHOENIX_OF_NEPHTHYS                 , 0, { gCardEffectSpecialSummonGraveyard_08075874       , NULL                                             , gCardEffectSpecialSummonDestroySpellTrap_0805F968, NULL                                             , NULL                                              } },
    { KONAMI_HYENA                                      , 0, { gCardEffectSpecialSummonSendToGY_0807B4D4        , NULL                                             , NULL                                             , gCardEffectSpecialSummonGraveyard_08057294       , NULL                                              } },
    { KONAMI_MECHA_DOG_MARRON                           , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_CURSE_OF_VAMPIRE                           , 0, { gCardEffectSpecialSummonSendToGY_0807BDF8        , NULL                                             , gCardEffectSpecialSummonSendToGY_0805E518        , gCardEffectSpecialSummonSendToGY_08057430        , NULL                                              } },
    { KONAMI_WINGED_KURIBOH                             , 0, { gCardEffectDiscardEndPhase_08070D00              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MINE_GOLEM                                 , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_D_D_SURVIVOR                               , 0, { gCardEffectSpecialSummonBanish_08076B1C          , NULL                                             , gCardEffectSpecialSummonBanish_08063194          , NULL                                             , NULL                                              } },
    { KONAMI_KING_OF_THE_SKULL_SERVANTS                 , 0, { gCardEffectSpecialSummonGraveyard_08075874       , NULL                                             , gCardEffectSpecialSummonBanish_08063254          , gCardEffectSpecialSummonBanish_08059B4C          , NULL                                              } },
    { KONAMI_NITRO_UNIT                                 , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_UFOROID                                    , 0, { gCardEffectSpecialSummonSendToGY_0806B030        , NULL                                             , NULL                                             , gCardEffectSpecialSummonGraveyard_08057294       , NULL                                              } },
    { KONAMI_WROUGHTWEILER                              , 0, { gCardEffectGraveyardSearch_08066530              , NULL                                             , NULL                                             , NULL                                             , gCardEffectSearchGraveyard_08084E70               } },
    { KONAMI_DARK_RULER_VANDALGYON                      , 0, { gCardEffectSpecialSummonDestroySpellTrap_0807C750, NULL                                             , gCardEffectSpecialSummonDestroySpellTrap_080636CC, gCardEffectSpecialSummonDestroy_08059FC4         , gCardEffectSpecialSummonDestroy_08084738          } },
    { KONAMI_GIANT_KOZAKY                               , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_T_A_D_P_O_L_E                              , 0, { gCardEffectSearchGraveyard_08066EE0              , NULL                                             , gCardEffectSearchGraveyard_0805C43C              , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_POISON_DRAW_FROG                           , 0, { gCardEffectDraw_080656E0                         , NULL                                             , NULL                                             , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_WARRIOR_LADY_OF_THE_WASTELAND              , 0, { gCardEffectSpecialSummonSendToGY_0806B030        , NULL                                             , NULL                                             , gCardEffectSpecialSummonGraveyard_08057294       , NULL                                              } },
    { KONAMI_DIVINE_SWORD_PHOENIX_BLADE                 , 0, { gCardEffectGraveyardSearch_08075A7C              , NULL                                             , gCardEffectSearchBoostATK_08063BA4               , gCardEffectGraveyardSearch_08059F2C              , NULL                                              } },
    { KONAMI_OJAMAGIC                                   , 0, { gCardEffectSearchSendToGY_0807D3E0               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_OXYGEDDON                                  , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectSendToGYDestroy_08063C6C              , NULL                                             , NULL                                              } },
    { KONAMI_WATER_DRAGON                               , 0, { gCardEffectSpecialSummonRevive_08078808          , NULL                                             , NULL                                             , gCardEffectSpecialSummonDestroy_08059FC4         , gCardEffectSpecialSummonSendToGY_08085034         } },
    { KONAMI_BEIIGE_VANGUARD_OF_DARK_WORLD              , 0, { gCardEffectSpecialSummonGraveyard_08075874       , NULL                                             , gCardEffectSpecialSummon_0805C218                , NULL                                             , NULL                                              } },
    { KONAMI_BROWW_HUNTSMAN_OF_DARK_WORLD               , 0, { gCardEffectDraw_080656E0                         , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_SILLVA_WARLORD_OF_DARK_WORLD               , 0, { gCardEffectSpecialSummonDiscard_0807D7E8         , NULL                                             , gCardEffectSpecialSummon_0805C218                , NULL                                             , NULL                                              } },
    { KONAMI_GOLDD_WU_LORD_OF_DARK_WORLD                , 0, { gCardEffectSpecialSummonDiscard_0807D92C         , gCardEffectSpecialSummonDestroy_08054FBC         , gCardEffectSpecialSummonDiscard_08063E80         , NULL                                             , gCardEffectSpecialSummonDiscard_080850F0          } },
    { KONAMI_SCARR_SCOUT_OF_DARK_WORLD                  , 0, { gCardEffectSearchSendToGY_080661FC               , NULL                                             , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_MAGICAL_BLAST                              , 0, { gCardEffectSearchDamage_0807DCA4                 , NULL                                             , NULL                                             , gCardEffectGraveyardSpecialSummon_080563CC       , NULL                                              } },
    { KONAMI_CYCLONE_BOOMERANG                          , 0, { gCardEffectDestroyGainLP_08070EF4                , gCardEffectDestroySpellTrapDestroyAll_08051998   , NULL                                             , NULL                                             , NULL                                              } },
    { KONAMI_GOKIPON                                    , 0, { gCardEffectSearchSendToGY_080661FC               , NULL                                             , NULL                                             , gCardEffectSpecialSummonGraveyard_08057294       , NULL                                              } },
    { KONAMI_TREEBORN_FROG                              , 0, { gCardEffectSpecialSummonGraveyard_08075874       , NULL                                             , gCardEffectSpecialSummonGraveyard_080643E0       , gCardEffectGraveyardStandbyPhase_080566CC        , NULL                                              } },
    { KONAMI_SAND_MOTH                                  , 0, { gCardEffectSpecialSummonGraveyard_08075874       , NULL                                             , gCardEffectSpecialSummonSendToGY_0805CD6C        , NULL                                             , NULL                                              } },
    { KONAMI_HELIOS_DUO_MEGISTE                         , 0, { gCardEffectSpecialSummonGraveyard_08075874       , NULL                                             , gCardEffectSpecialSummonDestroy_0806285C         , NULL                                             , NULL                                              } },
    { KONAMI_HELIOS_TRIS_MEGISTE                        , 0, { gCardEffectSpecialSummonGraveyard_08075874       , NULL                                             , gCardEffectSpecialSummonDestroy_0806285C         , NULL                                             , NULL                                              } },
    { KONAMI_DANDYLION                                  , 0, { gCardEffectSpecialSummonTribute_0806E308         , NULL                                             , NULL                                             , gCardEffectSpecialSummonSendToGY_0805A204        , NULL                                              } },
};

// gEffects3  (184 entries)
const struct CardEffects gCardEffects3[] = {
//  KonamiId                                             pad  eff1  eff2  eff3  eff4  eff5
    { KONAMI_TIME_WIZARD                                , 0, { gCardEffectDestroyAllDamage_08065D78             , gCardEffectDestroy_080507AC                      , gCardEffectDestroyRNG_0805C1C0                   , gCardEffectDestroySpecialSummon_080563A4         , NULL                                              } },
    { KONAMI_CATAPULT_TURTLE                            , 0, { gCardEffectDamageGraveyard_080655EC              , gCardEffectDamageTribute_080500AC                , NULL                                             , gCardEffectTributeSpecialSummon_08056930         , NULL                                              } },
    { KONAMI_THE_LITTLE_SWORDSMAN_OF_AILE               , 0, { gCardEffectBoostATKBoostDEF_0806678C             , NULL                                             , gCardEffectBoostATKTribute_0805C468              , gCardEffectBoostATKTribute_08056578              , NULL                                              } },
    { KONAMI_SANGA_OF_THE_THUNDER                       , 0, { gCardEffectUnknown_08066D04                      , NULL                                             , gCardEffectUnknown_0805C528                      , gCardEffectUnknown_08056614                      , gCardEffectNegateGainLP_08081DCC                  } },
    { KONAMI_KAZEJIN                                    , 0, { gCardEffectUnknown_08066D04                      , NULL                                             , gCardEffectUnknown_0805C528                      , gCardEffectUnknown_08056614                      , gCardEffectNegateGainLP_08081DCC                  } },
    { KONAMI_SUIJIN                                     , 0, { gCardEffectUnknown_08066D04                      , NULL                                             , gCardEffectUnknown_0805C528                      , gCardEffectUnknown_08056614                      , gCardEffectNegateGainLP_08081DCC                  } },
    { KONAMI_MONSTER_EYE                                , 0, { gCardEffectReturnToHandGraveyard_08066D68        , NULL                                             , gCardEffectGraveyard_0805C2F0                    , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_CYBER_STEIN                                , 0, { gCardEffectSpecialSummonFusion_08066E0C          , NULL                                             , gCardEffectSpecialSummonGraveyard_0805C248       , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_GODDESS_OF_WHIM                            , 0, { gCardEffectRNG_080670A0                          , NULL                                             , gCardEffectDestroyRNG_0805C1C0                   , gCardEffectDestroySpecialSummon_080563A4         , NULL                                              } },
    { KONAMI_GALE_DOGRA_NONE                            , 0, { gCardEffectSendToGYDamage_080672A4               , NULL                                             , gCardEffectSendToGYDamage_0805C608               , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_CANNON_SOLDIER                             , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectTributeDamage_0805C3EC                , gCardEffectTribute_080567A0                      , NULL                                              } },
    { KONAMI_MAGICAL_LABYRINTH                          , 0, { gCardEffectSpecialSummonEquip_08067B5C           , NULL                                             , gCardEffectSpecialSummonEquip_0805C724           , gCardEffectSpecialSummonEquip_080568D0           , NULL                                              } },
    { KONAMI_RELINQUISHED                               , 0, { gCardEffectDestroyEquip_08068350                 , gCardEffectTakeControlDestroy_0804F618           , gCardEffectDestroyEquip_0805CA50                 , gCardEffectDestroySpecialSummon_080563A4         , gCardEffectDestroyPreventAttack_080824A4          } },
    { KONAMI_THOUSAND_EYES_RESTRICT                     , 0, { gCardEffectDestroyEquip_08068350                 , gCardEffectTakeControlDestroy_0804F618           , gCardEffectDestroyEquip_0805CA50                 , gCardEffectDestroySpecialSummon_080563A4         , gCardEffectDestroyPreventAttack_080824A4          } },
    { KONAMI_BARREL_DRAGON                              , 0, { gCardEffectDestroyRNG_08068618                   , gCardEffectDestroy_0804F550                      , gCardEffectDestroyRNG_0805C1C0                   , gCardEffectDestroySpecialSummon_080563A4         , gCardEffectDestroy_0808198C                       } },
    { KONAMI_HANNIBAL_NECROMANCER                       , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroyCounter_08051898               , gCardEffectDestroyCounter_08060788               , gCardEffectCounterDestroy_080585C4               , gCardEffectDestroy_0808198C                       } },
    { KONAMI_GEAR_GOLEM_THE_MOVING_FORTRESS             , 0, { gCardEffectBoostATKBoostDEF_0806678C             , NULL                                             , gCardEffectDamageDirectAttack_0805CB1C           , gCardEffectDamageChangePosition_08058778         , NULL                                              } },
    { KONAMI_ULTIMATE_OFFERING                          , 0, { gCardEffectUnknown_08069E40                      , NULL                                             , gCardEffectUnknown_0805D020                      , gCardEffectNegateDiscard_0805715C                , NULL                                              } },
    { KONAMI_KARATE_MAN                                 , 0, { gCardEffectBoostATKBoostDEF_0806678C             , NULL                                             , gCardEffectDestroyRNG_0805C1C0                   , gCardEffectDestroySpecialSummon_080563A4         , NULL                                              } },
    { KONAMI_OBELISK_THE_TORMENTOR_NONE                 , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroy_080507AC                      , gCardEffectTribute_0805ED2C                      , gCardEffectTribute_0805756C                      , NULL                                              } },
    { KONAMI_VALKYRION_THE_MAGNA_WARRIOR                , 0, { gCardEffectSpecialSummonRevive_0806D124          , NULL                                             , gCardEffectSpecialSummonRevive_0805E284          , gCardEffectTributeSpecialSummon_08057344         , gCardEffectSpecialSummonRevive_080833BC           } },
    { KONAMI_INJECTION_FAIRY_LILY                       , 0, { gCardEffectBoostATKBoostDEF_0806D514             , NULL                                             , gCardEffectBoostATKDamage_0805E3EC               , gCardEffectBoostATKDamage_0805735C               , NULL                                              } },
    { KONAMI_WOODLAND_SPRITE                            , 0, { gCardEffectDamageGraveyard_080655EC              , gCardEffectSendToGYDamage_08052020               , gCardEffectGraveyardSendToGY_08061D40            , gCardEffectSendToGYGraveyard_0805738C            , NULL                                              } },
    { KONAMI_JAM_DEFENDER                               , 0, { gCardEffectUnknown_0806E62C                      , gCardEffectUnknown_08052790                      , gCardEffectSpecialSummonSendToGY_0805E790        , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_TYPE_ZERO_MAGIC_CRUSHER                    , 0, { gCardEffectDiscardDamage_0806EF88                , NULL                                             , gCardEffectDiscardDamage_0805EBC4                , gCardEffectDiscardDamage_08057470                , NULL                                              } },
    { KONAMI_LADY_PANTHER_NONE                          , 0, { gCardEffectTributeDestroy_0806F390               , NULL                                             , gCardEffectTributeDestroy_0805ECA8               , gCardEffectTributeDestroy_08057538               , NULL                                              } },
    { KONAMI_AMAZON_ARCHER                              , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectTribute_0805ED2C                      , gCardEffectTribute_0805756C                      , NULL                                              } },
    { KONAMI_CRIMSON_SENTRY_NONE                        , 0, { gCardEffectTributeDestroy_0806F390               , NULL                                             , gCardEffectTributeDestroy_0805ECA8               , gCardEffectTributeDestroy_08057538               , NULL                                              } },
    { KONAMI_FAIRY_GUARDIAN_NONE                        , 0, { gCardEffectTributeDestroy_0806F390               , NULL                                             , gCardEffectTributeDestroy_0805ECA8               , gCardEffectTributeDestroy_08057538               , NULL                                              } },
    { KONAMI_HYSTERIC_FAIRY                             , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectTribute_0805ED2C                      , gCardEffectTribute_0805756C                      , NULL                                              } },
    { KONAMI_THE_FORGIVING_MAIDEN                       , 0, { gCardEffectTributeDestroy_0806F390               , NULL                                             , gCardEffectTributeDestroy_0805ECA8               , gCardEffectTributeDestroy_08057538               , NULL                                              } },
    { KONAMI_CATHEDRAL_OF_NOBLES                        , 0, { gCardEffectSearchSpecialSummon_0806FDEC          , gCardEffectSpecialSummonSendToGY_08052A20        , gCardEffectSearchSpecialSummon_0805EEB8          , gCardEffectSearchSpecialSummon_080575B0          , NULL                                              } },
    { KONAMI_ANCIENT_LAMP                               , 0, { gCardEffectSpecialSummon_080659E8                , NULL                                             , gCardEffectSpecialSummonChangePosition_0805C294  , NULL                                             , NULL                                              } },
    { KONAMI_JOWGEN_THE_SPIRITUALIST                    , 0, { gCardEffectDestroy_08064660                      , gCardEffectSpecialSummonDiscard_08053034         , gCardEffectSpecialSummonDiscard_0805EF4C         , gCardEffectSpecialSummonDiscard_08057660         , NULL                                              } },
    { KONAMI_BAZOO_THE_SOUL_EATER                       , 0, { gCardEffectBanishBoostATK_08070478               , NULL                                             , gCardEffectBanishBoostATK_0805EFB8               , gCardEffectBanishBoostATK_080576B0               , NULL                                              } },
    { KONAMI_MARYOKUTAI                                 , 0, { gCardEffectNegateDestroy_08065698                , NULL                                             , gCardEffectNegateDestroy_0805D118                , gCardEffectTributeSpecialSummon_08057344         , NULL                                              } },
    { KONAMI_SKULL_LAIR                                 , 0, { gCardEffectBanishDestroy_0807097C                , gCardEffectBanishDestroy_08052F10                , gCardEffectBanishDestroy_0805F0D8                , gCardEffectBanishDestroy_08057874                , NULL                                              } },
    { KONAMI_FUSION_GATE                                , 0, { gCardEffectSpecialSummonSendToGY_0807FDE8        , NULL                                             , gCardEffectSpecialSummonGraveyard_0807FD84       , NULL                                             , NULL                                              } },
    { KONAMI_DARK_BALTER_THE_TERRIBLE                   , 0, { gCardEffectFusionSummonNegate_08071170           , NULL                                             , gCardEffectNegateDestroy_0805D118                , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_POSSESSED_DARK_SOUL                        , 0, { gCardEffectTakeControlTribute_08071210           , gCardEffectTakeControlTribute_08053178           , gCardEffectTributeTakeControl_0805F3BC           , gCardEffectTributeSpecialSummon_08057344         , NULL                                              } },
    { KONAMI_WINGED_MINION                              , 0, { gCardEffectSpecialSummonBoostATK_08073760        , gCardEffectDestroyEndPhase_080502B0              , gCardEffectTributeTakeControl_0805F3BC           , gCardEffectTributeSpecialSummon_08057344         , gCardEffectDestroy_0808198C                       } },
    { KONAMI_THROWSTONE_UNIT                            , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroyTribute_08053704               , NULL                                             , gCardEffectTributeSpecialSummon_08056930         , gCardEffectDestroy_0808198C                       } },
    { KONAMI_RYU_SENSHI                                 , 0, { gCardEffectFusionSummonNegate_0807136C           , NULL                                             , gCardEffectNegateDestroy_0805D118                , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_EXILED_FORCE                               , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroy_08053760                      , gCardEffectTributeTakeControl_0805F3BC           , gCardEffectTributeSpecialSummon_08057344         , gCardEffectDestroy_0808198C                       } },
    { KONAMI_SPIRIT_RYU                                 , 0, { gCardEffectBoostATKBoostDEF_0806678C             , NULL                                             , gCardEffectDiscardBoostATK_0805F49C              , gCardEffectDiscardGraveyard_08058E44             , NULL                                              } },
    { KONAMI_GRAY_WING                                  , 0, { gCardEffectBoostATKBoostDEF_0806678C             , NULL                                             , gCardEffectDiscardBattlePhase_0805F510           , gCardEffectDiscardSpecialSummon_08059BE0         , NULL                                              } },
    { KONAMI_THE_DRAGON_S_BEAD                          , 0, { gCardEffectNegateDiscard_080714AC                , NULL                                             , gCardEffectNegateDiscard_0805F550                , gCardEffectNegateDiscard_0805715C                , NULL                                              } },
    { KONAMI_SUPER_ROBOLADY                             , 0, { gCardEffectSpecialSummonBoostATK_08071E98        , NULL                                             , gCardEffectSpecialSummonBoostATK_0805F7F8        , NULL                                             , NULL                                              } },
    { KONAMI_SUPER_ROBOYAROU                            , 0, { gCardEffectSpecialSummonBoostATK_08071E98        , NULL                                             , gCardEffectSpecialSummonBoostATK_0805F7F8        , NULL                                             , NULL                                              } },
    { KONAMI_ROYAL_KEEPER                               , 0, { gCardEffectChangePosition_080728D4               , NULL                                             , gCardEffectChangePosition_0805FA24               , gCardEffectChangePosition_08057FCC               , NULL                                              } },
    { KONAMI_WANDERING_MUMMY                            , 0, { gCardEffectChangePosition_08072890               , NULL                                             , gCardEffectChangePosition_0805FA24               , gCardEffectChangePosition_08057FCC               , NULL                                              } },
    { KONAMI_GREAT_DEZARD                               , 0, { gCardEffectSpecialSummonGraveyard_08066858       , NULL                                             , gCardEffectSpecialSummonNegate_0805F9E4          , gCardEffectTributeSpecialSummon_08057344         , NULL                                              } },
    { KONAMI_SWARM_OF_SCARABS                           , 0, { gCardEffectChangePosition_080728D4               , NULL                                             , gCardEffectChangePosition_0805FA24               , gCardEffectChangePosition_08057FCC               , NULL                                              } },
    { KONAMI_SWARM_OF_LOCUSTS                           , 0, { gCardEffectChangePosition_080728D4               , NULL                                             , gCardEffectChangePosition_0805FA24               , gCardEffectChangePosition_08057FCC               , NULL                                              } },
    { KONAMI_GIANT_AXE_MUMMY                            , 0, { gCardEffectChangePosition_080728D4               , NULL                                             , gCardEffectChangePosition_0805FA24               , gCardEffectChangePosition_08057FCC               , NULL                                              } },
    { KONAMI_8_CLAWS_SCORPION_NONE                      , 0, { gCardEffectChangePosition_080728D4               , NULL                                             , gCardEffectChangePosition_0805FA24               , gCardEffectChangePosition_08057FCC               , NULL                                              } },
    { KONAMI_GUARDIAN_SPHINX                            , 0, { gCardEffectChangePosition_080728D4               , NULL                                             , gCardEffectChangePosition_0805FA24               , gCardEffectChangePosition_08057FCC               , NULL                                              } },
    { KONAMI_DES_LACOODA                                , 0, { gCardEffectChangePosition_080728D4               , NULL                                             , gCardEffectChangePosition_0805FA24               , gCardEffectChangePosition_08057FCC               , NULL                                              } },
    { KONAMI_FUSHIOH_RICHIE                             , 0, { gCardEffectChangePosition_080728D4               , NULL                                             , gCardEffectChangePosition_0805FA24               , gCardEffectChangePosition_08057FCC               , NULL                                              } },
    { KONAMI_COBRAMAN_SAKUZY                            , 0, { gCardEffectChangePosition_080728D4               , NULL                                             , gCardEffectChangePosition_0805FA24               , gCardEffectChangePosition_08057FCC               , NULL                                              } },
    { KONAMI_CALL_OF_THE_MUMMY                          , 0, { gCardEffectSpecialSummon_08072CE4                , NULL                                             , gCardEffectSpecialSummon_0805FB3C                , gCardEffectDestroySpecialSummon_080563A4         , NULL                                              } },
    { KONAMI_TOON_DEFENSE                               , 0, { gCardEffectDirectAttack_080732FC                 , NULL                                             , gCardEffectDirectAttack_0805FC94                 , NULL                                             , NULL                                              } },
    { KONAMI_TOON_CANNON_SOLDIER                        , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectTributeDamage_0805C3EC                , gCardEffectTribute_080567A0                      , NULL                                              } },
    { KONAMI_GRAVEKEEPER_S_CANNONHOLDER                 , 0, { gCardEffectDamageGraveyard_080655EC              , gCardEffectDamageTribute_08053CC4                , NULL                                             , gCardEffectTributeSpecialSummon_08056930         , NULL                                              } },
    { KONAMI_CARD_SHUFFLE                               , 0, { gCardEffectDamage_08073AB0                       , NULL                                             , gCardEffectDamage_08060044                       , gCardEffectDestroyDamage_08056BC4                , NULL                                              } },
    { KONAMI_Y_DRAGON_HEAD                              , 0, { gCardEffectSpecialSummonDestroy_08074338         , gCardEffectEquipBoostATK_0805000C                , gCardEffectSpecialSummonDestroy_0806019C         , gCardEffectDestroySpecialSummon_080563A4         , gCardEffectSpecialSummonDestroy_080843FC          } },
    { KONAMI_XY_DRAGON_CANNON                           , 0, { gCardEffectDestroy_08064654                      , gCardEffectSpecialSummonDiscard_080535B0         , gCardEffectDiscard_0805C1E4                      , gCardEffectDiscard_08056380                      , gCardEffectDestroy_0808198C                       } },
    { KONAMI_Z_METAL_TANK                               , 0, { gCardEffectSpecialSummonDestroy_08074338         , gCardEffectEquipBoostATK_0805000C                , gCardEffectSpecialSummonDestroy_0806019C         , gCardEffectDestroySpecialSummon_080563A4         , gCardEffectSpecialSummonDestroy_080843FC          } },
    { KONAMI_XYZ_DRAGON_CANNON                          , 0, { gCardEffectDestroy_08064654                      , gCardEffectSpecialSummonDestroy_08054FBC         , gCardEffectDiscard_0805C1E4                      , gCardEffectDiscard_08056380                      , gCardEffectDestroy_0808198C                       } },
    { KONAMI_LEKUNGA                                    , 0, { gCardEffectSpecialSummonDestroy_08072EB4         , NULL                                             , gCardEffectSpecialSummonChangePosition_080602A8  , gCardEffectGraveyardSearch_08059F2C              , NULL                                              } },
    { KONAMI_PITCH_DARK_DRAGON                          , 0, { gCardEffectSpecialSummonDestroy_08074338         , gCardEffectEquipBoostATK_0805000C                , gCardEffectSpecialSummonDestroy_0806019C         , gCardEffectDestroySpecialSummon_080563A4         , gCardEffectSpecialSummonDestroy_080843FC          } },
    { KONAMI_KIRYU                                      , 0, { gCardEffectSpecialSummonDestroy_08074708         , gCardEffectEquipBoostATK_0805000C                , gCardEffectSpecialSummonDestroy_080602E0         , gCardEffectSpecialSummonDestroy_08058578         , gCardEffectSpecialSummonDestroy_080843FC          } },
    { KONAMI_ZOMBIE_TIGER                               , 0, { gCardEffectSpecialSummonDestroy_08074338         , gCardEffectEquipBoostATK_0805000C                , gCardEffectSpecialSummonDestroy_0806019C         , gCardEffectDestroySpecialSummon_080563A4         , gCardEffectSpecialSummonDestroy_080843FC          } },
    { KONAMI_SECOND_GOBLIN                              , 0, { gCardEffectSpecialSummonDestroy_0807479C         , gCardEffectEquipBoostATK_0805000C                , gCardEffectSpecialSummonDestroy_08060350         , gCardEffectSpecialSummonDestroy_08058578         , gCardEffectSpecialSummonDestroy_080843FC          } },
    { KONAMI_DES_DENDLE                                 , 0, { gCardEffectSpecialSummonDestroy_08074338         , gCardEffectEquipBoostATK_0805000C                , gCardEffectSpecialSummonDestroy_0806019C         , gCardEffectDestroySpecialSummon_080563A4         , gCardEffectSpecialSummonDestroy_080843FC          } },
    { KONAMI_BURNING_BEAST                              , 0, { gCardEffectSpecialSummonDestroy_08074338         , gCardEffectEquipBoostATK_0805000C                , gCardEffectSpecialSummonDestroy_0806019C         , gCardEffectDestroySpecialSummon_080563A4         , gCardEffectSpecialSummonDestroy_080843FC          } },
    { KONAMI_FREEZING_BEAST                             , 0, { gCardEffectSpecialSummonDestroy_08074338         , gCardEffectEquipBoostATK_0805000C                , gCardEffectSpecialSummonDestroy_0806019C         , gCardEffectDestroySpecialSummon_080563A4         , gCardEffectSpecialSummonDestroy_080843FC          } },
    { KONAMI_ROULETTE_BARREL                            , 0, { gCardEffectDestroy_080749E0                      , NULL                                             , gCardEffectDestroyRNG_0805C1C0                   , gCardEffectDestroySpecialSummon_080563A4         , NULL                                              } },
    { KONAMI_PALADIN_OF_WHITE_DRAGON                    , 0, { gCardEffectSpecialSummonRitualSummon_08074AF4    , NULL                                             , gCardEffectSpecialSummonRitualSummon_080603B8    , gCardEffectTributeSpecialSummon_08057344         , NULL                                              } },
    { KONAMI_FRONTLINE_BASE                             , 0, { gCardEffectSpecialSummon_080659E8                , NULL                                             , gCardEffectSpecialSummon_08060464                , gCardEffectDestroySpecialSummon_080563A4         , NULL                                              } },
    { KONAMI_WAVE_MOTION_CANNON                         , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , NULL                                             , gCardEffectSendToGYDamage_08058598               , NULL                                              } },
    { KONAMI_XZ_TANK_CANNON                             , 0, { gCardEffectDestroy_08064654                      , gCardEffectSpecialSummonDestroySpellTrap_08053524, gCardEffectDiscard_0805C1E4                      , gCardEffectDiscard_08056380                      , gCardEffectDestroy_0808198C                       } },
    { KONAMI_YZ_TANK_DRAGON                             , 0, { gCardEffectDestroy_08064654                      , gCardEffectSpecialSummonDiscard_0805363C         , gCardEffectDiscard_0805C1E4                      , gCardEffectDiscard_08056380                      , gCardEffectDestroy_0808198C                       } },
    { KONAMI_DARK_PALADIN                               , 0, { gCardEffectNegateDestroy_08065698                , NULL                                             , gCardEffectNegateDestroy_0805D118                , gCardEffectDiscard_08056380                      , NULL                                              } },
    { KONAMI_SKILLED_WHITE_MAGICIAN                     , 0, { gCardEffectSpecialSummonGraveyard_08066858       , NULL                                             , gCardEffectSpecialSummonRevive_08060710          , gCardEffectTributeSpecialSummon_08057344         , NULL                                              } },
    { KONAMI_SKILLED_DARK_MAGICIAN                      , 0, { gCardEffectSpecialSummonGraveyard_08066858       , NULL                                             , gCardEffectSpecialSummonRevive_08060710          , gCardEffectTributeSpecialSummon_08057344         , NULL                                              } },
    { KONAMI_MAGICAL_MARIONETTE                         , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroy_08050994                      , gCardEffectDestroyCounter_08060788               , gCardEffectCounterDestroy_080585C4               , gCardEffectDestroy_0808198C                       } },
    { KONAMI_BREAKER_THE_MAGICAL_WARRIOR                , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroySpellTrap_08051B20             , gCardEffectDestroyCounter_08060788               , gCardEffectCounterDestroy_080585C4               , gCardEffectDestroy_0808198C                       } },
    { KONAMI_MAGICAL_SCIENTIST                          , 0, { gCardEffectSpecialSummonFusion_0807039C          , NULL                                             , gCardEffectSpecialSummonGraveyard_0805C248       , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_ROYAL_MAGICAL_LIBRARY                      , 0, { gCardEffectDraw_080656E0                         , NULL                                             , gCardEffectDrawCounter_080607B4                  , gCardEffectCounterDestroy_080585C4               , NULL                                              } },
    { KONAMI_TRIBE_INFECTING_VIRUS                      , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroyAll_08050A54                   , gCardEffectDiscardDestroyAll_080607EC            , gCardEffectDiscard_08056380                      , gCardEffectDestroyPreventAttack_08082E98          } },
    { KONAMI_KOITSU                                     , 0, { gCardEffectSpecialSummonDestroy_08074338         , gCardEffectEquipBoostATK_0805000C                , gCardEffectSpecialSummonDestroy_0806019C         , gCardEffectDestroySpecialSummon_080563A4         , gCardEffectSpecialSummonDestroy_080843FC          } },
    { KONAMI_PITCH_BLACK_POWER_STONE                    , 0, { gCardEffectDestroyCounter_080752CC               , gCardEffectDestroyCounter_080552A0               , gCardEffectDestroyCounter_08060800               , gCardEffectDestroyCounter_080585E8               , gCardEffectDestroyCounter_08084594                } },
    { KONAMI_MASS_DRIVER                                , 0, { gCardEffectDamageGraveyard_080655EC              , NULL                                             , gCardEffectTributeDamage_0805C3EC                , gCardEffectTribute_080567A0                      , NULL                                              } },
    { KONAMI_GUARDIAN_CEAL                              , 0, { gCardEffectDestroy_08064654                      , gCardEffectSpecialSummonSendToGY_08053D88        , gCardEffectGraveyardSendToGY_08061D40            , gCardEffectSendToGYGraveyard_0805738C            , gCardEffectDestroy_0808198C                       } },
    { KONAMI_SASUKE_SAMURAI_2                           , 0, { gCardEffectNegate_0806B558                       , NULL                                             , gCardEffectDestroyRNG_0805C1C0                   , gCardEffectDamageChangePosition_08058778         , NULL                                              } },
    { KONAMI_METALLIZING_PARASITE_LUNATITE              , 0, { gCardEffectSpecialSummonDestroy_08074338         , gCardEffectEquipBoostATK_0805000C                , gCardEffectSpecialSummonDestroy_0806019C         , gCardEffectDestroySpecialSummon_080563A4         , gCardEffectSpecialSummonDestroy_080843FC          } },
    { KONAMI_LEGENDARY_FLAME_LORD                       , 0, { gCardEffectDestroy_08064660                      , gCardEffectRitualSummonDestroyAll_08053E6C       , gCardEffectDestroyCounter_08060788               , gCardEffectCounterDestroy_080585C4               , NULL                                              } },
    { KONAMI_DARK_MASTER_ZORC                           , 0, { gCardEffectRitualSummonDestroyAll_0807633C       , NULL                                             , gCardEffectDestroyRNG_0805C1C0                   , gCardEffectDestroySpecialSummon_080563A4         , NULL                                              } },
    { KONAMI_ARCHFIEND_S_OATH_NONE                      , 0, { gCardEffectSearchSendToGY_08076490               , NULL                                             , gCardEffectDestroyRNG_0805C1C0                   , gCardEffectDamageChangePosition_08058778         , gCardEffectSearchDiscard_08083280                 } },
    { KONAMI_CHIRON_THE_MAGE                            , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroySpellTrap_08051E94             , gCardEffectDiscardDestroySpellTrap_08060E24      , gCardEffectDiscardSpecialSummon_080587C0         , gCardEffectDestroy_0808198C                       } },
    { KONAMI_STRIKE_NINJA                               , 0, { gCardEffectBanishGraveyard_080769FC              , NULL                                             , gCardEffectBanishGraveyard_08060E5C              , gCardEffectBanishGraveyard_080587E0              , NULL                                              } },
    { KONAMI_FREED_THE_BRAVE_WANDERER                   , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroyEndPhase_080502B0              , gCardEffectDestroyGraveyard_08060EA8             , gCardEffectDestroyGraveyard_08058828             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_CHAOSRIDER_GUSTAPH                         , 0, { gCardEffectBanishBoostATK_08076C90               , NULL                                             , gCardEffectBanishBoostATK_08060FE8               , gCardEffectDestroySpecialSummon_080563A4         , NULL                                              } },
    { KONAMI_CHAOS_SORCERER                             , 0, { gCardEffectBanishSpecialSummon_08076DE0          , gCardEffectBoostATKSpecialSummon_0805086C        , gCardEffectSpecialSummonPreventAttack_0806109C   , gCardEffectDestroySpecialSummon_080563A4         , gCardEffectDestroy_0808198C                       } },
    { KONAMI_BLACK_LUSTER_SOLDIER_ENVOY_OF_THE_BEGINNING, 0, { gCardEffectBanishSpecialSummon_08076DE0          , gCardEffectReturnToHandFlip_080509FC             , gCardEffectSpecialSummonPreventAttack_0806109C   , gCardEffectDestroySpecialSummon_080563A4         , gCardEffectDestroy_0808198C                       } },
    { KONAMI_CHAOS_EMPEROR_DRAGON_ENVOY_OF_THE_END      , 0, { gCardEffectSpecialSummonSendToGY_080777D8        , NULL                                             , NULL                                             , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_STEALTH_BIRD                               , 0, { gCardEffectChangePosition_080728D4               , NULL                                             , gCardEffectChangePosition_0805FA24               , gCardEffectChangePosition_08057FCC               , NULL                                              } },
    { KONAMI_ANTI_AIRCRAFT_FLOWER                       , 0, { gCardEffectDamageGraveyard_080655EC              , gCardEffectDamage_08054088                       , NULL                                             , gCardEffectTributeSpecialSummon_08056930         , NULL                                              } },
    { KONAMI_LEVIA_DRAGON_DAEDALUS                      , 0, { gCardEffectDestroy_08064660                      , gCardEffectSendToGYGraveyard_080540EC            , gCardEffectSendToGYDestroyAll_08061584           , gCardEffectSendToGYGraveyard_08058C2C            , NULL                                              } },
    { KONAMI_ORCA_MEGA_FORTRESS_OF_DARKNESS             , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroySpellTrap_08054118             , NULL                                             , gCardEffectTributeSpecialSummon_08056930         , gCardEffectDestroy_0808198C                       } },
    { KONAMI_ABYSS_SOLDIER                              , 0, { gCardEffectReturnToHand_0806734C                 , gCardEffectReturnToHandDestroy_080550E4          , gCardEffectDiscardReturnToHand_080618B4          , gCardEffectDiscardGraveyard_08058E44             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_THE_AGENT_OF_JUDGMENT_SATURN               , 0, { gCardEffectDamageBattlePhase_080780F0            , NULL                                             , gCardEffectDamageBattlePhase_080618D4            , gCardEffectTributeSpecialSummon_08057344         , NULL                                              } },
    { KONAMI_THE_AGENT_OF_CREATION_VENUS                , 0, { gCardEffectSpecialSummonGraveyard_08066858       , NULL                                             , gCardEffectSpecialSummonDamage_08061938          , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_AVATAR_OF_THE_POT                          , 0, { gCardEffectDraw_080656E0                         , NULL                                             , gCardEffectDrawSendToGY_08061988                 , gCardEffectSendToGYGraveyard_08058C40            , NULL                                              } },
    { KONAMI_BLOWBACK_DRAGON                            , 0, { gCardEffectDestroyRNG_08068618                   , gCardEffectSpecialSummonDestroy_08054FBC         , gCardEffectDestroyRNG_0805C1C0                   , gCardEffectDestroySpecialSummon_080563A4         , gCardEffectDestroy_0808198C                       } },
    { KONAMI_ARCANE_ARCHER_OF_THE_FOREST                , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroyTribute_08053704               , NULL                                             , gCardEffectTributeSpecialSummon_08056930         , gCardEffectDestroy_0808198C                       } },
    { KONAMI_LADY_NINJA_YAE                             , 0, { gCardEffectReturnToHand_0806ABD4                 , gCardEffectDiscardReturnToHand_08054364          , gCardEffectGraveyardDiscard_080619F0             , gCardEffectDiscardGraveyard_08058E44             , NULL                                              } },
    { KONAMI_ARCHLORD_ZERATO                            , 0, { gCardEffectSpecialSummonDiscard_080781DC         , gCardEffectDestroy_080507AC                      , gCardEffectGraveyardDiscard_080619F0             , gCardEffectDiscardGraveyard_08058E44             , NULL                                              } },
    { KONAMI_SAND_GAMBLER                               , 0, { gCardEffectDestroyAllRNG_080789B0                , gCardEffectDestroy_080507AC                      , gCardEffectDestroyRNG_0805C1C0                   , gCardEffectDestroySpecialSummon_080563A4         , NULL                                              } },
    { KONAMI_MAN_THRO_TRO                               , 0, { gCardEffectDamageGraveyard_080655EC              , gCardEffectUnknown_08054468                      , NULL                                             , gCardEffectTributeSpecialSummon_08056930         , NULL                                              } },
    { KONAMI_CRUSH_D_GANDRA                             , 0, { gCardEffectSpecialSummonSendToGY_080797D0        , gCardEffectDestroyAllDamage_0805501C             , NULL                                             , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_BLUE_EYES_SHINING_DRAGON                   , 0, { gCardEffectFusionSummonNegate_08071170           , NULL                                             , gCardEffectSpecialSummonNegate_08061F10          , NULL                                             , NULL                                              } },
    { KONAMI_SORCERER_OF_DARK_MAGIC                     , 0, { gCardEffectSpecialSummonNegate_08079EC4          , NULL                                             , gCardEffectNegateDestroy_0805D118                , NULL                                             , NULL                                              } },
    { KONAMI_GOBLIN_CALLIGRAPHER                        , 0, { gCardEffectSearchSpecialSummon_0806FDEC_New      , NULL                                             , gCardEffectSpecialSummon_08062E1C                , EngineRDMD_MarkSummonUsedThenAnimate             , NULL                                              } },
    { KONAMI_HORUS_THE_BLACK_FLAME_DRAGON_LV8           , 0, { gCardEffectSpecialSummonNegate_08079EC4          , NULL                                             , gCardEffectNegateDestroy_0805D118                , NULL                                             , NULL                                              } },
    { KONAMI_ARMED_DRAGON_LV5                           , 0, { gCardEffectDestroy_08064654                      , gCardEffectSpecialSummonSendToGY_080546BC        , gCardEffectSpecialSummonSendToGY_08062170        , gCardEffectSpecialSummonSendToGY_0805934C        , gCardEffectDestroy_0808198C                       } },
    { KONAMI_ARMED_DRAGON_LV7                           , 0, { gCardEffectDestroy_08064660                      , gCardEffectSpecialSummonSendToGY_080546E0        , gCardEffectSpecialSummonSendToGY_08062170        , gCardEffectSpecialSummonSendToGY_0805934C        , NULL                                              } },
    { KONAMI_RED_EYES_B_CHICK                           , 0, { gCardEffectSpecialSummon_080659E8                , NULL                                             , gCardEffectSpecialSummonSendToGY_08062244        , gCardEffectSpecialSummonSendToGY_08059430        , NULL                                              } },
    { KONAMI_ULTIMATE_BASEBALL_KID                      , 0, { gCardEffectDamageGraveyard_080655EC              , gCardEffectGraveyardEquip_080548EC               , gCardEffectGraveyardSendToGY_08061D40            , gCardEffectSendToGYGraveyard_0805738C            , NULL                                              } },
    { KONAMI_THE_BLOCKMAN                               , 0, { gCardEffectSpecialSummonTribute_0806E308         , NULL                                             , gCardEffectSpecialSummonPreventAttack_080624FC   , gCardEffectSpecialSummonPreventAttack_080594F0   , NULL                                              } },
    { KONAMI_THE_CREATOR                                , 0, { gCardEffectSpecialSummonSendToGY_0807A8F0        , NULL                                             , gCardEffectSpecialSummonSendToGY_08062818        , gCardEffectDestroySpecialSummon_080563A4         , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_THE_CREATOR_INCARNATE                      , 0, { gCardEffectSpecialSummon_080659E8                , NULL                                             , gCardEffectSpecialSummonTribute_0806305C         , gCardEffectTributeSpecialSummon_08057344         , NULL                                              } },
    { KONAMI_HEAVY_MECH_SUPPORT_PLATFORM                , 0, { gCardEffectSpecialSummonDestroy_08074338         , gCardEffectEquipBoostATK_0805000C                , gCardEffectSpecialSummonDestroy_0806019C         , gCardEffectDestroySpecialSummon_080563A4         , gCardEffectSpecialSummonDestroy_080843FC          } },
    { KONAMI_GAIA_SOUL_THE_COMBUSTIBLE_COLLECTIVE       , 0, { gCardEffectDestroyBoostATK_08070274              , gCardEffectTributeDestroy_08050EAC               , gCardEffectDestroyRNG_0805C1C0                   , gCardEffectDestroyBoostATK_0805953C              , NULL                                              } },
    { KONAMI_A_TEAM_TRAP_DISPOSAL_UNIT                  , 0, { gCardEffectNegateDestroy_08065698                , NULL                                             , gCardEffectNegateDestroy_0805D118                , gCardEffectTributeSpecialSummon_08057344         , NULL                                              } },
    { KONAMI_HOMUNCULUS_THE_ALCHEMIC_BEING              , 0, { gCardEffectUnknown_0807AD84                      , NULL                                             , gCardEffectDestroyRNG_0805C1C0                   , gCardEffectDestroySpecialSummon_080563A4         , NULL                                              } },
    { KONAMI_LIGHTEN_THE_LOAD                           , 0, { gCardEffectDraw_0807AF68                         , NULL                                             , gCardEffectDraw_08062934                         , gCardEffectDestroySpecialSummon_080563A4         , NULL                                              } },
    { KONAMI_ASTRAL_BARRIER                             , 0, { gCardEffectDirectAttack_080732FC                 , NULL                                             , gCardEffectDirectAttack_08062BE8                 , NULL                                             , NULL                                              } },
    { KONAMI_CASTLE_GATE                                , 0, { gCardEffectDamageGraveyard_080655EC              , gCardEffectTributeDestroy_08050EAC               , gCardEffectChangePositionDestroy_0805ED90        , gCardEffectTributeSpecialSummon_08056930         , NULL                                              } },
    { KONAMI_HAND_OF_NEPHTHYS                           , 0, { gCardEffectSpecialSummonGraveyard_08066858       , gCardEffectSpecialSummonTribute_08054CB0         , gCardEffectSpecialSummonTribute_08062CB8         , gCardEffectSpecialSummonTribute_08059760         , NULL                                              } },
    { KONAMI_CATNIPPED_KITTY                            , 0, { gCardEffectEndPhaseBoostATK_08069DF8             , gCardEffectSpecialSummonChangePosition_0805174C  , gCardEffectDestroyRNG_0805C1C0                   , gCardEffectDestroySpecialSummon_080563A4         , gCardEffectDestroy_0808198C                       } },
    { KONAMI_BLAST_MAGICIAN                             , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroyEndPhase_080502B0              , gCardEffectDestroyCounter_08062D28               , gCardEffectDestroyCounter_08059814               , gCardEffectDestroy_0808198C                       } },
    { KONAMI_GOLEM_SENTRY                               , 0, { gCardEffectChangePosition_080728D4               , NULL                                             , gCardEffectChangePosition_0805FA24               , gCardEffectChangePosition_08057FCC               , NULL                                              } },
    { KONAMI_ABARE_USHIONI                              , 0, { gCardEffectDamageRNG_0807B6B8                    , NULL                                             , gCardEffectDestroyRNG_0805C1C0                   , gCardEffectDestroySpecialSummon_080563A4         , NULL                                              } },
    { KONAMI_THE_LIGHT_HEX_SEALED_FUSION                , 0, { gCardEffectSpecialSummonFusion_0807B77C          , gCardEffectSpecialSummonFusion_08054D5C          , gCardEffectSpecialSummonFusion_08062D4C          , gCardEffectSpecialSummonFusion_080598D8          , NULL                                              } },
    { KONAMI_THE_DARK_HEX_SEALED_FUSION                 , 0, { gCardEffectSpecialSummonFusion_0807B77C          , gCardEffectSpecialSummonFusion_08054D5C          , gCardEffectSpecialSummonFusion_08062D4C          , gCardEffectSpecialSummonFusion_080598D8          , NULL                                              } },
    { KONAMI_THE_EARTH_HEX_SEALED_FUSION                , 0, { gCardEffectSpecialSummonFusion_0807B77C          , gCardEffectSpecialSummonFusion_08054D5C          , gCardEffectSpecialSummonFusion_08062D4C          , gCardEffectSpecialSummonFusion_080598D8          , NULL                                              } },
    { KONAMI_RESCUE_CAT                                 , 0, { gCardEffectSpecialSummonSendToGY_0807B7DC        , NULL                                             , gCardEffectSpecialSummonSendToGY_08062D90        , gCardEffectSpecialSummonSendToGY_08059430        , NULL                                              } },
    { KONAMI_GATLING_DRAGON                             , 0, { gCardEffectDestroyRNG_0807B9F4                   , NULL                                             , gCardEffectDestroyRNG_0805C1C0                   , gCardEffectDestroySpecialSummon_080563A4         , NULL                                              } },
    { KONAMI_KING_DRAGUN                                , 0, { gCardEffectSpecialSummon_080659E8                , NULL                                             , gCardEffectSpecialSummon_08062E1C                , gCardEffectDestroySpecialSummon_080563A4         , NULL                                              } },
    { KONAMI_VAMPIRE_GENESIS                            , 0, { gCardEffectSpecialSummonGraveyard_080687A8       , NULL                                             , gCardEffectSpecialSummonDiscard_08062E8C         , gCardEffectDiscardGraveyard_08058E44             , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_KAIBAMAN                                   , 0, { gCardEffectSpecialSummon_080659E8                , NULL                                             , gCardEffectSpecialSummonTribute_0806305C         , gCardEffectTributeSpecialSummon_08057344         , NULL                                              } },
    { KONAMI_MOAI_INTERCEPTOR_CANNONS                   , 0, { gCardEffectChangePosition_080728D4               , NULL                                             , gCardEffectChangePosition_0805FA24               , gCardEffectChangePosition_08057FCC               , NULL                                              } },
    { KONAMI_GUARDIAN_STATUE                            , 0, { gCardEffectChangePosition_080728D4               , NULL                                             , gCardEffectChangePosition_0805FA24               , gCardEffectChangePosition_08057FCC               , NULL                                              } },
    { KONAMI_MEDUSA_WORM                                , 0, { gCardEffectChangePosition_080728D4               , NULL                                             , gCardEffectChangePosition_0805FA24               , gCardEffectChangePosition_08057FCC               , NULL                                              } },
    { KONAMI_MID_SHIELD_GARDNA                          , 0, { gCardEffectChangePosition_080728D4               , NULL                                             , gCardEffectChangePosition_0805FA24               , gCardEffectChangePosition_08057FCC               , NULL                                              } },
    { KONAMI_RESHEF_THE_DARK_BEING                      , 0, { gCardEffectTakeControlEndPhase_0806A2EC          , gCardEffectTakeControlDestroy_0804F618           , gCardEffectRitualSummonTakeControl_0806327C      , gCardEffectDiscardSpecialSummon_080587C0         , gCardEffectDestroy_0808198C                       } },
    { KONAMI_ELEMENTAL_HERO_THUNDER_GIANT               , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroyEndPhase_080502B0              , gCardEffectSpecialSummonFusionSummon_080632A4    , gCardEffectDiscardSpecialSummon_08059BE0         , gCardEffectDestroy_0808198C                       } },
    { KONAMI_SHIFTING_SHADOWS                           , 0, { gCardEffectDamageChangePosition_0807C158         , gCardEffectDamageChangePosition_08054EA8         , gCardEffectDamageChangePosition_080632FC         , gCardEffectDamageChangePosition_08058778         , NULL                                              } },
    { KONAMI_OCEAN_DRAGON_LORD_NEO_DAEDALUS             , 0, { gCardEffectSpecialSummonSendToGY_0807C474        , gCardEffectSendToGYGraveyard_080540EC            , gCardEffectSpecialSummonSendToGY_08063440        , gCardEffectSendToGYGraveyard_08058C2C            , NULL                                              } },
    { KONAMI_PATROID                                    , 0, { gCardEffectStandbyPhase_08067440                 , gCardEffectStandbyPhaseDamage_08054F64           , gCardEffectDestroyRNG_0805C1C0                   , gCardEffectDestroySpecialSummon_080563A4         , gCardEffectDestroy_0808198C                       } },
    { KONAMI_SUMMON_PRIEST                              , 0, { gCardEffectSpecialSummonSendToGY_0806B030        , NULL                                             , gCardEffectSpecialSummonDiscard_0806357C         , gCardEffectDiscardSpecialSummon_080587C0         , NULL                                              } },
    { KONAMI_WINGED_KURIBOH_LV10                        , 0, { gCardEffectSpecialSummonDestroyAll_0807C510      , gCardEffectDestroyAllChangePosition_08051DD8     , gCardEffectSpecialSummonDestroyAll_080635C0      , gCardEffectTributeSpecialSummon_08057344         , NULL                                              } },
    { KONAMI_SPARK_BLASTER                              , 0, { gCardEffectDestroyChangePosition_0807C660        , gCardEffectBoostATKSpecialSummon_0805086C        , NULL                                             , NULL                                             , gCardEffectDestroy_0808198C                       } },
    { KONAMI_CYBERNETIC_MAGICIAN                        , 0, { gCardEffectEndPhaseBoostATK_08069DF8             , gCardEffectDestroyEndPhase_080502B0              , gCardEffectDiscard_0805C1E4                      , gCardEffectDiscard_08056380                      , gCardEffectDestroy_0808198C                       } },
    { KONAMI_B_E_S_CRYSTAL_CORE                         , 0, { gCardEffectChangePositionSpecialSummon_0807051C  , gCardEffectDestroyChangePosition_080554C4        , gCardEffectDestroyRNG_0805C1C0                   , gCardEffectDestroySpecialSummon_080563A4         , gCardEffectDestroy_0808198C                       } },
    { KONAMI_PROTECTIVE_SOUL_AILIN                      , 0, { gCardEffectSpecialSummonDestroy_0807479C         , gCardEffectEquipBoostATK_0805000C                , gCardEffectSpecialSummonDestroy_08060350         , gCardEffectSpecialSummonDestroy_08058578         , gCardEffectSpecialSummonDestroy_080843FC          } },
    { KONAMI_DOITSU                                     , 0, { gCardEffectSpecialSummonDestroy_08074338         , gCardEffectEquipBoostATK_0805000C                , gCardEffectSpecialSummonDestroy_0806019C         , gCardEffectDestroySpecialSummon_080563A4         , gCardEffectSpecialSummonDestroy_080843FC          } },
    { KONAMI_D_D_M_DIFFERENT_DIMENSION_MASTER           , 0, { gCardEffectSpecialSummonBanish_0807738C          , NULL                                             , gCardEffectSpecialSummonBanish_08063A6C          , gCardEffectDiscardSpecialSummon_080587C0         , gCardEffectGraveyardSpecialSummon_08081B84        } },
    { KONAMI_ALKANA_KNIGHT_JOKER                        , 0, { gCardEffectFusionSummonNegate_08071170           , NULL                                             , gCardEffectFusionSummonDiscard_08063AB0          , gCardEffectFusionSummonDiscard_08059EC0          , NULL                                              } },
    { KONAMI_W_WING_CATAPULT                            , 0, { gCardEffectSpecialSummonDestroy_08074338         , gCardEffectEquipBoostATK_0805000C                , gCardEffectSpecialSummonDestroy_0806019C         , gCardEffectDestroySpecialSummon_080563A4         , gCardEffectSpecialSummonDestroy_080843FC          } },
    { KONAMI_VW_TIGER_CATAPULT                          , 0, { gCardEffectSpecialSummonDiscard_0807D4DC         , gCardEffectReturnToHandChangePosition_0804F4EC   , gCardEffectDiscard_0805C1E4                      , gCardEffectDiscard_08056380                      , gCardEffectDestroy_0808198C                       } },
    { KONAMI_VWXYZ_DRAGON_CATAPULT_CANNON               , 0, { gCardEffectBanishSpecialSummon_08076DE0          , gCardEffectSpecialSummonDestroy_08054FBC         , gCardEffectDestroyRNG_0805C1C0                   , gCardEffectDestroySpecialSummon_080563A4         , gCardEffectDestroy_0808198C                       } },
    { KONAMI_ELEMENTAL_HERO_TEMPEST                     , 0, { gCardEffectTakeControlFlip_0807C088              , gCardEffectSpecialSummonFusionSummon_080556F0    , gCardEffectGraveyardSendToGY_08061D40            , gCardEffectSendToGYGraveyard_0805738C            , gCardEffectDestroy_0808198C                       } },
    { KONAMI_B_E_S_TETRAN                               , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroySpellTrap_08051B20             , gCardEffectDestroySpellTrapCounter_08063DF4      , gCardEffectDestroySpellTrapCounter_0805A00C      , gCardEffectDestroy_0808198C                       } },
    { KONAMI_ARMED_DRAGON_LV10                          , 0, { gCardEffectDestroy_08064660                      , gCardEffectDiscardDestroyAll_08051F04            , gCardEffectSendToGYGraveyard_08060B18            , gCardEffectSendToGYGraveyard_08058754            , NULL                                              } },
    { KONAMI_URIA_LORD_OF_SEARING_FLAMES                , 0, { gCardEffectDestroy_08064654                      , gCardEffectSpecialSummonDestroySpellTrap_08053524, gCardEffectDestroyRNG_0805C1C0                   , gCardEffectDestroySpecialSummon_080563A4         , gCardEffectDestroy_0808198C                       } },
    { KONAMI_RAVIEL_LORD_OF_PHANTASMS                   , 0, { gCardEffectBoostATKBoostDEF_0806678C             , gCardEffectSpecialSummonTribute_08054CB0         , gCardEffectDestroyRNG_0805C1C0                   , gCardEffectTributeSpecialSummon_08056930         , NULL                                              } },
    { KONAMI_CYBER_LASER_DRAGON                         , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroyEndPhase_080502B0              , gCardEffectDestroyRNG_0805C1C0                   , gCardEffectDestroySpecialSummon_080563A4         , gCardEffectDestroy_0808198C                       } },
    { KONAMI_ANCIENT_GEAR_CANNON                        , 0, { gCardEffectDamageBattlePhase_0807E5A4            , NULL                                             , gCardEffectTributeTakeControl_0805F3BC           , gCardEffectTributeSpecialSummon_08057344         , NULL                                              } },
    { KONAMI_ANTEATEREATINGANT                          , 0, { gCardEffectDestroy_08064654                      , gCardEffectDestroySpellTrap_08051E94             , gCardEffectSpecialSummonPreventAttack_0806109C   , gCardEffectDestroySpecialSummon_080563A4         , gCardEffectDestroy_0808198C                       } },
    { KONAMI_DEMISE_KING_OF_ARMAGEDDON                  , 0, { gCardEffectDestroy_08064660                      , gCardEffectDestroyAllDamage_0805501C             , NULL                                             , gCardEffectDamage_0805635C                       , NULL                                              } },
    { KONAMI_TRIAL_OF_THE_PRINCESSES                    , 0, { gCardEffectSpecialSummonGraveyard_08066858       , NULL                                             , gCardEffectSpecialSummonDestroy_080644B4         , gCardEffectSpecialSummonEquip_080568D0           , NULL                                              } },
    { KONAMI_GREAT_SPIRIT                               , 0, { gCardEffectChangePosition_080728D4               , NULL                                             , gCardEffectChangePosition_0805FA24               , gCardEffectChangePosition_08057FCC               , NULL                                              } },
};
