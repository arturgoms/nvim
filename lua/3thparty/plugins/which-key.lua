-- Useful plugin to show you pending keybinds.
return {
        "folke/which-key.nvim",
        keys = { "<leader>" },
        config = function()
                local which_key = require("which-key")
                which_key.setup({
                        plugins = {
                                spelling = {
                                        enabled = true,
                                        suggestions = 20,
                                },
                        },
                        window = {
                                border = "shadow",
                                position = "bottom",
                                margin = { 0, 1, 1, 5 },
                                padding = { 1, 2, 1, 2 },
                        },
                        triggers_nowait = {
                                "`",
                                "'",
                                "g`",
                                "g'",
                                '"',
                                "<c-r>",
                                "z=",
                        },
                })

                local opts = {
                        prefix = "<leader>",
                }

                local groups = {
                        n = { name = "fzf" },
                        S = { name = "Session" },
                }

                which_key.register(groups, opts)
        end,
}
