local cmd = vim.cmd
local g = vim.g
local o = vim.o   -- global
local wo = vim.wo -- window-local
local bo = vim.bo -- buffer-local
local opt = vim.opt

-- UTF-8
g.encoding = "UTF-8"
g.fileencoding = "UTF-8"

-- Line number
wo.number = true

-- Memroy, CPU
opt.hidden = true     -- Enable background buffer
opt.lazyredraw = true -- Fast scrolling

-- Colorscheme
opt.termguicolors = true -- Enable 24-bit RGB colors
cmd [[colorscheme sonokai]]			-- my theme

-- Tabs
opt.expandtab = true      -- Use spaces instead of tabs
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.smartindent = true

-- Fold
opt.foldnestmax = 5
opt.foldexpr = 'nvim_treesitter#foldexpr()'



opt.background = "dark"
opt.syntax = "on"

opt.history=50 -- keep 50 lines of command line history
opt.ffs = {unix,dos,mac} -- support all three, in this order

opt.showmatch = true				-- show matching brackets

opt.formatoptions = "mtcql"		-- re-format for chinese

opt.backspace = "2"				  -- make backspace work normal
opt.wildmenu = true				-- turn on wild menu

opt.laststatus = 0
opt.rulerformat = "%l,%c"     -- show current row & column

-- Mouse
opt.mouse = 'a'                       -- Enable mouse support
opt.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard
