# Card art: graphics/png -> gbagfx 8bpp -> card6bpp 6bpp -> src/card_graphics.c
# Palettes: graphics/pal/*.gbapal -> src/card_palettes.c
#
# PNG/palette paths contain spaces; never list them as make prerequisites.

$(CARD_GRAPHICS_C) $(CARD_PALETTES_C): $(CARD6BPP) | tools
	@if [ ! -f $(CARD_GRAPHICS_C) ] || [ ! -f $(CARD_PALETTES_C) ] || \
	    find graphics/png -name '*.png' -newer $(CARD_GRAPHICS_C) -print -quit 2>/dev/null | grep -q . || \
	    find graphics/pal -name '*.gbapal' -newer $(CARD_PALETTES_C) -print -quit 2>/dev/null | grep -q .; then \
		$(CARD6BPP) gen $(GFX); \
	fi

.PHONY: graphics-8bpp graphics-pal card-graphics-force

# Force full regen (e.g. after editing PNGs)
graphics-8bpp: $(CARD6BPP) | tools
	$(CARD6BPP) gen $(GFX)

graphics-pal: $(CARD6BPP) | tools
	$(CARD6BPP) gen-palettes

card-graphics-force: graphics-8bpp
