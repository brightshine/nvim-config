local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }

-- nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<CR>', opts)       -- open/close
map('n', '<leader>r', ':NvimTreeRefresh<CR>', opts)  -- refresh
map('n', '<leader>n', ':NvimTreeFindFile<CR>', opts) -- search file

-- Vista tag-viewer
map('n', '<C-m>', ':Vista!!<CR>', opts) -- open/close

-- Close all windows
map('n', '<leader>q', ':qa!<CR>', opts)

-- Enable fold
map('n', '<C-i>', ':set foldmethod=expr<CR>', opts)

-- Switch header/source
map('n', '<leader>a', ':ClangdSwitchSourceHeader<CR>', opts)

-- LSP
map('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)

map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
map('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
map('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

-- Telescope
map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files{ cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1] }<cr>', opts)
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep{ cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1] }<cr>', opts)
map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
map('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)

-- Gtags
map('n', '<leader>cs', ':GscopeFind s <C-R><C-W><cr>' , opts)
map('n', '<leader>cg', ':GscopeFind g <C-R><C-W><cr>' , opts)
map('n', '<leader>cc', ':GscopeFind c <C-R><C-W><cr>' , opts)
map('n', '<leader>ct', ':GscopeFind t <C-R><C-W><cr>' , opts)
map('n', '<leader>ce', ':GscopeFind e <C-R><C-W><cr>' , opts)
map('n', '<leader>cf', ':GscopeFind f <C-R>=expand("<cfile>")<cr><cr>' , opts)
map('n', '<leader>ci', ':GscopeFind i <C-R>=expand("<cfile>")<cr><cr>' , opts)
map('n', '<leader>cd', ':GscopeFind d <C-R><C-W><cr>' , opts)
map('n', '<leader>ca', ':GscopeFind a <C-R><C-W><cr>' , opts)
map('n', '<leader>cz', ':GscopeFind z <C-R><C-W><cr>' , opts)


local map = vim.api.nvim_set_keymap
-- Move to previous/next
map('n', '<A-,>', ':BufferPrevious<CR>', opts)
map('n', '<A-.>', ':BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
map('n', '<A->>', ' :BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', ':BufferGoto 1<CR>', opts)
map('n', '<A-2>', ':BufferGoto 2<CR>', opts)
map('n', '<A-3>', ':BufferGoto 3<CR>', opts)
map('n', '<A-4>', ':BufferGoto 4<CR>', opts)
map('n', '<A-5>', ':BufferGoto 5<CR>', opts)
map('n', '<A-6>', ':BufferGoto 6<CR>', opts)
map('n', '<A-7>', ':BufferGoto 7<CR>', opts)
map('n', '<A-8>', ':BufferGoto 8<CR>', opts)
map('n', '<A-9>', ':BufferGoto 9<CR>', opts)
map('n', '<A-0>', ':BufferLast<CR>', opts)
-- Close buffer
map('n', '<A-c>', ':BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
map('n', '<C-p>', ':BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', ':BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', ':BufferOrderByLanguage<CR>', opts)

-- Copy to clipboard in normal, visual select and operator modes
-- map('', '<leader>c', '"+y') 
