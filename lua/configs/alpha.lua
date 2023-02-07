local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local path_ok, path = pcall(require, "plenary.path")
if not path_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
local nvim_web_devicons = require("nvim-web-devicons")
local cdir = vim.fn.getcwd()

local function getGreeting(name)
	local tableTime = os.date("*t")
	local hour = tableTime.hour
	local greetingsTable = {
		[1] = "  Sleep well",
		[2] = "  Good morning",
		[3] = "  Good afternoon",
		[4] = "  Good evening",
		[5] = "望 Good night",
	}
	local greetingIndex = 0
	if hour == 23 or hour < 7 then
		greetingIndex = 1
	elseif hour < 12 then
		greetingIndex = 2
	elseif hour >= 12 and hour < 18 then
		greetingIndex = 3
	elseif hour >= 18 and hour < 21 then
		greetingIndex = 4
	elseif hour >= 21 then
		greetingIndex = 5
	end
	return greetingsTable[greetingIndex] .. ", " .. name
end

local userName = "Artur"
local greeting = getGreeting(userName)

local greetHeading = {
	type = "text",
	val = greeting,
	opts = {
		position = "center",
		hl = "String",
	},
}

local function get_extension(fn)
	local match = fn:match("^.+(%..+)$")
	local ext = ""
	if match ~= nil then
		ext = match:sub(2)
	end
	return ext
end

local function icon(fn)
	local nwd = require("nvim-web-devicons")
	local ext = get_extension(fn)
	return nwd.get_icon(fn, ext, { default = true })
end

local function file_button(fn, sc, short_fn)
	short_fn = short_fn or fn
	local ico_txt
	local fb_hl = {}

	local ico, hl = icon(fn)
	local hl_option_type = type(nvim_web_devicons.highlight)
	if hl_option_type == "boolean" then
		if hl and nvim_web_devicons.highlight then
			table.insert(fb_hl, { hl, 0, 1 })
		end
	end
	if hl_option_type == "string" then
		table.insert(fb_hl, { nvim_web_devicons.highlight, 0, 1 })
	end
	ico_txt = ico .. "  "

	local file_button_el = dashboard.button(sc, ico_txt .. short_fn, "<cmd>e " .. fn .. " <CR>")
	local fn_start = short_fn:match(".*/")
	if fn_start ~= nil then
		table.insert(fb_hl, { "Comment", #ico_txt - 2, #fn_start + #ico_txt - 2 })
	end
	file_button_el.opts.hl = fb_hl
	return file_button_el
end

local default_mru_ignore = { "gitcommit" }

local mru_opts = {
	ignore = function(path, ext)
		return (string.find(path, "COMMIT_EDITMSG")) or (vim.tbl_contains(default_mru_ignore, ext))
	end,
}

--- @param start number
--- @param cwd string optional
--- @param items_number number optional number of items to generate, default = 10
local function mru(start, cwd, items_number, opts)
	opts = opts or mru_opts
	items_number = items_number or 9

	local oldfiles = {}
	for _, v in pairs(vim.v.oldfiles) do
		if #oldfiles == items_number then
			break
		end
		local cwd_cond
		if not cwd then
			cwd_cond = true
		else
			cwd_cond = vim.startswith(v, cwd)
		end
		local ignore = (opts.ignore and opts.ignore(v, get_extension(v))) or false
		if (vim.fn.filereadable(v) == 1) and cwd_cond and not ignore then
			oldfiles[#oldfiles + 1] = v
		end
	end

	local special_shortcuts = { "a", "s", "d" }
	local target_width = 35

	local tbl = {}
	for i, fn in ipairs(oldfiles) do
		local short_fn
		if cwd then
			short_fn = vim.fn.fnamemodify(fn, ":.")
		else
			short_fn = vim.fn.fnamemodify(fn, ":~")
		end

		if #short_fn > target_width then
			short_fn = path.new(short_fn):shorten(1, { -2, -1 })
			if #short_fn > target_width then
				short_fn = path.new(short_fn):shorten(1, { -1 })
			end
		end

		local shortcut = ""
		if i <= #special_shortcuts then
			shortcut = special_shortcuts[i]
		else
			shortcut = tostring(i + start - 1 - #special_shortcuts)
		end

		local file_button_el = file_button(fn, " " .. shortcut, short_fn)
		tbl[i] = file_button_el
	end
	return {
		type = "group",
		val = tbl,
		opts = {},
	}
end

local header = {
	type = "text",
	val = {
		" ",
		"    ███    ██ ██    ██ ██ ███    ███",
		"    ████   ██ ██    ██ ██ ████  ████",
		"    ██ ██  ██ ██    ██ ██ ██ ████ ██",
		"    ██  ██ ██  ██  ██  ██ ██  ██  ██",
		"    ██   ████   ████   ██ ██      ██",
	},
	opts = { position = "center" },
}

local section_mru = {
	type = "group",
	val = {
		{
			type = "text",
			val = "Recent files",
			opts = {
				hl = "SpecialComment",
				shrink_margin = false,
				position = "center",
			},
		},
		{ type = "padding", val = 1 },
		{
			type = "group",
			val = function()
				return { mru(1, cdir, 9) }
			end,
			opts = { shrink_margin = false },
		},
	},
}

local buttons = {
	type = "group",
	val = {
		{ type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
		{ type = "padding", val = 1 },
		dashboard.button(
			"p",
			" " .. " Find project",
			":lua require('telescope').extensions.projects.projects()<CR>"
		),
		dashboard.button("f", "  Find file", ":FzfLua files <CR>"),
		dashboard.button("F", "  Find text", ":FzfLua live_grep <CR>"),
		dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
		dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
		dashboard.button("u", "  Update plugins", ":PackerSync<CR>"),
		dashboard.button("q", "  Quit", ":qa<CR>"),
	},
	position = "center",
}

-- Foot must be a table so that its height is correctly measured
-- local num_plugins_loaded = #vim.fn.globpath(vim.fn.stdpath("data") .. "/site/pack/packer/start", "*", 0, 1)

local footer = {
	type = "text",
	val = { " plugins ﮣ loaded" },
	opts = {
		position = "center",
		hl = "Comment",
	},
}

local opts = {
	layout = {
		{ type = "padding", val = 2 },
		header,
		{ type = "padding", val = 3 },
		greetHeading,
		footer,
		{ type = "padding", val = 2 },
		section_mru,
		{ type = "padding", val = 2 },
		buttons,
	},
	opts = {
		margin = 5,
	},
}

alpha.setup(opts)
