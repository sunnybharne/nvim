# Gitsigns Step-by-Step Guide

Complete guide to mastering Gitsigns for hunk-level Git operations.

---

## Step 1: Understanding What Gitsigns Shows You

First, let's see what Gitsigns is already doing in your editor:

1. **Make a test change** - Open any file in your nvim config and add a comment
2. **Look at the left gutter** - You'll see symbols:
   - `┃` (green bar) = Added lines
   - `~` (blue tilde) = Modified lines  
   - `▁` (red bar) = Deleted lines

These symbols show your **unstaged changes** in real-time.

---

## Step 2: Navigation (Your Most Important Skill)

Let's practice jumping between changes:

**Exercise:**
1. Open `lua/config/keymaps.lua`
2. Add 3 comments in different places:
```lua
-- Test change 1
-- Test change 2  
-- Test change 3
```
3. Now practice navigation:

| Keymap | Action | Try It |
|--------|--------|--------|
| `]c` | Jump to **next** change | Press `]c` repeatedly |
| `[c` | Jump to **previous** change | Press `[c` to go back |

**Practice drill:** Jump between all 3 changes using only `]c` and `[c` for 30 seconds until it feels natural.

---

## Step 3: Preview Changes (See What You Did)

Now you can jump to changes, but what did you actually change?

**Exercise:**
1. Jump to your first change with `]c`
2. Press `<Space>hp` (hunk preview)

You'll see a **floating window** showing:
- Red lines (old version)
- Green lines (new version)

**Practice:**
- Jump to each change with `]c`
- Preview each with `<Space>hp`
- Close preview with `<Esc>` or `q`

---

## Step 4: Stage Individual Changes (The Power Move)

This is where you become 10x faster than terminal git users.

**Exercise:**
1. Jump to your first change: `]c`
2. Press `<Space>hs` (hunk stage)
3. Notice the gutter symbol **disappears** (it's now staged!)

**The workflow:**
```
]c          → Jump to change
<Space>hp   → Preview it (make sure it's good)
<Space>hs   → Stage it
]c          → Next change
```

**Practice drill:** Stage all 3 of your test changes using this flow.

---

## Step 5: Undo a Stage (Reset Hunk)

Made a mistake? Unstage it!

**Exercise:**
1. Press `<Space>hu` (hunk unstage/undo)
2. The change comes back to unstaged
3. Gutter symbol reappears

**Practice:** Stage and unstage the same change 3 times to build muscle memory.

---

## Step 6: Discard Changes (Be Careful!)

Sometimes you want to throw away a change.

**Exercise:**
1. Jump to a change: `]c`
2. Preview it: `<Space>hp`
3. Press `<Space>hr` (hunk reset/revert)
4. **The change is GONE** - discarded completely

⚠️ **This is destructive** - there's no undo! Always preview first.

---

## Step 7: Visual Mode Selection (Advanced Staging)

Stage only specific lines within a change!

**Exercise:**
1. Make a change with 5 lines:
```lua
-- Line 1
-- Line 2
-- Line 3
-- Line 4
-- Line 5
```
2. Enter visual mode: `V`
3. Select lines 2-4: `jjj`
4. Press `<Space>hs` (stage selected lines only)
5. Lines 1 and 5 stay unstaged!

**This is incredibly powerful** - you can split one change into multiple commits.

---

## Step 8: Diff View (See All Changes)

See all your changes at once:

**Exercise:**
1. Make changes to 3 different files
2. Press `<Space>hd` (hunk diff)
3. You'll see a split showing the diff for current file
4. Press `<Space>hD` for diff against last commit

---

## Step 9: Blame (Who Wrote This?)

See who wrote each line:

**Exercise:**
1. Open any file
2. Press `<Space>hb` (toggle blame)
3. See commit info on each line
4. Press `<Space>hb` again to hide it

---

## Step 10: Real Workflow Practice

Now let's combine everything into a real workflow:

**Challenge:** Make a 2-commit change

1. **Setup:**
   - Open `README.md`
   - Add a new section at the top
   - Add another section at the bottom

2. **First commit (top section only):**
   ```
   ]c              → Jump to first change (top)
   <Space>hp       → Preview it
   <Space>hs       → Stage it
   <Space>gn       → Open Neogit to commit
   ```

3. **Second commit (bottom section):**
   ```
   ]c              → Jump to second change (bottom)
   <Space>hp       → Preview it
   <Space>hs       → Stage it
   <Space>gn       → Commit again
   ```

---

## Gitsigns Cheat Sheet

### Navigation
- `]c` - Next change
- `[c` - Previous change

### Actions (on current hunk)
- `<Space>hp` - **Preview** change (look before you leap!)
- `<Space>hs` - **Stage** change
- `<Space>hu` - **Unstage** change  
- `<Space>hr` - **Reset/Revert** change (⚠️ destructive!)

### Visual Mode
- `V` then select lines, then `<Space>hs` - Stage selected lines only

### View
- `<Space>hd` - Diff current file
- `<Space>hD` - Diff against last commit
- `<Space>hb` - Toggle blame

---

## Practice Challenge

Do this RIGHT NOW to cement the learning:

1. Create a new file: `:e test.lua`
2. Add 10 lines of code
3. Save it: `:w`
4. Make 3 different changes in the file
5. Use `]c` and `[c` to jump between them
6. Preview each with `<Space>hp`
7. Stage them one by one with `<Space>hs`
8. Unstage the middle one with `<Space>hu`
9. Stage it again
10. Open Neogit (`<Space>gn`) and commit

**Time yourself** - you should be able to do this in under 60 seconds once you have muscle memory.

---

**Next:** Once comfortable with Gitsigns, move to `02-neogit.md` for commit and branch management!
