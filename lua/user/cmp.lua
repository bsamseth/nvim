local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip/loaders/from_vscode").lazy_load()

local kind_icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
	Copilot = "",
}

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-space>"] = cmp.mapping({
			i = cmp.mapping.complete(),
			c = function(_)
				if cmp.visible() then
					cmp.close()
				else
					cmp.complete()
				end
			end,
		}),

		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<Tab>"] = cmp.config.disable,
		["<CR>"] = cmp.config.disable,
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
	}),
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local f = io.open("/tmp/cmp.log", "a")
			if f ~= nil then
				io.output(f)
				io.write(entry.source.name .. "\n")
			else
				print("error opening file")
			end
			io.close(f)
			vim_item.kind = kind_icons[vim_item.kind]
			vim_item.menu = ({
				copilot = "[copilot]",
				nvim_lsp = "[lsp]",
				nvim_lsp_signature_help = "[lsp]",
				nvim_lua = "[lua]",
				luasnip = "[snip]",
				buffer = "[buf]",
				path = "[path]",
				emoji = "[emoji]",
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = cmp.config.sources({
		{ name = "copilot" },
		{ name = "nvim_lua" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "luasnip" },
		{ name = "emoji" },
		{ name = "path" },
		{ name = "buffer", keyword_length = 5 },
	}),
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	experimental = {
		ghost_text = false,
	},
})
