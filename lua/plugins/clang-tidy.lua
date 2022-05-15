local clang_tidy = require('clang-tidy')

local custom_attach_clangd = function(client)
  clang_tidy.setup()
  -- rest of the attch function
end

lsp.clangd.setup({
  on_attach = custom_attach_clangd,
  -- rest of the setup table
  cmd = {
    -- see clangd --help-hidden
    "clangd",
    "--background-index",
    -- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
    -- to add more checks, create .clang-tidy file in the root directory
    -- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
    "--clang-tidy",
    "--completion-style=bundled",
    "--cross-file-rename",
    "--header-insertion=iwyu",
  },
  -- handlers = handler.with({ handler.hover, clangd_ext_handler }),
  init_options = {
    clangdFileStatus = true, -- Provides information about activity on clangd’s per-file worker thread
    usePlaceholders = true,
    completeUnimported = true,
    semanticHighlighting = true,
  },
  -- on_attach = attach.with_all_extensions,
})
