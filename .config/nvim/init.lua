-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
-- We place our files in config/ so they don't collide with plugins,
-- eg. our lazy file would collide with lazy when we require("lazy")
require("config")
-- Load lazy plugin manager
require("config.lazy")
-- Load LSP plugins
require("config.lsp")
require("config.theme")
