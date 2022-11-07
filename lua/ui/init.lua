-- config

local options = require("ui.config")

return {
   statusline = function()
      return require("ui.statusline").setup(options.statusline)
   end,

   load_ui_plugins = function()
      vim.opt.statusline = "%!v:lua.require('ui').statusline()"
   end,
}
