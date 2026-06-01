CC = gcc

CFLAGS = -Wall -Wextra -std=gnu11 -O3

ifeq ($(OS),Windows_NT)
EXE := .exe
else
EXE :=
endif

.PHONY: all clean

all: card6bpp$(EXE)
	@:

card6bpp$(EXE): card6bpp.c
	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)

clean:
	$(RM) card6bpp card6bpp.exe
