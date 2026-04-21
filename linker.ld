ENTRY(__start)

MEMORY {
    ewram (w!x) : ORIGIN = 0x02000000, LENGTH = 256K
    iwram (w!x) : ORIGIN = 0x03000000, LENGTH = 32K
    rom (rx) : ORIGIN = 0x08000000, LENGTH = 32M
}

SECTIONS {
    ewram (NOLOAD) : ALIGN(4) {
        . = 0x00000000; gUnk_02000000 = .;
        . = 0x00000002; gUnk_02000002 = .;
        . = 0x00000003; gUnk_02000003 = .;
        . = 0x00000005; gUnk_02000005 = .;
        . = 0x00000006; gUnk_02000006 = .;
        . = 0x00000007; gUnk_02000007 = .;
        . = 0x00001138; gUnk_02001138 = .;
        . = 0x00001250; gUnk_02001250 = .;
        . = 0x00001368; gUnk_02001368 = .;
        . = 0x000053F8; gUnk_020053F8 = .;
        . = 0x00006C2C; gUnk_02006C2C = .;
        . = 0x00006C30; gUnk_02006C30 = .;
        . = 0x00006C34; gUnk_02006C34 = .;
        . = 0x00006C38; gUnk_02006C38 = .;
        . = 0x00006C3C; gUnk_02006C3C = .;
        . = 0x00006E48; gUnk_02006E48 = .;
        . = 0x00006E57; gUnk_02006E57 = .;
        . = 0x00006E5C; gUnk_02006E5C = .;
        . = 0x00006ED0; gUnk_02006ED0 = .;
        . = 0x00006F10; gUnk_02006F10 = .;
        . = 0x0000AF10; gUnk_0200AF10 = .;
        . = 0x0000AF20; gUnk_0200AF20 = .;
        . = 0x0001AF20; gUnk_0201AF20 = .;
        . = 0x0001AFB0; gUnk_0201AFB0 = .;
        . = 0x0001AFE0; gUnk_0201AFE0 = .;
        . = 0x0001AFF8; gUnk_0201AFF8 = .;
        . = 0x0001B00C; gUnk_0201B00C = .;
        . = 0x0001B010; gUnk_0201B010 = .;
        . = 0x0001B16C; gUnk_0201B16C = .;
        . = 0x0001B18C; gUnk_0201B18C = .;
        . = 0x0001B1B0; gUnk_0201B1B0 = .;
        . = 0x0001B290; gUnk_0201B290 = .;
        . = 0x0001B590; gUnk_0201B590 = .;
        . = 0x0001B72C; gUnk_0201B72C = .;
        . = 0x0001B734; gUnk_0201B734 = .;
        . = 0x0001B738; gUnk_0201B738 = .;
        . = 0x0001B748; gUnk_0201B748 = .;
        . = 0x0001B754; gUnk_0201B754 = .;
        . = 0x0001B75C; gUnk_0201B75C = .;
        . = 0x0001B830; gUnk_0201B830 = .;
        . = 0x0001B838; gUnk_0201B838 = .;
        . = 0x0001B850; gUnk_0201B850 = .;
        . = 0x0001B870; gUnk_0201B870 = .;
        . = 0x0001B872; gUnk_0201B872 = .;
        . = 0x0001BB90; gUnk_0201BB90 = .;
        . = 0x0001BBBC; gUnk_0201BBBC = .;
        . = 0x0001BBC0; gUnk_0201BBC0 = .;
        . = 0x0001BC2C; gUnk_0201BC2C = .;
        . = 0x0001BC38; gUnk_0201BC38 = .;
        . = 0x0001BC3C; gUnk_0201BC3C = .;
        . = 0x0001BC54; gUnk_0201BC54 = .;
        . = 0x0001BC68; gUnk_0201BC68 = .;
        . = 0x0001BC7C; gUnk_0201BC7C = .;
        . = 0x0001BCC0; gUnk_0201BCC0 = .;
        . = 0x0001BCC2; gUnk_0201BCC2 = .;
        . = 0x0001C4D0; gUnk_0201C4D0 = .;
        . = 0x0001C4D8; gUnk_0201C4D8 = .;
        . = 0x0001C4E0; gUnk_0201C4E0 = .;
        . = 0x0001C4EC; gUnk_0201C4EC = .;
        . = 0x0001C4F0; gUnk_0201C4F0 = .;
        . = 0x0001C4F4; gUnk_0201C4F4 = .;
        . = 0x0001C4F8; gUnk_0201C4F8 = .;
        . = 0x0001C4FC; gUnk_0201C4FC = .;
        . = 0x0001C510; gUnk_0201C510 = .;
        . = 0x0001C520; gUnk_0201C520 = .;
        . = 0x0001C574; gUnk_0201C574 = .;
        . = 0x0001C5D8; gUnk_0201C5D8 = .;
        . = 0x0001C5E8; gUnk_0201C5E8 = .;
        . = 0x0001C5EC; gUnk_0201C5EC = .;
        . = 0x0001C5FC; gUnk_0201C5FC = .;
        . = 0x0001C600; gUnk_0201C600 = .;
        . = 0x0001C740; gUnk_0201C740 = .;
        . = 0x0001C880; gUnk_0201C880 = .;
        . = 0x0001C8F4; gUnk_0201C8F4 = .;
        . = 0x0001C8F8; gUnk_0201C8F8 = .;
        . = 0x0001CAAC; gUnk_0201CAAC = .;
        . = 0x0001CAB0; gUnk_0201CAB0 = .;
        . = 0x0001D5B4; gUnk_0201D5B4 = .;
        . = 0x0001D9C0; gUnk_0201D9C0 = .;
        . = 0x0001D9C8; gUnk_0201D9C8 = .;
        . = 0x0001E1C8; gUnk_0201E1C8 = .;
        . = 0x0001E1CC; gUnk_0201E1CC = .;
        . = 0x0001E1D4; gUnk_0201E1D4 = .;
        . = 0x0001E204; gUnk_0201E204 = .;
        . = 0x0001E20C; gUnk_0201E20C = .;
        . = 0x0001E220; gUnk_0201E220 = .;
        . = 0x0001E228; gUnk_0201E228 = .;
        . = 0x0001E238; gUnk_0201E238 = .;
        . = 0x0001E274; gUnk_0201E274 = .;
        . = 0x0001E278; gUnk_0201E278 = .;
        . = 0x0001E288; gUnk_0201E288 = .;
        . = 0x0001E28A; gUnk_0201E28A = .;
        . = 0x0001E2A0; gUnk_0201E2A0 = .;
        . = 0x0001E2A8; gUnk_0201E2A8 = .;
        . = 0x0001E2B4; gUnk_0201E2B4 = .;
        . = 0x0001E4D0; gUnk_0201E4D0 = .;
        . = 0x0001E4F0; gUnk_0201E4F0 = .;
        . = 0x0001E500; gUnk_0201E500 = .;
        . = 0x0001EB00; gUnk_0201EB00 = .;
        . = 0x0001F440; gUnk_0201F440 = .;
        . = 0x0001F441; gUnk_0201F441 = .;
        . = 0x0001F641; gUnk_0201F641 = .;
        . = 0x0001F841; gUnk_0201F841 = .;
        . = 0x0001FE42; gUnk_0201FE42 = .;
        . = 0x0001FE4E; gUnk_0201FE4E = .;
        . = 0x0001FE54; gUnk_0201FE54 = .;
        . = 0x0001FE5B; gUnk_0201FE5B = .;
        . = 0x0001FE5C; gUnk_0201FE5C = .;
        . = 0x0001FE60; gUnk_0201FE60 = .;
        . = 0x0001FE80; gUnk_0201FE80 = .;
        . = 0x0001FEC0; gUnk_0201FEC0 = .;
        . = 0x0001FEC4; gUnk_0201FEC4 = .;
        . = 0x0001FEDC; gUnk_0201FEDC = .;
        . = 0x0001FEF0; gUnk_0201FEF0 = .;
        . = 0x0001FF30; gUnk_0201FF30 = .;
        . = 0x0001FF5A; gUnk_0201FF5A = .;
        . = 0x0001FF60; gUnk_0201FF60 = .;
        . = 0x00020160; gUnk_02020160 = .;
        . = 0x00022B60; gUnk_02022B60 = .;
        . = 0x00022D60; gUnk_02022D60 = .;
        . = 0x00022FAC; gUnk_02022FAC = .;
        . = 0x000230AD; gUnk_020230AD = .;
        . = 0x000230B8; gUnk_020230B8 = .;
        . = 0x000230C0; gUnk_020230C0 = .;
        . = 0x000230C4; gUnk_020230C4 = .;
        . = 0x000230F0; gUnk_020230F0 = .;
        . = 0x000230F8; gUnk_020230F8 = .;
        . = 0x00023110; gUnk_02023110 = .;
        . = 0x00023114; gUnk_02023114 = .;
        . = 0x00023118; gUnk_02023118 = .;
        . = 0x0002311C; gUnk_0202311C = .;
        . = 0x00023130; gUnk_02023130 = .;
        . = 0x0002317C; gUnk_0202317C = .;
        . = 0x00023180; gUnk_02023180 = .;
        . = 0x000232C0; gUnk_020232C0 = .;
        . = 0x00023348; gUnk_02023348 = .;
        . = 0x0002334E; gUnk_0202334E = .;
        . = 0x00023350; gUnk_02023350 = .;
        . = 0x00023360; gUnk_02023360 = .;
        . = 0x00023398; gUnk_02023398 = .;
        . = 0x000233AC; gUnk_020233AC = .;
        . = 0x000233C4; gUnk_020233C4 = .;
        . = 0x00023480; gUnk_02023480 = .;
        . = 0x0002348C; gUnk_0202348C = .;
        . = 0x00023490; gUnk_02023490 = .;
        . = 0x00023D40; gUnk_02023D40 = .;
        . = 0x00027D40; gUnk_02027D40 = .;
        . = 0x00029250; gUnk_02029250 = .;
        . = 0x00029590; gUnk_02029590 = .;
        . = 0x000297E0; gUnk_020297E0 = .;
        . = 0x000297E4; gUnk_020297E4 = .;
        . = 0x00029810; gUnk_02029810 = .;
        . = 0x00029E90; gUnk_02029E90 = .;
        . = 0x00029EA0; ReadSramFast = .;
        . = 0x00029EA4; VerifySramFast = .;
        . = 0x00029EA8; *libc.a:*.o(COMMON);
        . = 0x00029EB0; gUnk_02029EB0 = .;
        . = 0x00029EB7; gUnk_02029EB7 = .;
        . = 0x00029EC0; gUnk_02029EC0 = .;
        . = 0x0002A2C0; gUnk_0202A2C0 = .;
        . = 0x0002A4D0; gUnk_0202A4D0 = .;
        . = 0x0002A4F6; gUnk_0202A4F6 = .;
        . = 0x0002A7D0; gUnk_0202A7D0 = .;
        . = 0x0002F3A4; gUnk_0202F3A4 = .;
        . = 0x0002F3C0; gUnk_0202F3C0 = .;
        . = 0x0002F40A; gUnk_0202F40A = .;
        . = 0x0002F414; gUnk_0202F414 = .;
        . = 0x0002F41A; gUnk_0202F41A = .;
        . = 0x0002F426; gUnk_0202F426 = .;
        . = 0x0002F42A; gUnk_0202F42A = .;
        . = 0x0002F438; gUnk_0202F438 = .;
        . = 0x0002F440; gUnk_0202F440 = .;
        . = 0x00035EB0; gUnk_02035EB0 = .;
        . = 0x00035FB0; gUnk_02035FB0 = .;
        . = 0x000363C0; gUnk_020363C0 = .;
        . = 0x00039EB0; gUnk_02039EB0 = .;
        . = 0x00039EBC; gUnk_02039EBC = .;
        . = 0x0003A2C0; gUnk_0203A2C0 = .;
        . = 0x0003EEB0; gUnk_0203EEB0 = .;
        . = 0x00040000;
    } >ewram

    iwram (NOLOAD) : ALIGN(4) {
        . = 0x00000000; gIntrTable = .;
        . = 0x00000000; gUnk_03000000 = .;
        . = 0x00000020; gUnk_03000020 = .;
        . = 0x00000040; gUnk_03000040 = .;
        . = 0x00000044; gUnk_03000044 = .;
        . = 0x00000184; gUnk_03000184 = .;
        . = 0x00000186; gUnk_03000186 = .;
        . = 0x00000193; gUnk_03000193 = .;
        . = 0x000001B6; gUnk_030001B6 = .;
        . = 0x000001FC; gUnk_030001FC = .;
        . = 0x00000242; gUnk_03000242 = .;
        . = 0x0000024C; gUnk_0300024C = .;
        . = 0x0000025A; gUnk_0300025A = .;
        . = 0x00000288; gUnk_03000288 = .;
        . = 0x000003A0; gUnk_030003A0 = .;
        . = 0x000003A8; gUnk_030003A8 = .;
        . = 0x000003AA; gUnk_030003AA = .;
        . = 0x0000044C; gUnk_0300044C = .;
        . = 0x000006F8; gUnk_030006F8 = .;
        . = 0x000007A4; gUnk_030007A4 = .;
        . = 0x000007B0; gUnk_030007B0 = .;
        . = 0x000007B4; gUnk_030007B4 = .;
        . = 0x000007BC; gUnk_030007BC = .;
        . = 0x000007D2; gUnk_030007D2 = .;
        . = 0x000007D6; gUnk_030007D6 = .;
        . = 0x000007F8; gUnk_030007F8 = .;
        . = 0x00000BF8; gUnk_03000BF8 = .;
        . = 0x00000BFC; gUnk_03000BFC = .;
        . = 0x00000C00; gUnk_03000C00 = .;
        . = 0x00000C08; gUnk_03000C08 = .;
        . = 0x00002C08; gUnk_03002C08 = .;
        . = 0x00004C08; gUnk_03004C08 = .;
        . = 0x00004C0C; gUnk_03004C0C = .;
        . = 0x000050CC; gUnk_030050CC = .;
        . = 0x000052F0; gUnk_030052F0 = .;
        . = 0x00005390; gUnk_03005390 = .;
        . = 0x00005408; gUnk_03005408 = .;
        . = 0x0000546C; gUnk_0300546C = .;
        . = 0x000055A0; gUnk_030055A0 = .;
        . = 0x000055BC; gUnk_030055BC = .;
        . = 0x000055C0; gUnk_030055C0 = .;
        . = 0x00005608; gUnk_03005608 = .;
        . = 0x00005644; gUnk_03005644 = .;
        . = 0x00005648; gUnk_03005648 = .;
        . = 0x00005658; src/agb_sram.o(.bss);
        . = 0x00005778; *libc.a:*.o(.bss);
        . = 0x00005828; *libgcc.a:*.o(.bss);
        . = 0x00005850; gUnk_03005850 = .;
        . = 0x0000585C; gUnk_0300585C = .;
        . = 0x00005F4A; gUnk_03005F4A = .;
        . = 0x00005F4C; gUnk_03005F4C = .;
        . = 0x00005F78; end = .;
        . = 0x00008000;
    } >iwram

    rom : ALIGN(4) {
        asm/crt0.o(.text);
        asm/code.o(.text);
        src/GL_File.o(.text);
        asm/code_0801510C.o(.text);
        asm/libagbsyscall.o(.text);
        src/agb_sram.o(.text);

        *libgcc.a:_call_via_rX.o(.text);
        *libgcc.a:_divsi3.o(.text);
        *libgcc.a:_dvmd_tls.o(.text);
        *libgcc.a:_modsi3.o(.text);
        *libgcc.a:_muldi3.o(.text);
        *libgcc.a:_udivsi3.o(.text);
        *libgcc.a:_umodsi3.o(.text);

        *libc.a:memcmp.o(.text);
        *libc.a:memcpy.o(.text);
        *libc.a:memset.o(.text);
        *libc.a:qsort.o(.text);
        *libc.a:sscanf.o(.text);
        *libc.a:strcat.o(.text);
        *libc.a:strcmp.o(.text);
        *libc.a:strcpy.o(.text);
        *libc.a:strlen.o(.text);
        *libc.a:strncmp.o(.text);
        *libc.a:strncpy.o(.text);
        *libc.a:vfscanf.o(.text);

        asm/code2.o(.text);
        *libc.a:atof.o(.text);
        *libc.a:fread.o(.text);
        *libc.a:refill.o(.text);
        *libc.a:strtod.o(.text);
        *libc.a:strtol.o(.text);
        *libc.a:strtoul.o(.text);
        *libc.a:ungetc.o(.text);
        *libc.a:fflush.o(.text);
        *libc.a:findfp.o(.text);
        *libc.a:freer.o(.text);
        *libc.a:fwalk.o(.text);
        *libc.a:makebuf.o(.text);
        *libc.a:mallocr.o(.text);
        *libc.a:mlock.o(.text);
        *libc.a:mprec.o(.text);
        *libc.a:reallocr.o(.text);
        *libc.a:sbrkr.o(.text);
        *libc.a:stdio.o(.text);
        *libc.a:syscalls.o(.text);
        *libc.a:writer.o(.text);
        *libc.a:callocr.o(.text);
        *libc.a:closer.o(.text);
        *libc.a:errno.o(.text);
        *libc.a:fstatr.o(.text);
        *libc.a:libcfunc.o(.text);
        *libc.a:lseekr.o(.text);
        *libc.a:readr.o(.text);
        *libgcc.a:dp-bit.o(.text);
        *libgcc.a:fp-bit.o(.text);
        *libgcc.a:_lshrdi3.o(.text);
        *libgcc.a:_negdi2.o(.text);
    } >rom

    rodata : ALIGN(4) {
        data/data.o(.rodata);
        src/GL_File.o(.rodata);
        data/data_09E399D0.o(.rodata);
        src/agb_sram.o(.rodata);
        *libc.a:vfscanf.o(.rodata);
        data/data1.o(.rodata);
        *libc.a:*.o(.rodata);
        data/data2.o(.rodata);
        *libc.a:*.o(.data);
        data/data3.o(.rodata);
        rom_data_end = .;
    } >rom

    /* DWARF 2 sections */
    .debug_aranges  0 : { *(.debug_aranges) }
    .debug_pubnames 0 : { *(.debug_pubnames) }
    .debug_info     0 : { *(.debug_info) }
    .debug_abbrev   0 : { *(.debug_abbrev) }
    .debug_line     0 : { *(.debug_line) }
    .debug_frame    0 : { *(.debug_frame) }
    .debug_str      0 : { *(.debug_str) }
    .debug_loc      0 : { *(.debug_loc) }
    .debug_macinfo  0 : { *(.debug_macinfo) }

    /* Discard everything not specifically mentioned above. */
    /DISCARD/ :
    {
        *(*);
    }
}
