# Linny web-view

Besides the **linny.vim JSON indexer** (`./RUNME.sh start`, config in `config/`),
this notebook can also serve your notes as a **searchable static HTML site** using
the [`linny-web-theme`](https://github.com/torreirow/linny-web-theme) Hugo module.

```
./RUNME.sh web          # or: ./start-web.sh
# → http://localhost:9999/
```

You get the geekdoc look: a sidebar file-tree, **built-in full-text search**,
taxonomy pages (customer / project / type / tags), per-note **Created + Updated**
dates, and two paginated **overview pages** (all notes by title / by date).

## Requirements

- **Hugo** extended, ≥ 0.100
- **Go** ≥ 1.21 on `PATH` (Hugo Modules fetch the theme via `go`)
- **python3** (for `fence.py`, see below)

The first run fetches the theme module (`hugo mod get`). It's pinned in `go.mod` /
`go.sum`; bump it later with `hugo mod get -u github.com/torreirow/linny-web-theme`.

## How it works

- **`hugo-web.yaml`** — the web config, kept **separate** from the linny.vim
  indexer in `config/`. `start-web.sh` serves it with `--configDir doesnotexist`
  so the indexer config is not merged. Hugo only merges `params` from a theme, so
  taxonomies / menu / markup / frontmatter / `enableGitInfo` live in this file.
- **`start-web.sh`** — fetches the theme, runs `fence.py` on a **staging copy** of
  `content/` (your notes stay untouched), then `hugo server` on port 9999.
- **`fence.py`** — wraps contiguous box-drawing CLI output (e.g. `aws … --output
  table`, U+2500–U+259F) in a ` ```text ` fence so it renders as a monospace
  table instead of a mangled paragraph. Runs before Hugo (a theme only sees
  already-parsed content), idempotent, on a copy.

## Note front matter

The web-view reads Linny front matter: `crdate` (creation date → shown as
*Created*), and the taxonomies `customer` / `project` / `type` / `tags`. Give
`tags` a **list** value (`tags: [note]`), not a bare string.
