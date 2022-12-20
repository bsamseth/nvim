local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- -- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs" })
	use({ "numToStr/Comment.nvim" })
	use({ "tpope/vim-repeat" })
	use({ "tpope/vim-surround" })
	use({ "kyazdani42/nvim-web-devicons" })
	-- use({ "kyazdani42/nvim-tree.lua" })
	-- use({ "akinsho/bufferline.nvim" })
	use({ "moll/vim-bbye" })
	use({ "nvim-lualine/lualine.nvim" })
	use({ "akinsho/toggleterm.nvim" })
	use({ "ahmedkhalf/project.nvim" })
	use({ "lewis6991/impatient.nvim" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "folke/which-key.nvim" })
	use({ "ggandor/leap.nvim" })
	use({ "max397574/better-escape.nvim" })
	use({ "fgheng/winbar.nvim" })
	use({ "kmonad/kmonad-vim" })
	use({ "Pocco81/auto-save.nvim" })
	use({ "folke/zen-mode.nvim" })
	use({ "smithbm2316/centerpad.nvim" })

	-- Colorschemes
	use({ "folke/tokyonight.nvim" })
	use({ "lunarvim/darkplus.nvim" })
	use({ "sainnhe/gruvbox-material" })

	-- LSP and completion
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
			{ "jose-elias-alvarez/null-ls.nvim" },
		},
	})
	-- cmp plugins
	use({ "hrsh7th/cmp-nvim-lsp-signature-help" })
	use({ "hrsh7th/cmp-emoji" })

	-- snippets
	use({ "L3MON4D3/LuaSnip" }) --snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

	-- LSP
	use({ "RRethy/vim-illuminate" })
	use({ "simrat39/rust-tools.nvim" })

	-- Telescope
	use({ "nvim-telescope/telescope.nvim" })
	use({ "nvim-telescope/telescope-file-browser.nvim" })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter" })
	use({ "nvim-treesitter/nvim-treesitter-textobjects" })
	use({ "nvim-treesitter/playground" })

	-- Git
	use({ "lewis6991/gitsigns.nvim" })

	-- DAP
	use({ "mfussenegger/nvim-dap" })
	use({ "rcarriga/nvim-dap-ui" })
	use({ "ravenxrz/DAPInstall.nvim" })

	-- Testing
	use({ "antoinemadec/FixCursorHold.nvim" }) -- required by neotest
	use({ "nvim-neotest/neotest" })
	use({ "nvim-neotest/neotest-python" })
	use({ "rouge8/neotest-rust" })

	-- Copilot
	-- TODO: Try again to make copilot.lua + cmp work.
	-- Need the official plugin to do authentication, then it can be deleted.
	-- Install, run :Copilot, uninstall.
	use({ "github/copilot.vim" })
	-- Then, install lua version of the plugin. Initialize after statusline to defer + not cause flickering.
	-- Remaining config in nvim-cmp config.
	--[[ use({ ]]
	--[[ 	"zbirenbaum/copilot.lua", ]]
	--[[ 	after = "lualine.nvim", ]]
	--[[ 	config = function() ]]
	--[[ 		vim.defer_fn(function() ]]
	--[[ 			require("copilot").setup() ]]
	--[[ 		end) ]]
	--[[ 	end, ]]
	--[[ }) ]]
	--[[ use({ ]]
	--[[ 	"zbirenbaum/copilot-cmp", ]]
	--[[ 	after = "copilot.lua", ]]
	--[[ 	config = function() ]]
	--[[ 		require("copilot_cmp").setup({ ]]
	--[[ 			method = "getCompletionsCycling", ]]
	--[[ 			formatters = { ]]
	--[[ 				insert_text = require("copilot_cmp").format.remove_existing, ]]
	--[[ 			}, ]]
	--[[ 		}) ]]
	--[[ 	end, ]]
	--[[ }) ]]

	-- harpoon
	use({ "ThePrimeagen/harpoon" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
