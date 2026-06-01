/*
 * card6bpp - Card art pipeline: PNG -> gbagfx 8bpp tiles -> 6bpp tiles.
 *
 * gbagfx writes 80x80 as 100 GBA 8bpp tiles (64 bytes each, pret tile order).
 * 6bpp output uses encode_gba_tile_6bpp_from_indices (Channeler-Advance /
 * editors/common/gba_graphics.py): each 8bpp tile's 64 indices -> 48 bytes.
 */

#include <ctype.h>
#include <dirent.h>
#include <errno.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>

#define CARD_TILES       100
#define CARD_8BPP_SIZE   (CARD_TILES * 64)
#define CARD_6BPP_SIZE   (CARD_TILES * 48)
#define TILE_SIZE_8BPP   64
#define TILE_SIZE_6BPP   48

#define GRAPHICS_PNG_DIR  "graphics/png"
#define GRAPHICS_8BPP_DIR "graphics/8bpp"
#define GRAPHICS_6BPP_DIR "graphics/6bpp"
#define CARD_GRAPHICS_C   "src/card_graphics.c"
#define DEFAULT_GBAGFX    "tools/gbagfx/gbagfx"

/* encode_gba_tile_6bpp_from_indices — 64 row-major indices 0..63 -> 48 bytes */
static void encode_gba_tile_6bpp_from_indices(const uint8_t *indices, uint8_t *out)
{
    unsigned ry, g, k;

    for (ry = 0; ry < 8; ry++) {
        const uint8_t *row_idxs = indices + ry * 8;

        for (g = 0; g < 2; g++) {
            uint32_t v = 0;

            for (k = 0; k < 4; k++)
                v |= (uint32_t)(row_idxs[g * 4 + k] & 0x3F) << (k * 6);

            out[ry * 6 + g * 3 + 0] = (uint8_t)(v & 0xFF);
            out[ry * 6 + g * 3 + 1] = (uint8_t)((v >> 8) & 0xFF);
            out[ry * 6 + g * 3 + 2] = (uint8_t)((v >> 16) & 0xFF);
        }
    }
}

/* gbagfx 8bpp blob is already 100 consecutive GBA 8bpp tiles */
static void tiled_8bpp_to_6bpp(const uint8_t *src_8bpp, uint8_t *dst_6bpp)
{
    unsigned i;

    for (i = 0; i < CARD_TILES; i++)
        encode_gba_tile_6bpp_from_indices(
            src_8bpp + i * TILE_SIZE_8BPP,
            dst_6bpp + i * TILE_SIZE_6BPP);
}

static bool read_file(const char *path, uint8_t **out_data, size_t *out_size)
{
    FILE *f;
    long size;
    uint8_t *data;

    f = fopen(path, "rb");
    if (!f) {
        fprintf(stderr, "error: cannot open '%s': %s\n", path, strerror(errno));
        return false;
    }

    if (fseek(f, 0, SEEK_END) != 0) {
        fprintf(stderr, "error: cannot seek '%s'\n", path);
        fclose(f);
        return false;
    }

    size = ftell(f);
    if (size < 0) {
        fprintf(stderr, "error: cannot size '%s'\n", path);
        fclose(f);
        return false;
    }

    rewind(f);

    data = malloc((size_t)size);
    if (!data) {
        fprintf(stderr, "error: out of memory\n");
        fclose(f);
        return false;
    }

    if (fread(data, 1, (size_t)size, f) != (size_t)size) {
        fprintf(stderr, "error: cannot read '%s'\n", path);
        free(data);
        fclose(f);
        return false;
    }

    fclose(f);
    *out_data = data;
    *out_size = (size_t)size;
    return true;
}

static bool write_file(const char *path, const uint8_t *data, size_t size)
{
    FILE *f;

    f = fopen(path, "wb");
    if (!f) {
        fprintf(stderr, "error: cannot write '%s': %s\n", path, strerror(errno));
        return false;
    }

    if (fwrite(data, 1, size, f) != size) {
        fprintf(stderr, "error: short write to '%s'\n", path);
        fclose(f);
        return false;
    }

    fclose(f);
    return true;
}

static bool needs_update(const char *dst_path, const char *src_path)
{
    struct stat dst_st, src_st;

    if (stat(dst_path, &dst_st) != 0)
        return true;
    if (stat(src_path, &src_st) != 0)
        return true;

    return src_st.st_mtime > dst_st.st_mtime;
}

static bool convert_8bpp_file(const char *src_path, const char *dst_path)
{
    uint8_t *input = NULL;
    uint8_t output[CARD_6BPP_SIZE];
    size_t input_size;
    bool ok = false;

    if (!needs_update(dst_path, src_path))
        return true;

    if (!read_file(src_path, &input, &input_size))
        return false;

    if (input_size != CARD_8BPP_SIZE) {
        fprintf(stderr, "error: '%s' has size %zu, expected %d\n",
            src_path, input_size, CARD_8BPP_SIZE);
        goto finish;
    }

    tiled_8bpp_to_6bpp(input, output);

    if (!write_file(dst_path, output, CARD_6BPP_SIZE)) {
        goto finish;
    }

    ok = true;

finish:
    free(input);
    return ok;
}

static int get_card_index(const char *filename)
{
    const char *dot = strrchr(filename, '.');
    const char *p;

    if (!dot)
        return -1;

    p = dot - 1;
    while (p > filename && *p != '_')
        p--;

    if (*p != '_')
        return -1;

    return atoi(p + 1);
}

static void sanitize_identifier(const char *name, char *out, size_t out_size)
{
    size_t i;

    for (i = 0; name[i] != '\0' && i + 1 < out_size; i++) {
        char c = name[i];

        if (isalnum((unsigned char)c) || c == '_')
            out[i] = c;
        else
            out[i] = '_';
    }
    out[i] = '\0';
}

struct CardEntry {
    char *basename;
    int index;
};

static int compare_entries(const void *a, const void *b)
{
    const struct CardEntry *ea = a;
    const struct CardEntry *eb = b;

    if (ea->index != eb->index)
        return ea->index - eb->index;

    return strcmp(ea->basename, eb->basename);
}

static bool mkdir_p(const char *path)
{
    struct stat st;

    if (stat(path, &st) == 0)
        return S_ISDIR(st.st_mode);

#ifdef _WIN32
    return mkdir(path) == 0 || errno == EEXIST;
#else
    return mkdir(path, 0755) == 0 || errno == EEXIST;
#endif
}

static bool run_gbagfx(const char *gbagfx, const char *png_path, const char *bpp8_path)
{
    char cmd[4096];
    int rc;

    if (!needs_update(bpp8_path, png_path))
        return true;

    snprintf(cmd, sizeof(cmd), "\"%s\" \"%s\" \"%s\"", gbagfx, png_path, bpp8_path);
    rc = system(cmd);
    if (rc != 0) {
        fprintf(stderr, "error: gbagfx failed (%d) for '%s'\n", rc, png_path);
        return false;
    }
    return true;
}

static bool build_8bpp_from_png(const char *gbagfx, const char *png_name)
{
    size_t name_len = strlen(png_name);
    char png_path[512];
    char bpp8_path[512];

    if (name_len < 5 || strcmp(png_name + name_len - 4, ".png") != 0)
        return true;

    snprintf(png_path, sizeof(png_path), "%s/%s", GRAPHICS_PNG_DIR, png_name);
    snprintf(bpp8_path, sizeof(bpp8_path), "%s/%.*s.8bpp",
        GRAPHICS_8BPP_DIR, (int)(name_len - 4), png_name);

    return run_gbagfx(gbagfx, png_path, bpp8_path);
}

static bool cmd_convert(int argc, char **argv)
{
    if (argc < 2) {
        fprintf(stderr, "usage: card6bpp convert <input.8bpp> <output.6bpp>\n");
        return false;
    }

    return convert_8bpp_file(argv[0], argv[1]);
}

static bool cmd_gen(int argc, char **argv)
{
    DIR *dir;
    struct dirent *ent;
    struct CardEntry *entries = NULL;
    size_t count = 0;
    size_t capacity = 0;
    FILE *out;
    size_t i;
    const char *gbagfx = DEFAULT_GBAGFX;
    bool ok = false;

    if (argc >= 2 && argv[1][0] != '\0')
        gbagfx = argv[1];

    if (!mkdir_p(GRAPHICS_8BPP_DIR) || !mkdir_p(GRAPHICS_6BPP_DIR)) {
        fprintf(stderr, "error: cannot create graphics output dirs\n");
        return false;
    }

    dir = opendir(GRAPHICS_PNG_DIR);
    if (!dir) {
        fprintf(stderr, "error: cannot open '%s': %s\n", GRAPHICS_PNG_DIR, strerror(errno));
        return false;
    }

    while ((ent = readdir(dir)) != NULL) {
        size_t name_len = strlen(ent->d_name);
        char src_path[512];
        char dst_path[512];
        char bpp8_name[512];
        int index;
        struct CardEntry *entry;

        if (name_len < 5 || strcmp(ent->d_name + name_len - 4, ".png") != 0)
            continue;

        index = get_card_index(ent->d_name);
        if (index < 0) {
            fprintf(stderr, "error: cannot parse index from '%s'\n", ent->d_name);
            goto finish;
        }

        if (!build_8bpp_from_png(gbagfx, ent->d_name))
            goto finish;

        snprintf(bpp8_name, sizeof(bpp8_name), "%.*s.8bpp", (int)(name_len - 4), ent->d_name);
        snprintf(src_path, sizeof(src_path), "%s/%s", GRAPHICS_8BPP_DIR, bpp8_name);
        snprintf(dst_path, sizeof(dst_path), "%s/%.*s.6bpp",
            GRAPHICS_6BPP_DIR, (int)(name_len - 4), ent->d_name);

        if (!convert_8bpp_file(src_path, dst_path))
            goto finish;

        if (count == capacity) {
            size_t new_cap = capacity == 0 ? 256 : capacity * 2;
            struct CardEntry *new_entries = realloc(entries, new_cap * sizeof(*entries));

            if (!new_entries) {
                fprintf(stderr, "error: out of memory\n");
                goto finish;
            }
            entries = new_entries;
            capacity = new_cap;
        }

        entry = &entries[count++];
        entry->basename = strdup(bpp8_name);
        entry->index = index;
        if (!entry->basename) {
            fprintf(stderr, "error: out of memory\n");
            goto finish;
        }
    }

    closedir(dir);
    dir = NULL;

    if (count == 0) {
        fprintf(stderr, "error: no .png files in '%s'\n", GRAPHICS_PNG_DIR);
        goto finish;
    }

    qsort(entries, count, sizeof(*entries), compare_entries);

    out = fopen(CARD_GRAPHICS_C, "w");
    if (!out) {
        fprintf(stderr, "error: cannot write '%s': %s\n", CARD_GRAPHICS_C, strerror(errno));
        goto finish;
    }

    fprintf(out, "#include \"global.h\"\n\n");

    for (i = 0; i < count; i++) {
        char ident[512];
        char name_only[512];
        const char *basename = entries[i].basename;
        size_t base_len = strlen(basename) - 5;

        if (base_len >= sizeof(name_only)) {
            fprintf(stderr, "error: name too long '%s'\n", basename);
            goto finish;
        }
        memcpy(name_only, basename, base_len);
        name_only[base_len] = '\0';

        sanitize_identifier(name_only, ident, sizeof(ident));
        fprintf(out, "const u32 g%s[] = INCBIN_U32(\"graphics/6bpp/%.*s.6bpp\");\n",
            ident, (int)base_len, basename);
    }

    fclose(out);
    printf("Wrote %zu entries to %s\n", count, CARD_GRAPHICS_C);
    ok = true;

finish:
    if (dir)
        closedir(dir);
    for (i = 0; i < count; i++)
        free(entries[i].basename);
    free(entries);
    return ok;
}

int main(int argc, char **argv)
{
    if (argc < 2) {
        fprintf(stderr, "usage: %s <convert|gen> ...\n", argv[0]);
        fprintf(stderr, "  gen [gbagfx]  - PNG -> 8bpp (gbagfx) -> 6bpp -> src/card_graphics.c\n");
        return 1;
    }

    if (strcmp(argv[1], "convert") == 0)
        return cmd_convert(argc - 2, argv + 2) ? 0 : 1;
    if (strcmp(argv[1], "gen") == 0)
        return cmd_gen(argc - 2, argv + 2) ? 0 : 1;

    fprintf(stderr, "unknown command '%s'\n", argv[1]);
    return 1;
}
