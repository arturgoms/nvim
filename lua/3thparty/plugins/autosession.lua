return {
	"rmagatti/auto-session",
	lazy = false,
	config = function()
		local auto_session = require("auto-session")
		local r = require("utils.remaps")
		local function close_neo_tree()
			require("neo-tree.sources.manager").close_all()
			-- vim.cmd("Vista!")
		end

		local function open_neo_tree()
			require("neo-tree.sources.manager").show("filesystem")
			-- vim.cmd("Vista!!")
		end
		local opts = {
			log_level = "info",
			auto_session_enable_last_session = false,
			auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
			auto_session_enabled = true,
			auto_save_enabled = nil,
			auto_restore_enabled = nil,
			auto_session_suppress_dirs = { os.getenv("HOME") },
			auto_session_use_git_branch = nil,
			-- the configs below are lua only
			bypass_session_save_file_types = { "alpha" },
			pre_save_cmds = {
				close_neo_tree,
			},
			post_restore_cmds = {
				open_neo_tree,
			},
		}

		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

		r.noremap("n", "<leader>Ss", "<cmd>SessionSave<cr>", "Save")
		r.noremap("n", "<leader>Sr", "<cmd>SessionRestore<cr>", "Restore")
		r.noremap("n", "<leader>.", "<cmd>SessionRestore<cr>", "Restore Session")
		r.noremap("n", "<leader>Sx", "<cmd>SessionDelete<cr>", "Delete")
		r.noremap("n", "<leader>Sf", "<cmd>Autosession search<cr>", "Searh Session")
		r.noremap("n", "<leader>Sd", "<cmd>Autosession delete<cr>", "Searh and Delete")
		auto_session.setup(opts)
	end
}
