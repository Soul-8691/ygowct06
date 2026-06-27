# Card art from graphics/png/cards (paths contain spaces — never list as make prerequisites):
#   convert_graphics.py: PNG -> .8bpp -> .6bpp  (build direction)

.PHONY: convert-graphics

convert-graphics:
	@if find graphics/png/cards -name '*.png' -newer graphics/6bpp -print -quit 2>/dev/null | grep -q . || \
	    [ ! -d graphics/6bpp ] || [ -z "$$(ls -A graphics/6bpp 2>/dev/null)" ]; then \
		echo 'Running convert_graphics.py (PNGs newer than 6bpp or 6bpp missing)…'; \
		python3 convert_graphics.py; \
	fi

# Ensure 6bpp files exist before card_graphics.o is assembled
$(C_BUILDDIR)/card_graphics.o: | convert-graphics

# card_graphics.c, card_palettes.c and card_icons.c are static source files.

.PHONY: convert-icons

convert-icons:
	@echo 'Checking card icon graphics...'
	@if find graphics/png/cards/icons -name '*.png' -newer graphics/8bpp/cards/icons -print -quit 2>/dev/null | grep -q . || \
	    [ ! -d graphics/8bpp/cards/icons ] || [ -z "$$(ls -A graphics/8bpp/cards/icons 2>/dev/null)" ]; then \
		echo 'Running convert_icons.py (PNGs newer than 8bpp or 8bpp missing)...'; \
		python3 convert_icons.py --build; \
	fi

# Ensure icon 8bpp files exist before card_icons.o is assembled
$(C_BUILDDIR)/card_icons.o: | convert-icons

.PHONY: graphics-8bpp graphics-pal card-graphics-force

graphics-8bpp: $(CARD6BPP) | tools
	$(CARD6BPP) gen $(GFX)

graphics-pal: $(CARD6BPP) | tools
	$(CARD6BPP) gen-palettes $(GFX)

card-graphics-force: graphics-8bpp
