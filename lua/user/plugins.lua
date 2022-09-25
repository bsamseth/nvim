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
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim" })
	use({ "tpope/vim-repeat" })
	use({ "tpope/vim-surround" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "kyazdani42/nvim-tree.lua" })
	use({ "akinsho/bufferline.nvim" })
	use({ "moll/vim-bbye" })
	use({ "nvim-lualine/lualine.nvim" })
	use({ "akinsho/toggleterm.nvim" })
	use({ "ahmedkhalf/project.nvim" })
	use({ "lewis6991/impatient.nvim" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "folke/which-key.nvim" })
	use({ "ggandor/leap.nvim" })
	use({ "max397574/better-escape.nvim" })

	-- Colorschemes
	use({ "folke/tokyonight.nvim" })
	use({ "lunarvim/darkplus.nvim" })
	use({ "sainnhe/gruvbox-material" })

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "hrsh7th/cmp-emoji" })

	-- snippets
	use({ "L3MON4D3/LuaSnip" }) --snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

	-- LSP
	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	use({ "williamboman/nvim-lsp-installer" }) -- simple to use language server installer
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
	use({ "RRethy/vim-illuminate" })
	use({ "simrat39/rust-tools.nvim" })

	-- Telescope
	use({ "nvim-telescope/telescope.nvim" })
	use({ "nvim-telescope/telescope-file-browser.nvim" })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter" })

	-- Git
	use({ "lewis6991/gitsigns.nvim" })
	use({ "tpope/vim-fugitive" })

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

	-- Nvim in every browser text field!?
	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
