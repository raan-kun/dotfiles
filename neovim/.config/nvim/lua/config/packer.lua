local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print 'Installing packer close and reopen Neovim...'
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost */lua/config/packer.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'single' }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
	-- Essentials & dependencies
	use 'wbthomason/packer.nvim'
    use 'tpope/vim-obsession'
    use 'tpope/vim-repeat'
    use 'nvim-lua/plenary.nvim'
    use 'glepnir/dashboard-nvim'
    use {
      "ahmedkhalf/project.nvim",
      config = function()
        require("project_nvim").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }

    -- Visual
	use 'kyazdani42/nvim-web-devicons'
    use 'lukas-reineke/indent-blankline.nvim'
	use 'nvim-lualine/lualine.nvim'
    -- use 'feline-nvim/feline.nvim'
    -- use 'kdheepak/tabline.nvim'
    use 'folke/lsp-colors.nvim'

    -- Editing basics
    use 'tpope/vim-surround'
	use 'numToStr/Comment.nvim'
    use 'bronson/vim-visual-star-search'
    use 'matze/vim-move'

	-- My plugins here
	--use 'JoosepAlviste/nvim-ts-context-commentstring'
	use 'kyazdani42/nvim-tree.lua'
	--use 'akinsho/bufferline.nvim'
	--use 'moll/vim-bbye'
	use 'akinsho/toggleterm.nvim'
	--use 'lewis6991/impatient.nvim'
	--use 'goolord/alpha-nvim'

	-- Colorschemes
	use 'folke/tokyonight.nvim'
	use 'lunarvim/darkplus.nvim'
	use 'catppuccin/nvim'
    use 'EdenEast/nightfox.nvim'
    use 'sainnhe/sonokai'
    use 'arcticicestudio/nord-vim'
    use 'dracula/vim'
    use 'marko-cerovac/material.nvim'

	-- cmp plugins
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'saadparwaiz1/cmp_luasnip'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lua'

	-- snippets
	use 'L3MON4D3/LuaSnip'
	--use 'rafamadriz/friendly-snippets'

	-- LSP
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	use 'jose-elias-alvarez/null-ls.nvim'
	use 'RRethy/vim-illuminate'
    use 'folke/trouble.nvim'

	-- Telescope
	use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'

	-- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate",
    }
	use 'windwp/nvim-autopairs'
	use 'windwp/nvim-ts-autotag'

	-- Git
	--use 'lewis6991/gitsigns.nvim'

	-- DAP
	--use 'mfussenegger/nvim-dap'
	--use 'rcarriga/nvim-dap-ui'
	--use 'ravenxrz/DAPInstall.nvim'

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
        require('packer').sync()
	end
end)
