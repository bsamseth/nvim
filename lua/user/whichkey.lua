local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	return
end

wk.setup({
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		["<space>"] = "SPC",
		["<cr>"] = "RET",
		["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "none", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 1, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "center", -- align columns left, center or right
	},
	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
})

--Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

wk.register({
	h = { "<cmd>nohlsearch<cr>", "Clear highlights" },
	e = { "<cmd>NvimTreeToggle<cr>", "File tree" },
	q = { "<cmd>cclose<cr>", "Close quickfix" },
	f = {
		name = "Find",
		f = { ":Telescope find_files<cr>", "Files" },
		g = { ":Telescope live_grep<cr>", "Grep" },
		p = { ":Telescope projects<cr>", "Projects" },
		b = { ":Telescope buffers<cr>", "Buffers" },
		k = { ":Telescope keymaps<cr>", "Keymaps" },
		t = { ":Telescope colorscheme<cr>", "Themes" },
	},
	g = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Lazygit" },
    -- These are defined in gitsigns.lua, here they are only made part of WhichKey.
    s = { "Stage hunk"},
    u = { "Unstage hunk"},
    r = { "Reset hunk"},
    S = { "Stage buffer"},
    R = { "Reset buffer"},
    p = { "Preview hunk"},
    b = { "Blame line"},
    B = { "Blame line full"},
    t = { "Toggle blame"},
    d = { "Diff"},
	},
	d = {
		name = "DAP",
		b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle breakpoint" },
		c = { "<cmd>lua require'dap'.continue()<cr>", "Start/Continue" },
		i = { "<cmd>lua require'dap'.step_into()<cr>", "Step into" },
		o = { "<cmd>lua require'dap'.step_over()<cr>", "Step over" },
		O = { "<cmd>lua require'dap'.step_out()<cr>", "Step out" },
		r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
		l = { "<cmd>lua require'dap'.run_last()<cr>", "Run last" },
		u = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
		t = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
	},
	l = {
		name = "LSP",
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format file" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "LSP install" },
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action" },
		j = { "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", "Next diagnostic" },
		k = { "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "Prev diagnostic" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature help" },
		q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Set loc list" },
		h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Help" },
	},
}, {
	prefix = "<leader>",
})
