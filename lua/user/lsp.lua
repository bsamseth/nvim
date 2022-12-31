local lsp = require("lsp-zero")
lsp.preset("recommended")
lsp.nvim_workspace({})
lsp.ensure_installed({
	"rust_analyzer",
	"pyright",
	"sumneko_lua",
})

-- Overrides for nvim-cmp
local cmp = require("cmp")
lsp.setup_nvim_cmp({
	mapping = lsp.defaults.cmp_mappings({
		["<C-Space>"] = cmp.mapping({
			i = cmp.mapping.complete(),
			c = function(_)
				if cmp.visible() then
					cmp.close()
				else
					cmp.complete()
				end
			end,
		}),
		["<C-l>"] = cmp.mapping(
			cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			}),
			{ "i", "c" }
		),
		["<C-o>"] = cmp.mapping(
			cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			}),
			{ "i", "c" }
		),
		["<C-e>"] = cmp.mapping.abort(),
		["<Tab>"] = cmp.config.disable,
		["<CR>"] = cmp.config.disable,
	}),
	sources = cmp.config.sources({
		{ name = "copilot" },
		{ name = "nvim_lua" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "luasnip" },
		{ name = "emoji" },
		{ name = "path" },
		{ name = "buffer", keyword_length = 4 },
	}),
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	experimental = {
		ghost_text = false,
	},
})

local rust_lsp = lsp.build_options("rust_analyzer", {})
lsp.setup()
vim.diagnostic.config({
	virtual_text = true,
})

require("fidget").setup({})

-- Null-ls
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
local mason_registry = require("mason-registry")
local codelldb = mason_registry.get_package("codelldb"):get_install_path()

require("rust-tools").setup({
	server = rust_lsp,
	dap = {
		adapter = require("rust-tools.dap").get_codelldb_adapter(
			codelldb .. "/extension/adapter/codelldb",
			codelldb .. "/extension/lldb/lib/liblldb.dylib"
		),
	},
})
require("rust-tools").inlay_hints.enable()
