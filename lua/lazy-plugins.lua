-- [[ Configure plugins ]]
-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for custom
  --       These are some example plugins that I've included in the custom repository.
  --       Uncomment any of the lines below to enable them.
  require 'custom.plugins.autoformat',
  require 'custom.plugins.debug',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the 3thparty repo.
  --    Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  { import = '3thparty.plugins' },
}, {})

-- vim: ts=2 sts=2 sw=2 et
