-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]


-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print "packer has a problem"
  return
end


-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


return packer.startup( function(use) 

      use "wbthomason/packer.nvim" -- Have packer manage itself

      -- cmp
      use 'hrsh7th/nvim-cmp'
      use 'hrsh7th/cmp-buffer'
      use 'L3MON4D3/LuaSnip'

      --lsp 
      use "neovim/nvim-lspconfig" -- enable LSP
      use "williamboman/nvim-lsp-installer" -- simple to use language server installer
      use "hrsh7th/cmp-nvim-lsp"

      -- highlight
      use {
          'nvim-treesitter/nvim-treesitter',
          run = ":TSUpdate",
      }

      -- lualine buffers or something
      use {
          'nvim-lualine/lualine.nvim',
          requires = { 'kyazdani42/nvim-web-devicons', opt = true }
      }

      -- file explorer
      --use 'kyazdani42/nvim-tree.lua'
      
      --toggleterm
      use {"akinsho/toggleterm.nvim"}

      -- colorscheme
      use 'joshdick/onedark.vim'
      use 'morhetz/gruvbox'
end)
