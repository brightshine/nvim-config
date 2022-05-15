
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

require'lspconfig'.bashls.setup{
  capabilities = capabilities
}
require'lspconfig'.clangd.setup{
  capabilities = capabilities,
}
require'lspconfig'.cmake.setup{
  capabilities = capabilities
}
require'lspconfig'.pyright.setup{
  capabilities = capabilities
}
require'lspconfig'.tsserver.setup{
  capabilities = capabilities
}
require'lspconfig'.vimls.setup{
  capabilities = capabilities
}
--require'lspconfig'.ccls.setup{
  --capabilities = capabilities
--}
local clangd_setup = {
  on_attach = function(client, bufnr)
    require "lsp_signature".on_attach({ -- This is mandatory, otherwise border config won't get registered.
      bind = true,
      handler_opts = {
        border = "rounded"
      }
    }, bufnr
    ) -- Note: add in lsp client on-attach
  end,
}
