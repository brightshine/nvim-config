local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }

-- nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<CR>', opts)       -- open/close
--map('n', '<leader>r', ':NvimTreeRefresh<CR>', opts)  -- refresh
--map('n', '<leader>n', ':NvimTreeFindFile<CR>', opts) -- search file

-- Vista tag-viewer
map('n', '<C-m>', ':Vista!!<CR>', opts) -- open/close

-- Close all windows
map('n', '<leader>qq', ':qa!<CR>', opts)

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
map('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

-- Clangd_Extension
map('n', '<leader>gh', ':ClangdTypeHierarchy<CR>', opts)

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

-- Split
map("n", "sv", ":vsp<CR>", opts)
map("n", "sh", ":sp<CR>", opts)
map("n", "sc", "<C-w>c", opts)
map("n", "so", "<C-w>o", opts) -- close others
map("n", "s>", ":vertical resize +20<CR>", opts)
map("n", "s<", ":vertical resize -20<CR>", opts)
map("n", "s=", "<C-w>=", opts)
map("n", "sj", ":resize +10<CR>",opts)
map("n", "sk", ":resize -10<CR>",opts)
