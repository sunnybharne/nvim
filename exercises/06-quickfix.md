# Quickfix List Step-by-Step Guide

Master the Quickfix list to review, navigate, and edit across many matches fast.

---

## What is Quickfix? How is it different from Location List?

- Quickfix list: A global list of items (errors, grep results, search hits) shared across windows.
- Location list: Like quickfix, but scoped to a single window. You can have one per window.

You’ll mostly use Quickfix for project-wide tasks; use Location list for window-local tasks.

---

## Step 1: Open and Close the Quickfix Window

Commands:
- `:copen` — Open the quickfix window
- `:cclose` — Close the quickfix window
- `:cwindow` — Toggle open only if there are items (handy!)

Exercise:
1. Run `:copen` (it may be empty right now)
2. Run `:cclose`
3. Run `:cwindow` to toggle

---

## Step 2: Populate Quickfix with Telescope

Telescope can populate the quickfix list from any picker.

Keys inside Telescope:
- `<C-q>` — Send all selected items to Quickfix
- `<Tab>` — Toggle selection for the current row
- `<S-Tab>` — Unselect row

Exercises:
1. Project-wide grep:
   - `<Space>fg` → type a term (e.g., `function`)
   - Press `<C-q>` → Opens quickfix with results
   - `:copen` if not automatically opened
2. Diagnostics to quickfix:
   - `<Space>fd` → diagnostics picker
   - `<C-q>` → Send diagnostics to quickfix

---

## Step 3: Populate via Grep/Vimgrep (Built-in)

Commands:
- `:grep <pattern> [files]` — Uses your &grepprg (ripgrep if configured)
- `:vimgrep /pattern/gj **/*.lua` — Built-in Vim grep
- `:cgetexpr` / `:caddexpr` — Programmatic population (advanced)

Exercises:
1. `:vimgrep /TODO/gj **/*`
2. `:copen` → inspect list
3. `:cclose`

Notes:
- Flags: `g` (all matches), `j` (don’t jump automatically)
- Use `**/*` for recursive search (requires `set path+=**` or modern globbing)

---

## Step 4: Navigate Quickfix Items

Commands:
- `:cnext` (or `:cn`) — Next item
- `:cprev` (or `:cp`) — Previous item
- `:cfirst` — First item
- `:clast` — Last item
- `:colder` / `:cnewer` — Switch between older/newer quickfix lists (history)

Exercise:
1. Populate quickfix (Step 2)
2. `:cn` repeatedly to jump through results
3. `:cp` to go back
4. `:cfirst`, `:clast` to bound-check

Pro tip:
- Map keys if you like (optional): `nnoremap ]q :cnext<CR>` and `nnoremap [q :cprev<CR>`

---

## Step 5: Edit Across All Matches with :cdo

Command:
- `:cdo {cmd}` — Run a command for each quickfix item’s buffer

Typical use: search and replace across many files.

Exercise (safe practice):
1. Grep for a harmless token, e.g., `foobar`
   - `<Space>fg` → type `foobar` → `<C-q>`
2. Dry-run replace in each file (ask confirmation):
   - `:cdo s/foobar/barfoo/gc`
3. Use `y`/`n`/`a`/`q` confirmations
4. Save all edited files: `:wa`

Notes:
- `c` flag asks for confirmation per match
- Omit `c` to apply blindly (be careful)

---

## Step 6: File-Level Commands with :cfdo

Command:
- `:cfdo {cmd}` — Run a command once per file in quickfix

Examples:
- Format all files: `:cfdo lua vim.lsp.buf.format({ async = false }) | w`
- Run `:Sort` or other file-scope commands per file

Exercise:
1. Populate quickfix with `**/*.lua`
2. `:cfdo normal! gg=G | w` — Reindent and save each file

---

## Step 7: Use Gitsigns to Populate Quickfix

Keymaps (from this config):
- `<Space>hQ` — Send all hunks (project) to quickfix
- `<Space>hq` — Send current file’s hunks to quickfix

Exercise:
1. Make changes in a few files
2. `<Space>hq` in a changed file
3. `:copen` → jump through changes with `:cn` / `:cp`

Use case:
- Review and navigate all changes via quickfix list

---

## Step 8: Location List (Window-Local Quickfix)

Commands (location list):
- `:lopen` / `:lclose` — Open/close location list
- `:lnext` / `:lprev` — Navigate
- `:lfirst` / `:llast` — Bounds
- `:lgrep` / `:lvimgrep` — Populate for this window only

When to use:
- Keep global quickfix for one task, and a separate window-local list for another

---

## Step 9: Quality-of-Life Tips

- `:cwindow` opens quickfix only when it has items — great in mappings
- Set height: `:set cwh=10` (or add to your config)
- Toggle quickly with a mapping, e.g., `nnoremap <leader>q :cwindow<CR>`
- Quickfix supports folds and window commands (it’s just a window)

---

## Practice Challenges

1) Project Grep → Fix → Verify
- `<Space>fg` → search `TODO`
- `<C-q>` → send to quickfix
- `:copen` → review
- `:cdo s/TODO/DONE/gc` → replace with confirmation
- `:wa` → save all

2) Diagnostics Sprint
- Introduce some lint errors
- `<Space>fd` → diagnostics picker → `<C-q>`
- `:cn` / `:cp` to jump and fix
- `:wa`

3) Refactor Helper Name
- Grep old function → `<C-q>`
- `:cdo s/old_helper/new_helper/gc`
- `:wa`
- `:DiffviewOpen HEAD~1..HEAD` to review the refactor

4) Review Git Changes with Quickfix
- Make changes in multiple files
- `<Space>hQ` → populate quickfix with hunks
- `:cn` through each change and fix up

---

## Cheat Sheet

Quickfix Window:
- `:copen` / `:cclose` / `:cwindow`

Navigate:
- `:cn`, `:cp`, `:cfirst`, `:clast`
- `:colder`, `:cnewer` (history)

Populate:
- Telescope `<C-q>` (any picker)
- `:vimgrep /pat/gj **/*`
- `:grep pat **/*`
- Gitsigns `<Space>hq` / `<Space>hQ`

Batch Ops:
- `:cdo {cmd}` — each match
- `:cfdo {cmd}` — each file

Location List:
- `:lopen` / `:lclose`
- `:lnext` / `:lprev`

---

You now have a power tool for mass navigation and batch editing. Combine it with Telescope and Diffview for a complete review + refactor workflow.
