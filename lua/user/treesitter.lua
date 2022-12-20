require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "python", "rust", "vim", "hcl", "json", "toml", "sql" },
	ignore_install = { "" },
	highlight = { enable = true },
	autopairs = { enable = true },
	indent = { enable = true },
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = { query = "@function.outer", desc = "Around function" },
				["if"] = { query = "@function.inner", desc = "Inner function" },
				["ac"] = { query = "@class.outer", desc = "Around class" },
				["ic"] = { query = "@class.inner", desc = "Inner class" },
				["a,"] = { query = "@parameter.outer", desc = "Outer parameter" },
				["i,"] = { query = "@parameter.inner", desc = "Inner parameter" },
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>m"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>M"] = "@parameter.inner",
			},
		},
	},
	playground = {
		enable = true,
		disable = {},
		updatetime = 25,
		persist_queries = false,
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
})
