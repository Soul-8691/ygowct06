
undefined8 FUN_0801ec9c(undefined4 param_1,uint param_2,uint param_3,undefined4 param_4)

{
  undefined2 uVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  undefined4 uVar5;
  uint uVar6;
  uint uVar7;
  undefined4 in_lr;
  
  switch(param_1) {
  case 3:
    iVar2 = FUN_08096974();
    if (iVar2 != 1) {
      uVar7 = 0;
      do {
        uVar6 = DAT_0201e2a4 ^ uVar7;
        iVar2 = 0;
        do {
          uVar3 = FUN_08096b3c(uVar6,iVar2,0);
          if ((uVar3 & 0x800) != 0) {
            uVar3 = 0;
            goto LAB_0801ef7a;
          }
          iVar2 = iVar2 + 1;
        } while (iVar2 < 0xb);
        uVar3 = 0;
        if ((&DAT_0201c4ec)[(uVar6 & 1) * 0x21a] != 0) {
LAB_0801eeaa:
          uVar4 = FUN_08096b3c(uVar6,0xb,uVar3);
          if ((uVar4 & 0x800) == 0) goto code_r0x0801eebc;
          iVar2 = 0xb;
LAB_0801ef7a:
          FUN_080c6a20(uVar6,iVar2,uVar3);
          FUN_080c89e8();
          break;
        }
LAB_0801eec4:
        (&DAT_020230f0)[uVar6] = 0;
        uVar7 = uVar7 + 1;
      } while ((int)uVar7 < 2);
      break;
    }
    param_3 = 0xd;
    param_4 = 0;
    param_2 = DAT_0201e2a4;
    goto LAB_0801ef48;
  case 6:
    FUN_080c8f48(param_2);
    break;
  default:
    goto switchD_0801ecbc_caseD_8;
  case 9:
    FUN_080c8bf0();
    FUN_080c2840(param_2);
    break;
  case 10:
  case 0x1c:
  case 0x1d:
  case 0x1e:
  case 0x1f:
  case 0x22:
  case 0x27:
  case 0x28:
  case 0x29:
  case 0x2a:
  case 0x2b:
  case 0x2c:
  case 0x2d:
  case 0x35:
  case 0x39:
    break;
  case 0xb:
    FUN_080c2880(param_2,param_3,param_4);
    break;
  case 0xc:
    FUN_080c291c(param_2,param_3,param_4);
    break;
  case 0xd:
    FUN_080ca5f8(param_2,param_3);
    break;
  case 0x11:
    *(undefined2 *)(&DAT_02023180 + param_3 * 2 + param_2 * 0xa0) = 1;
    FUN_080c4220(param_2,(&DAT_0202317c)[param_2]);
    FUN_080c678c();
    FUN_080cbf0c();
  case 1:
  case 2:
  case 4:
  case 5:
  case 0xe:
  case 0x10:
  case 0x13:
  case 0x15:
  case 0x17:
  case 0x20:
  case 0x23:
  case 0x25:
  case 0x2e:
  case 0x2f:
  case 0x30:
  case 0x33:
  case 0x34:
  case 0x37:
  case 0x38:
  case 0x3a:
  case 0x3b:
  case 0x3c:
  case 0x3d:
    FUN_080bc794(param_2,param_3,param_4);
    break;
  case 0x12:
    FUN_080c4220(param_2,(&DAT_0202317c)[param_2]);
    break;
  case 0x14:
  case 0x16:
    uVar1 = FUN_08094678(param_2,param_3);
    FUN_080c39fc(param_2 & 0xffff,param_3 & 0xffff,uVar1);
    break;
  case 0x18:
    FUN_080c40e0(param_2,param_3,param_4);
    break;
  case 0x19:
    FUN_080c4ea0(param_3,param_4);
    break;
  case 0x1a:
    FUN_080c3d00(param_2,param_3);
    break;
  case 0x1b:
    FUN_080c412c(param_2,param_3,param_4);
    break;
  case 0x21:
    FUN_080bc794(param_2,param_3,param_4);
  case 7:
LAB_0801ef48:
    FUN_080c6a20(param_2,param_3,param_4);
    break;
  case 0x24:
    FUN_080cbf0c();
    FUN_080c8d30();
    FUN_080c8bf0();
    FUN_080c8904();
    break;
  case 0x31:
    FUN_080c7950(param_2,param_3,param_4);
    break;
  case 0x32:
    FUN_080cbf58(param_3);
    goto switchD_0801ecbc_caseD_8;
  }
  uVar5 = 1;
LAB_0801ef86:
  return CONCAT44(in_lr,uVar5);
switchD_0801ecbc_caseD_8:
  uVar5 = 0;
  goto LAB_0801ef86;
code_r0x0801eebc:
  uVar3 = uVar3 + 1;
  if ((uint)(&DAT_0201c4ec)[(uVar6 & 1) * 0x21a] <= uVar3) goto LAB_0801eec4;
  goto LAB_0801eeaa;
}

