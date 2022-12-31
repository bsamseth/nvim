-- This contains general keymaps that have no place in Which Key. This means
-- keymaps that are triggered directly, not hidden behind some prefix key(s).
-- Most custom keybinds should be added to whichkey.lua instead of this file.

local keymaps = function(mode, lhs, rhs)
	local opts = { noremap = true, silent = true }
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
keymaps("n", "<C-h>", "<C-w>h")
keymaps("n", "<C-j>", "<C-w>j")
keymaps("n", "<C-k>", "<C-w>k")
keymaps("n", "<C-l>", "<C-w>l")
keymaps("n", "<C-Left>", "<C-w>h")
keymaps("n", "<C-Down>", "<C-w>j")
keymaps("n", "<C-Up>", "<C-w>k")
keymaps("n", "<C-Right>", "<C-w>l")

-- Resize with arrows
keymaps("n", "<C-S-Up>", ":resize -2<CR>")
keymaps("n", "<C-S-Down>", ":resize +2<CR>")
keymaps("n", "<C-S-Left>", ":vertical resize -2<CR>")
keymaps("n", "<C-S-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
keymaps("n", "<S-l>", ":bnext<CR>")
keymaps("n", "<S-Right>", ":bnext<CR>")
keymaps("n", "<S-h>", ":bprevious<CR>")
keymaps("n", "<S-Left>", ":bprevious<CR>")

-- Better paste
keymaps("v", "p", '"_dP')

-- Visual --
-- Stay in indent mode
keymaps("v", "<", "<gv")
keymaps("v", ">", ">gv")
