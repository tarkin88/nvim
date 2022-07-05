" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
call plug#begin('~/.config/nvim/autoload/plugged')

" ---------------------------------------
"            Colors
" ---------------------------------------
  Plug 'sainnhe/everforest'
  " Plug 'NTBBloodbath/doom-one.nvim'
  Plug 'nvim-treesitter/nvim-treesitter'
  " Plug 'tweekmonster/startuptime.vim'
" ---------------------------------------
"            General stuff
" ---------------------------------------
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'kristijanhusak/vim-carbon-now-sh', { 'on':  'CarbonNowSh' }
  Plug 'tpope/vim-commentary', { 'on':  'Commentary' }
  Plug 'itchyny/lightline.vim'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
  Plug 'lewis6991/impatient.nvim'
  " ---------------------------------------
  "            Code Quality
  " ---------------------------------------
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'honza/vim-snippets'
  " ---------------------------------------
  "            Navigation
  " ---------------------------------------
  Plug 'goolord/alpha-nvim'
  Plug 'airblade/vim-rooter'
  Plug 'ibhagwan/fzf-lua'
  Plug 'vijaymarupudi/nvim-fzf'
  Plug 'kyazdani42/nvim-web-devicons' 
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'akinsho/bufferline.nvim'
  Plug 'liuchengxu/vista.vim', {'on': 'Vista'}
  Plug 'farmergreg/vim-lastplace'
  Plug 'folke/twilight.nvim'
  Plug 'folke/zen-mode.nvim', {'on': 'ZenMode'}
  Plug 'pechorin/any-jump.vim', {'on': 'AnyJump'}
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
