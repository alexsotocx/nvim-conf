local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end


return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- colorscheme
  use { 'dracula/vim', as = 'dracula' }
  use 'EdenEast/nightfox.nvim'

  -- File filder
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'

  -- Git
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'

  -- File Explorer with Icons
  use 'scrooloose/nerdtree'
  use 'ryanoasis/vim-devicons'

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use 'tpope/vim-commentary'

  -- Run task per project and file
  use 'skywind3000/asynctasks.vim'
  use 'skywind3000/asyncrun.vim'
end)
