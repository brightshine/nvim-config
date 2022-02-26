call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter' , {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-tree.lua'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'

" Vim LSP fuzzy
Plug 'ojroques/nvim-lspfuzzy'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'sharkdp/fd'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'liuchengxu/vista.vim'

"Plug 'Chiel92/vim-autoformat'
Plug 'rhysd/vim-clang-format'

" swtich between source files and header files quickly.
Plug 'vim-scripts/a.vim'

" Move between Vim panes and tmux splits seamlessly
Plug 'christoomey/vim-tmux-navigator'

" update gtags database in background automatically on file change.
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

" colorscheme
Plug 'ayu-theme/ayu-vim'
Plug 'lifepillar/vim-gruvbox8'
Plug 'lifepillar/vim-colortemplate'
Plug 'sainnhe/sonokai'

" To check
Plug 'tpope/vim-projectionist'
Plug 'aceofall/gtags.vim'
Plug 'rking/ag.vim'
Plug 'peterhoeg/vim-qml'

"""""""""""""""""" TO LEARN """""""""""""""""""""""""""""""""""""""
" Async plugin for vim and neovim to ease the use of ctags/gtags
"Plug 'jsfaint/gen_tags'

" Neovim thin wrapper for GDB, LLDB and PDB
"Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
"
"Plug 'prabirshrestha/async.vim'

call plug#end()


" Enable true color 启用终端24位色
"if exists('+termguicolors')
"  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"  set termguicolors
"endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua require('basic')
lua require('keymaps')
lua require('plugins/nvim-treesitter')
lua require('plugins/nvim-tree')
lua require('plugins/vista')
lua require('plugins/telescope')

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

" ################ vim-clang-format #########################
let g:clang_format#detect_style_file = 1 "Auto detect the style file
let g:clang_format#auto_format = 1

lua << EOF
require'lspconfig'.clangd.setup{}
require('lspfuzzy').setup {}
EOF

set path+=~/src/dev-geoexpansion/**/Interface
set path+=~/src/dev-geoexpansion/**/Implementation
set path+=/home/hsiehd/src/dev-geoexpansion/Framework/ThirdParty/NavCloudCL/Implementation/include
set path+=/home/hsiehd/src/dev-geoexpansion/Engines/UserProfile/ActiveUserProfileManager/Interface

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

let g:gutentags_ctags_exclude = [
  \'node_modules', '_build', 'build', 'CMakeFiles', '.mypy_cache', 'venv',
  \'*.md', '*.tex', '*.css', '*.html', '*.json', '*.xml', '*.xmls', '*.ui',
  \'*.js', '*.java', '*.txt' ]

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
