return {
  -- Maximize splits
  "szw/vim-maximizer",
  config = function()
    local r = require("utils.remaps")
    r.noremap("n", "<leader>m", ":MaximizerToggle!<CR>", "maximize split")
  end
}
