# Card art from graphics/png/cards (paths contain spaces — never list as make prerequisites):
#   convert_graphics.py: PNG -> .8bpp -> .6bpp  (build direction)
#
# Not wired into the normal build (card_graphics.o/card_icons.o don't depend
# on these) -- run `make graphics` explicitly after changing any card art or
# icon PNGs. Keeps regular builds from re-scanning thousands of PNGs every time.

.PHONY: convert-graphics convert-icons graphics

graphics: convert-graphics convert-icons

convert-graphics:
	@if find graphics/png/cards -name '*.png' -newer graphics/6bpp -print -quit 2>/dev/null | grep -q . || \
	    [ ! -d graphics/6bpp ] || [ -z "$$(ls -A graphics/6bpp 2>/dev/null)" ]; then \
		echo 'Running convert_graphics.py (PNGs newer than 6bpp or 6bpp missing)…'; \
		python3 convert_graphics.py; \
	fi

# card_graphics.c, card_palettes.c and card_icons.c are static source files.

convert-icons:
	@echo 'Checking card icon graphics...'
	@if find graphics/png/cards/icons -name '*.png' -newer graphics/8bpp/cards/icons -print -quit 2>/dev/null | grep -q . || \
	    [ ! -d graphics/8bpp/cards/icons ] || [ -z "$$(ls -A graphics/8bpp/cards/icons 2>/dev/null)" ]; then \
		echo 'Running convert_icons.py (PNGs newer than 8bpp or 8bpp missing)...'; \
		python3 convert_icons.py --build; \
	fi

.PHONY: graphics-8bpp graphics-pal card-graphics-force

graphics-8bpp: $(CARD6BPP) | tools
	$(CARD6BPP) gen $(GFX)

graphics-pal: $(CARD6BPP) | tools
	$(CARD6BPP) gen-palettes $(GFX)

card-graphics-force: graphics-8bpp
