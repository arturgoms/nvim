local fn = vim.fn
local api = vim.api

local colors = {}
-- colors.accent = "#E6B450"
-- colors.bg = "#0A0E14"
-- colors.fg = "#B3B1AD"
-- colors.ui = "#4D5566"
--
-- colors.tag = "#39BAE6"
-- colors.func = "#FFB454"
-- colors.entity = "#59C2FF"
-- colors.string = "#C2D94C"
-- colors.regexp = "#95E6CB"
-- colors.markup = "#F07178"
-- colors.keyword = "#FF8F40"
-- colors.special = "#E6B673"
-- colors.comment = "#626A73"
-- colors.constant = "#FFEE99"
-- colors.operator = "#F29668"
-- colors.error = "#FF3333"
--
-- colors.line = "#00010A"
-- colors.panel_bg = "#0D1016"
-- colors.panel_shadow = "#00010A"
-- colors.panel_border = "#000000"
-- colors.gutter_normal = "#323945"
-- colors.gutter_active = "#464D5E"
-- colors.selection_bg = "#273747"
-- colors.selection_inactive = "#1B2733"
-- colors.selection_border = "#304357"
-- colors.guide_active = "#393F4D"
-- colors.guide_normal = "#242A35"
--
-- colors.vcs_added = "#91B362"
-- colors.vcs_modified = "#6994BF"
-- colors.vcs_removed = "#D96C75"
--
-- colors.vcs_added_bg = "#1D2214"
-- colors.vcs_removed_bg = "#2D2220"
--
-- colors.fg_idle = "#3E4B59"
-- colors.warning = "#FF8F40"

colors.accent = "#fabd2f"
colors.bg = "#0A0E14"
colors.fg = "#B3B1AD"
colors.ui = "#4D5566"

colors.tag = "#076678"
colors.func = "#d79921"
colors.entity = "#458588"
colors.string = "#8ec07c"
colors.regexp = "#427b58"
colors.markup = "#fb4934"
colors.keyword = "#FF8F40"
colors.special = "#b57614"
colors.comment = "#626A73"
colors.constant = "#f2e5bc"
colors.operator = "#fe8019"
colors.error = "#cc241d"

colors.line = "#00010A"
colors.panel_bg = "#0D1016"
colors.panel_shadow = "#00010A"
colors.panel_border = "#000000"
colors.gutter_normal = "#323945"
colors.gutter_active = "#464D5E"
colors.selection_bg = "#273747"
colors.selection_inactive = "#1B2733"
colors.selection_border = "#304357"
colors.guide_active = "#393F4D"
colors.guide_normal = "#242A35"

colors.vcs_added = "#91B362"
colors.vcs_modified = "#6994BF"
colors.vcs_removed = "#D96C75"

colors.vcs_added_bg = "#1D2214"
colors.vcs_removed_bg = "#2D2220"

colors.fg_idle = "#3E4B59"
colors.warning = "#fe8019"

local function set_colors(fg, bg)
	return "guifg=" .. fg .. " guibg=" .. bg
end

-- Ayu
api.nvim_command("hi StatusDefault " .. set_colors(colors.fg, colors.bg))
api.nvim_command("hi StatusVimNormal " .. set_colors(colors.bg, colors.accent))
api.nvim_command("hi StatusVimInsert " .. set_colors(colors.bg, colors.tag))
api.nvim_command("hi StatusVimVisual " .. set_colors(colors.bg, colors.func))
api.nvim_command("hi StatusVimReplace " .. set_colors(colors.bg, colors.entity))
api.nvim_command("hi StatusVimEnter " .. set_colors(colors.bg, colors.string))
api.nvim_command("hi StatusVimMore " .. set_colors(colors.bg, colors.regexp))
api.nvim_command("hi StatusVimSelect " .. set_colors(colors.bg, colors.markup))
api.nvim_command("hi StatusVimCmd " .. set_colors(colors.bg, colors.keyword))
api.nvim_command("hi StatusVimShell " .. set_colors(colors.bg, colors.special))
api.nvim_command("hi StatusVimTerm " .. set_colors(colors.bg, colors.comment))
api.nvim_command("hi StatusModified " .. set_colors(colors.bg, colors.constant))
api.nvim_command("hi StatusLineNumber " .. set_colors(colors.bg, colors.operator))
api.nvim_command("hi StatusColumnNumber " .. set_colors(colors.bg, colors.error))
api.nvim_command("hi StatusFileInfo " .. set_colors(colors.keyword, colors.bg))
api.nvim_command("hi StatusGitInfo " .. set_colors(colors.entity, colors.bg))
api.nvim_command("hi StatusLSPProgress " .. set_colors(colors.keyword, colors.bg))
api.nvim_command("hi StatusLSPError " .. set_colors(colors.error, colors.bg))
api.nvim_command("hi StatusLSPWarn " .. set_colors(colors.accent, colors.bg))
api.nvim_command("hi StatusLSPInfo " .. set_colors(colors.entity, colors.bg))
api.nvim_command("hi StatusLSPHin " .. set_colors(colors.tag, colors.bg))
api.nvim_command("hi StatusLSPStatus " .. set_colors(colors.tag, colors.bg))
api.nvim_command("hi StatusCwd " .. set_colors(colors.keyword, colors.bg))
api.nvim_command("hi StatusCursor " .. set_colors(colors.accent, colors.bg))

local modes = {
	["n"] = { "NORMAL", "StatusVimNormal" },
	["niI"] = { "NORMAL i", "StatusVimNormal" },
	["niR"] = { "NORMAL r", "StatusVimNormal" },
	["niV"] = { "NORMAL v", "StatusVimNormal" },
	["no"] = { "N-PENDING", "StatusVimNormal" },
	["i"] = { "INSERT", "StatusVimInsert" },
	["ic"] = { "INSERT", "StatusVimInsert" },
	["ix"] = { "INSERT completion", "StatusVimInsert" },
	["t"] = { "TERMINAL", "StatusVimTerm" },
	["nt"] = { "NTERMINAL", "StatusVimTerm" },
	["v"] = { "VISUAL", "StatusVimVisual" },
	["V"] = { "V-LINE", "StatusVimVisual" },
	[""] = { "V-BLOCK", "StatusVimVisual" },
	["R"] = { "REPLACE", "StatusVimReplace" },
	["Rv"] = { "V-REPLACE", "StatusVimReplace" },
	["s"] = { "SELECT", "StatusVimSelect" },
	["S"] = { "S-LINE", "StatusVimSelect" },
	[""] = { "S-BLOCK", "StatusVimSelect" },
	["c"] = { "COMMAND", "StatusVimCmd" },
	["cv"] = { "COMMAND", "StatusVimCmd" },
	["ce"] = { "COMMAND", "StatusVimCmd" },
	["r"] = { "PROMPT", "StatusModified" },
	["rm"] = { "MORE", "StatusModified" },
	["r?"] = { "CONFIRM", "StatusModified" },
	["!"] = { "SHELL", "StatusVimTerm" },
}

local M = {}

M.mode = function()
	local m = vim.api.nvim_get_mode().mode
	local current_mode = "%#" .. modes[m][2] .. "#" .. "  " .. modes[m][1] .. " "
	return current_mode .. "%#ST_EmptySpace#"
end

M.fileInfo = function()
	local icon = "  "
	local filename = (fn.expand("%") == "" and "Empty ") or fn.expand("%:t")

	if filename ~= "Empty " then
		local devicons_present, devicons = pcall(require, "nvim-web-devicons")

		if devicons_present then
			local ft_icon = devicons.get_icon(filename)
			icon = (ft_icon ~= nil and " " .. ft_icon) or ""
		end

		filename = " " .. filename .. " "
	end

	return "%#StatusFileInfo#" .. icon .. filename .. "%#St_file_sep#"
end

M.git = function()
	if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
		return ""
	end

	local git_status = vim.b.gitsigns_status_dict

	local added = (git_status.added and git_status.added ~= 0) and ("  " .. git_status.added) or ""
	local changed = (git_status.changed and git_status.changed ~= 0) and ("  " .. git_status.changed) or ""
	local removed = (git_status.removed and git_status.removed ~= 0) and ("  " .. git_status.removed) or ""
	local branch_name = "   " .. git_status.head .. " "

	return "%#StatusGitInfo#" .. branch_name .. added .. changed .. removed
end

-- LSP STUFF
M.LSP_progress = function()
	if not rawget(vim, "lsp") then
		return ""
	end

	local Lsp = vim.lsp.util.get_progress_messages()[1]

	if vim.o.columns < 120 or not Lsp then
		return ""
	end

	local msg = Lsp.message or ""
	local percentage = Lsp.percentage or 0
	local title = Lsp.title or ""
	local spinners = { "", "" }
	local ms = vim.loop.hrtime() / 1000000
	local frame = math.floor(ms / 120) % #spinners
	local content = string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)

	return ("%#StatusLSPProgress#" .. content) or ""
end

M.LSP_Diagnostics = function()
	if not rawget(vim, "lsp") then
		return ""
	end

	local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
	local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
	local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
	local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

	errors = (errors and errors > 0) and ("%#StatusLSPError#" .. " " .. errors .. " ") or ""
	warnings = (warnings and warnings > 0) and ("%#StatusLSPWarn#" .. "  " .. warnings .. " ") or ""
	hints = (hints and hints > 0) and ("%#StatusLSPHin#" .. "ﯧ " .. hints .. " ") or ""
	info = (info and info > 0) and ("%#StatusLSPInfo#" .. " " .. info .. " ") or ""

	return errors .. warnings .. hints .. info
end

M.LSP_status = function()
	if rawget(vim, "lsp") then
		for _, client in ipairs(vim.lsp.get_active_clients()) do
			if client.attached_buffers[vim.api.nvim_get_current_buf()] then
				return (vim.o.columns > 100 and "%#StatusLSPStatus#" .. "   LSP ~ " .. client.name .. " ")
					or "   LSP "
			end
		end
	end
end

M.cwd = function()
	local dir_icon = "%#StatusCwd#" .. "  "
	local dir_name = "%#StatusCwd#" .. " " .. fn.fnamemodify(fn.getcwd(), ":t") .. " "
	return (vim.o.columns > 85 and (dir_icon .. dir_name)) or ""
end

M.cursor_position = function()
	local left_sep = "%#StatusCursor#" .. "  "

	local current_line = fn.line(".")
	local total_line = fn.line("$")
	local text = math.modf((current_line / total_line) * 100) .. tostring("%%")

	text = (current_line == 1 and "Top") or text
	text = (current_line == total_line and "Bot") or text

	return left_sep .. "%#StatusCursor#" .. " " .. text .. " "
end

return M
