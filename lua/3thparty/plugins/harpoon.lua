return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      local status_ok, harpoon = pcall(require, "harpoon")
      if not status_ok then
        return
      end
      harpoon:setup({})

      local status_ok, telescope = pcall(require, "telescope")
      if not status_ok then
        return
      end
      telescope.load_extension("harpoon")
    end,
  },
  {
    "letieu/harpoon-lualine",
    dependencies = {
      {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
      }
    },
  }
}
