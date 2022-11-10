local status_ok, auto_session = pcall(require, "auto-session")
if not status_ok then
	return
end

local function close_neo_tree()
	require("neo-tree.sources.manager").close_all()
	vim.cmd("Vista!")
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

auto_session.setup(opts)
