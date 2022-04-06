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

" Update gtags database in background automatically on file change.
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'skywind3000/gutentags_plus'

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
lua require('basic')
lua require('keymaps')
lua require('plugins/nvim-treesitter')
lua require('plugins/nvim-tree')
lua require('plugins/vista')
lua require('plugins/telescope')
lua require('plugins/barbar')
lua require('plugins/nvim-cmp')
lua require('plugins/monakai')
lua require('plugins/nvim-dap')
lua require('plugins/clangd-extension')

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
map <F10> :set foldmethod=syntax<CR>
map <F11> :set foldmethod=indent<CR>
map <F12> :set foldmethod=expr<CR>

" ################ vim-clang-format #########################
let g:clang_format#detect_style_file = 1 "Auto detect the style file
let g:clang_format#auto_format = 1

" ----------gutentags.vim插件配置-----------------------------------
" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']

" config project root markers.
let g:gutentags_project_root = ['.git']

"" 所生成的數據文件的名稱
let g:gutentags_ctags_tagfile = '.tags'

" 同時開啟 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
  let g:gutentags_modules += ['gtags_cscope']
endif

let g:gutentags_ctags_exclude = [ 'node_modules', '_build', 'build', 'CMakeFiles', '.mypy_cache', 'venv', '*.md', '*.tex', '*.css', '*.html', '*.json', '*.xml', '*.xmls', '*.ui', '*.js', '*.java', '*.txt', '*.sh' ]
" 配置 ctags 的參數
let g:gutentags_ctags_extra_args = []
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

let g:gutentags_plus_nomap = 1

" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自動加載 gtags 數據庫的行為
" 避免多個項目數據庫相互干擾,使用plus插件解決問題
let g:gutentags_auto_add_gtags_cscope = 0

"let g:gutentags_define_advanced_commands = 1

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1


let g:vimspector_enable_mappings = 'HUMAN'
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

" Auto rename tmux window to the file name
autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window '" . expand("%:t") . "'")
autocmd VimLeave * call system("tmux rename-window 'tmux'")
