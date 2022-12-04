require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "python", "rust" },
	ignore_install = { "" },
	highlight = { enable = true },
	autopairs = { enable = true },
	indent = { enable = true },
})
