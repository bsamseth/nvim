local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.nvim_workspace({})
lsp.setup()

local null_ls = require("null-ls")
local null_opts = lsp.build_options("null-ls", {})
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
null_ls.setup({
	debug = false,
	on_attach = function(client, bufnr)
		null_opts.on_attach(client, bufnr)
	end,
	sources = {
		formatting.isort.with({ extra_args = { "--profile", "black" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		-- diagnostics.flake8,
		diagnostics.mypy,
	},
})

-- Rust spesifics:
local rust_lsp = lsp.build_options("rust_analyzer", {})
require("rust-tools").setup({ server = rust_lsp })
require("rust-tools").inlay_hints.enable()
