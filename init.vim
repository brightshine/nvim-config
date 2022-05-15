call plug#begin()
" Syntax tree
Plug 'nvim-treesitter/nvim-treesitter' , {'do': ':TSUpdate'}

" File explorer
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'

" LSP
Plug 'neovim/nvim-lspconfig'
" Plug 'williamboman/nvim-lsp-installer'
" performant UI
Plug 'glepnir/lspsaga.nvim'
"Clangd's off-spec features for neovim's LSP client.
Plug 'p00f/clangd_extensions.nvim'

" CCLS
Plug 'm-pilia/vim-ccls'

" Fuzzy search
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'sharkdp/fd'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Side bar
Plug 'liuchengxu/vista.vim'

" Tabs
Plug 'romgrk/barbar.nvim'

" Code format
Plug 'rhysd/vim-clang-format'

" swtich between source files and header files quickly.
Plug 'vim-scripts/a.vim'

" Move between Vim panes and tmux splits seamlessly
Plug 'christoomey/vim-tmux-navigator'

" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" pictograms for completion items 
Plug 'onsails/lspkind-nvim'
" Add signature to completion
Plug 'ray-x/lsp_signature.nvim'

" Snipper engine
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" colorscheme
Plug 'ayu-theme/ayu-vim'
Plug 'lifepillar/vim-gruvbox8'
Plug 'lifepillar/vim-colortemplate'
Plug 'sainnhe/sonokai'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tanvirtin/monokai.nvim'

" Save session
Plug 'tpope/vim-obsession'

" To check
Plug 'tpope/vim-projectionist'
Plug 'aceofall/gtags.vim'
Plug 'rking/ag.vim'
Plug 'peterhoeg/vim-qml'

" Debugger
Plug 'mfussenegger/nvim-dap'
Plug 'Pocco81/DAPInstall.nvim'

Plug 'emilienlemaire/clang-tidy.nvim'

"""""""""""""""""" TO LEARN """""""""""""""""""""""""""""""""""""""
" Async plugin for vim and neovim to ease the use of ctags/gtags
"Plug 'jsfaint/gen_tags'

" Neovim thin wrapper for GDB, LLDB and PDB
"Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
"
"Plug 'prabirshrestha/async.vim'
"
"Plug vscode-neovim/vscode-neovim

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua require('core/basic')
lua require('core/keymaps')
lua require('lsp/nvim-lspconfig')
lua require('plugins/nvim-treesitter')
lua require('plugins/nvim-tree')
lua require('plugins/vista')
lua require('plugins/telescope')
lua require('plugins/barbar')
lua require('plugins/nvim-cmp')
lua require('plugins/nvim-dap')
"lua require('plugins/clang-tidy')
lua require('plugins/clangd-extension')
lua require('theme/monakai')
lua require('theme/sonaki')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hotkey mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F1> :make -C %:h <CR>
map <F2> :up<CR>
map <F3> :up<CR>:q<CR>
map <F4> :q!<CR>
map <F7> :if exists("syntax_on") <BAR>
			\   syntax off <BAR><CR>
			\ else <BAR>
			\   syntax enable <BAR>
			\ endif <CR>
map <F8> :set hls!<BAR>set hls?<CR>
map <F9> :set foldmethod=manual<CR>
map <F10> :set foldmethod=syntax<CR>
map <F11> :set foldmethod=indent<CR>
map <F12> :set foldmethod=expr<CR>
map <F12> :set foldmethod=expr<CR>


" ################ vim-clang-format #########################
let g:clang_format#detect_style_file = 1 "Auto detect the style file
let g:clang_format#auto_format = 1

let g:vimspector_enable_mappings = 'HUMAN'
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

" Auto rename tmux window to the file name
"autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window '" . expand("%:t") . "'")
"autocmd VimLeave * call system("tmux rename-window 'tmux'")
"
