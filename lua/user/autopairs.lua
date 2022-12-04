require("nvim-autopairs").setup({
	check_ts = true, -- treesitter integration
	disable_filetype = { "TelescopePrompt" },
})
require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done({}))
