# Card art: graphics/png -> gbagfx 8bpp tiles -> card6bpp 6bpp -> src/card_graphics.c
CARD_GRAPHICS_PNG := $(wildcard graphics/png/*.png)

$(CARD_GRAPHICS_C): $(CARD6BPP) $(CARD_GRAPHICS_PNG) | tools
	$(CARD6BPP) gen $(GFX)

# Manual rebuild of intermediates (filenames may contain spaces)
graphics-8bpp: $(CARD6BPP) $(CARD_GRAPHICS_PNG) | tools
	$(CARD6BPP) gen $(GFX)

graphics-6bpp: graphics-8bpp
