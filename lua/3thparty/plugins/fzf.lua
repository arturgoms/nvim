return {
	'ibhagwan/fzf-lua',
	event = "VeryLazy",
	requires = { 'nvim-tree/nvim-web-devicons' },
	keys = {
		{ "<leader>nc",  function() require("fzf-lua").commands() end,            desc = "Search commands" },
		{ "<leader>nC",  function() require("fzf-lua").command_history() end,     desc = "Search command history" },
		{ "<leader>nf",  function() require("fzf-lua").files() end,               desc = "Find files" },
		{ "<leader>nt",  function() require("fzf-lua").live_grep() end,           desc = "Find in files" },
		{ "<leader>nb",  function() require("fzf-lua").grep() end,                desc = "Find with regex" },
		{ "<leader>no",  function() require("fzf-lua").oldfiles() end,            desc = "Find fi" },
		{ "<leader>nh",  function() require("fzf-lua").highlights() end,          desc = "Search highlights" },
		{ "<leader>nM",  function() require("fzf-lua").marks() end,               desc = "Search marks" },
		{ "<leader>nk",  function() require("fzf-lua").keymaps() end,             desc = "Search keymaps" },
		{ "<leader>ns",  function() require("fzf-lua").spell_suggest() end,       desc = "Spell suggestions" },
		{ "<leader>ngf", function() require("fzf-lua").git_files() end,           desc = "Find git files" },
		{ "<leader>ngb", function() require("fzf-lua").git_branches() end,        desc = "Search git branches" },
		{ "<leader>ngc", function() require("fzf-lua").git_commits() end,         desc = "Search git commits" },
		{ "<leader>ngC", function() require("fzf-lua").git_bcommits() end,        desc = "Search git buffer commits" },
		{ "<leader>nr",  function() require("fzf-lua").resume() end,              desc = "Resume FZF" },
		{ "<leader>nlr", function() require("fzf-lua").lsp_references() end,      desc = "References" },
		{ "<leader>nld", function() require("fzf-lua").lsp_definitions() end,     desc = "Definitions" },
		{ "<leader>nle", function() require("fzf-lua").lsp_declarations() end,    desc = "Declarations" },
		{ "<leader>nli", function() require("fzf-lua").lsp_implementations() end, desc = "Implementations" },
		{ "<leader>nla", function() require("fzf-lua").lsp_code_actions() end,    desc = "Code Actions" },
	},
	config = function()
		local fzf = require('fzf-lua')
		fzf.setup({
			keymap = {
				fzf = {
					['CTRL-Q'] = 'select-all+accept',
				},
			},
		})
		fzf.register_ui_select()
	end,
}
