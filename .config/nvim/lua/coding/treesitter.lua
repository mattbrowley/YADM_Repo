local configs = require 'nvim-treesitter.configs'
configs.setup {
  ensure_installed = { 'python', 'c', 'cpp', 'go', 'lua', 'markdown', 'latex', 'vimdoc', 'vim', 'bash' },
  highlight = { -- enable highlighting
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true, -- default is disabled always
  },
  autopairs = {
    enable = true,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
