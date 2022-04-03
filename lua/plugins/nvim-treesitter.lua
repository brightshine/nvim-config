require('nvim-treesitter.configs').setup {
  ensure_installed = {"bash", "c", "cpp", "cmake", "css", "dockerfile", "html", "java", "javascript", "json", "lua", "make", "ninja", "python", "php", "perl", "vim"},

  highlight = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = ' ',
      node_incremental = ' ',
      node_decremental = '<BS>',
      scope_incremental = '<TAB>',
    }
  },
  indent = {
    -- This is an experimental feature.
    enable = true
  }
}
