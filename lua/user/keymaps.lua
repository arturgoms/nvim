M = {}

local Remap = require("plugins.keymaps")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- greatest remap ever
xnoremap("<leader>p", '"_dP')

-- next greatest remap ever : asbjornHaland
nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')
nmap("<leader>Y", '"+Y')

nnoremap("<S-l>", function()
	require("harpoon.mark").add_file()
end)

nnoremap("<S-u>", function()
	require("harpoon.ui").toggle_quick_menu()
end)

nnoremap("<S-h>", function()
	require("harpoon.ui").nav_file(1)
end)

nnoremap("<S-j>", function()
	require("harpoon.ui").nav_file(2)
end)

nnoremap("<S-a>", function()
	require("harpoon.ui").nav_file(3)
end)

nnoremap("<S-x>", function()
	require("harpoon.ui").nav_file(4)
end)

nnoremap("<S-Up>", ":m-2<CR>")
nnoremap("<S-Down>", ":m+<CR>")
inoremap("<S-Up>", "<Esc>:m-2<CR>")
inoremap("<S-Down>", "<Esc>:m+<CR>")
nnoremap("<leader>d", '"_d')
vnoremap("<leader>d", '"_d')

vnoremap("<leader>d", '"_d')

-- This is going to get me cancelled
inoremap("<C-c>", "<Esc>")

-- Tabs --
keymap("n", "<enter>", ":tabnew %<cr>", opts)
keymap("n", "<s-enter>", ":tabclose<cr>", opts)
keymap("n", "<m-\\>", ":tabonly<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Increase and decrease numbers
keymap("n", "<leader>+", "<C-a>", opts)
keymap("n", "<leader>-", "<C-x>", opts)

-- Naviagate buffers
keymap("n", "<C-j>", ":bnext<CR>", opts)
keymap("n", "<C-k>", ":bprevious<CR>", opts)

-- Splits
-- FIXME: Conflits with sessions
keymap("n", "<leader>wv", "<C-w>v", opts)
keymap("n", "<leader>wh", "<C-w>s", opts)
keymap("n", "<leader>we", "<C-w>=", opts)
keymap("n", "<leader>wv", ":close<CR>", opts)

-- Custom
-- Clear searh when esc esc
keymap("n", "<esc><esc>", "<cmd>nohlsearch<cr>", opts)
keymap("n", "<C-p>", "<cmd>Telescope projects<cr>", opts)
keymap("n", "<C-t>", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", opts)
keymap("n", "<C-s>", "<cmd>vsplit<cr>", opts)
keymap("n", "<C-z>", "<cmd>ZenMode<cr>", opts)
keymap("n", "<c-n>", ":e ~/Notes/<cr>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

M.show_documentation = function()
	local filetype = vim.bo.filetype
	if vim.tbl_contains({ "vim", "help" }, filetype) then
		vim.cmd("h " .. vim.fn.expand("<cword>"))
	elseif vim.tbl_contains({ "man" }, filetype) then
		vim.cmd("Man " .. vim.fn.expand("<cword>"))
	elseif vim.fn.expand("%:t") == "Cargo.toml" then
		require("crates").show_popup()
	else
		vim.lsp.buf.hover()
	end
end
vim.api.nvim_set_keymap("n", "K", ":lua require('user.keymaps').show_documentation()<CR>", opts)

vim.api.nvim_set_keymap(
	"n",
	"<m-f>",
	"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
	opts
)
-- Comment
keymap("n", "<m-/>", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<m-/>", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', opts)

vim.api.nvim_set_keymap(
	"n",
	"<tab>",
	"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
	opts
)
vim.api.nvim_set_keymap("n", "<m-g>", "<cmd>Telescope git_branches<cr>", opts)

return M
