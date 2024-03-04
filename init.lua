-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Install `lazy.nvim` plugin manager ]]
require('lazy-bootstrap')

-- [[ Configure plugins ]]
require('lazy-plugins')

-- [[ Setting options ]]
require('personal.options')

-- [[ Basic Keymaps ]]
require('personal.keymaps')

-- [[ Configure Telescope ]]
-- (fuzzy finder)
require('lsp.telescope-setup')

-- [[ Configure Treesitter ]]
-- (syntax parser for highlighting)
require('lsp.treesitter-setup')

-- [[ Configure LSP ]]
-- (Language Server Protocol)
require('lsp.lsp-setup')

-- [[ Configure nvim-cmp ]]
-- (completion)
require('lsp.cmp-setup')

-- [[ Configure ui ]]
require("personal.ui")

-- [[ Configure autocommands ]]
require("personal.autocommands")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
