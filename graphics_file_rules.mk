# Card art from graphics/png/cards (paths contain spaces — never list as make prerequisites):
#   convert_graphics.py: PNG -> .8bpp -> .6bpp  (build direction)

.PHONY: convert-graphics

convert-graphics:
	@if find graphics/png/cards -name '*.png' -newer graphics/6bpp -print -quit 2>/dev/null | grep -q . || \
	    [ ! -d graphics/6bpp ] || [ -z "$$(ls -A graphics/6bpp 2>/dev/null)" ]; then \
		echo 'Running convert_graphics.py (PNGs newer than 6bpp or 6bpp missing)…'; \
		python convert_graphics.py; \
	fi

# Ensure 6bpp files exist before card_graphics.o is assembled
$(C_BUILDDIR)/card_graphics.o: | convert-graphics

$(CARD_GRAPHICS_C) $(CARD_PALETTES_C): $(CARD6BPP) | tools
	@if [ ! -f $(CARD_GRAPHICS_C) ] || [ ! -f $(CARD_PALETTES_C) ] || \
	    find graphics/png/cards -name '*.png' -newer $(CARD_GRAPHICS_C) -print -quit 2>/dev/null | grep -q .; then \
		$(CARD6BPP) gen $(GFX); \
	fi

.PHONY: graphics-8bpp graphics-pal card-graphics-force

graphics-8bpp: $(CARD6BPP) | tools
	$(CARD6BPP) gen $(GFX)

graphics-pal: $(CARD6BPP) | tools
	$(CARD6BPP) gen-palettes $(GFX)

card-graphics-force: graphics-8bpp
