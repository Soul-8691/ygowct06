# Card art from graphics/png (paths contain spaces — never list as make prerequisites):
#   gbagfx: PNG -> .gbapal, PNG -> .8bpp
#   card6bpp: .8bpp -> .6bpp, writes card_graphics.c + card_palettes.c

$(CARD_GRAPHICS_C) $(CARD_PALETTES_C): $(CARD6BPP) | tools
	@if [ ! -f $(CARD_GRAPHICS_C) ] || [ ! -f $(CARD_PALETTES_C) ] || \
	    find graphics/png -name '*.png' -newer $(CARD_GRAPHICS_C) -print -quit 2>/dev/null | grep -q .; then \
		$(CARD6BPP) gen $(GFX); \
	fi

.PHONY: graphics-8bpp graphics-pal card-graphics-force

graphics-8bpp: $(CARD6BPP) | tools
	$(CARD6BPP) gen $(GFX)

graphics-pal: $(CARD6BPP) | tools
	$(CARD6BPP) gen-palettes $(GFX)

card-graphics-force: graphics-8bpp
