# Card art from graphics/png/cards (paths contain spaces — never list as make prerequisites):
#   convert_graphics.py: PNG -> .8bpp -> .6bpp  (build direction)
#
# card_graphics.o/card_icons.o don't list each .6bpp/.8bpp as a prerequisite
# (see scaninc note above). The main Makefile adds `| graphics` on all $(OBJS)
# so conversion always runs before compile. These recipes no-op when PNGs are
# up to date; run `make graphics` alone to force the same checks without a full build.
# Or use `make SKIP_GRAPHICS=1` when generated 6bpp/8bpp is already present.

.PHONY: convert-graphics convert-icons graphics

graphics: tools convert-graphics convert-icons

convert-graphics: $(GFX)
	@if [ -z "$$(find graphics/6bpp/cards -maxdepth 1 -name '*.6bpp' -print -quit 2>/dev/null)" ] || \
	    find graphics/png/cards -name '*.png' -newer graphics/6bpp -print -quit 2>/dev/null | grep -q .; then \
		echo 'Running convert_graphics.py (PNGs newer than 6bpp or 6bpp missing)…'; \
		python3 convert_graphics.py; \
	fi

# card_graphics.c, card_palettes.c and card_icons.c are static source files.

convert-icons: $(GFX)
	@echo 'Checking card icon graphics...'
	@if [ -z "$$(find graphics/8bpp/cards/icons -maxdepth 1 -name '*.8bpp' -print -quit 2>/dev/null)" ] || \
	    find graphics/png/cards/icons -name '*.png' -newer graphics/8bpp/cards/icons -print -quit 2>/dev/null | grep -q .; then \
		echo 'Running convert_icons.py (PNGs newer than 8bpp or 8bpp missing)...'; \
		python3 convert_icons.py --build; \
	fi

.PHONY: graphics-8bpp graphics-pal card-graphics-force

graphics-8bpp: $(CARD6BPP) | tools
	$(CARD6BPP) gen $(GFX)

graphics-pal: $(CARD6BPP) | tools
	$(CARD6BPP) gen-palettes $(GFX)

card-graphics-force: graphics-8bpp
