return {
	"nvim-lualine/lualine.nvim",
	enabled = true,
	lazy = false,
	event = { "BufReadPost", "BufNewFile", "VeryLazy" },
	config = function()
		local miasma = {
			bg = "#222222",
			black = "#1c1c1c",
			grey = "#666666",
			red = "#685742",
			green = "#5f875f",
			yellow = "#B36D43",
			blue = "#78824B",
			magenta = "#bb7744",
			cyan = "#C9A554",
			white = "#D7C483",
			orange = "#bb7744"
		}
		local oxocarbon = {
			bg           = '#161616',
			black        = '#161616',
			fg           = '#fafafa',
			white        = '#fafafa',
			red          = '#ee5396',
			green        = '#08bdba',
			blue         = '#78a9ff',
			yellow       = '#ffab91',
			orange       = '#ffab91',
			gray         = '#37474F',
			darkgray     = '#1A1C23',
			lightgray    = '#2e303e',
			inactivegray = '#1C1E26',
			purple       = '#673ab7',
			lightpurple  = '#be95ff',
		}

		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
			end,
			hide_in_width = function()
				return vim.fn.winwidth(0) > 80
			end,
			check_git_workspace = function()
				local filepath = vim.fn.expand("%:p:h")
				local gitdir = vim.fn.finddir(".git", filepath .. ";")
				return gitdir and #gitdir > 0 and #gitdir < #filepath
			end,
		}
		-- Config
		local config = {
			options = {
				-- Disable sections and component separators
				component_separators = "",
				section_separators = "",
				theme = {
					-- We are going to use lualine_c an lualine_x as left and
					-- right section. Both are highlighted by c theme .  So we
					-- are just setting default looks o statusline
					normal = { c = { fg = oxocarbon.fg, bg = oxocarbon.bg } },
					inactive = { c = { fg = oxocarbon.fg, bg = oxocarbon.bg } },
				},
			},
			sections = {
				-- these are to remove the defaults
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				-- These will be filled later
				lualine_c = {},
				lualine_x = {},
			},
			inactive_sections = {
				-- these are to remove the defaults
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
		}

		-- Inserts a component in lualine_c at left section
		local function ins_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		-- Inserts a component in lualine_x at right section
		local function ins_right(component)
			table.insert(config.sections.lualine_x, component)
		end

		ins_left({
			-- mode component
			"mode",
			color = function()
				-- auto change color according to neovims mode
				local mode_color = {
					n = oxocarbon.purple,
					i = oxocarbon.green,
					v = oxocarbon.blue,
					[""] = oxocarbon.blue,
					V = oxocarbon.blue,
					c = oxocarbon.magenta,
					no = oxocarbon.red,
					s = oxocarbon.orange,
					S = oxocarbon.orange,
					[""] = oxocarbon.orange,
					ic = oxocarbon.yellow,
					R = oxocarbon.purple,
					Rv = oxocarbon.purple,
					cv = oxocarbon.red,
					ce = oxocarbon.red,
					r = oxocarbon.cyan,
					rm = oxocarbon.cyan,
					["r?"] = oxocarbon.cyan,
					["!"] = oxocarbon.red,
					t = oxocarbon.red,
				}
				return { fg = oxocarbon.fg, bg = mode_color[vim.fn.mode()], gui = "bold" }
			end,
			padding = { right = 1, left = 1 },
		})

		ins_left({
			"filename",
			cond = conditions.buffer_not_empty,
			color = { fg = oxocarbon.blue, gui = "bold" },
			padding = { left = 3 },
		})

		ins_left({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", warn = " ", info = " " },
			diagnostics_color = {
				color_error = { fg = oxocarbon.grey },
				color_warn = { fg = oxocarbon.grey },
				color_info = { fg = oxocarbon.grey },
			},
			padding = { left = 2 },
		})

		ins_left({
			"diff",
			-- Is it me or the symbol for modified us really weird
			symbols = { added = " ", modified = "柳 ", removed = " " },
			diff_color = {
				added = { fg = oxocarbon.grey },
				modified = { fg = oxocarbon.grey },
				removed = { fg = oxocarbon.grey },
			},
			cond = conditions.hide_in_width,
			padding = { left = 3 },
		})
		-- Insert mid section. You can make any number of sections in neovim :)
		-- for lualine it's any number greater then 2
		ins_left({
			function()
				return "%="
			end,
		})

		ins_left({
			-- Lsp server name .
			function()
				local msg = "No Active Lsp"
				local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
				local clients = vim.lsp.get_active_clients()
				if next(clients) == nil then
					return msg
				end
				for _, client in ipairs(clients) do
					local filetypes = client.config.filetypes
					if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
						return client.name
					end
				end
				return msg
			end,
			icon = " LSP:",
			color = { fg = oxocarbon.blue, gui = "bold" },
		})

		-- Add components to right sections
		--
		ins_right({ "location", color = { fg = oxocarbon.gray } })
		ins_right({ "progress", color = { fg = oxocarbon.grey, gui = "bold" } })

		ins_right({
			"o:encoding", -- option component same as &encoding in viml
			fmt = string.upper, -- I'm not sure why it's upper case either ;)
			cond = conditions.hide_in_width,
			color = { fg = oxocarbon.green, gui = "bold" },
		})

		ins_right({
			"fileformat",
			fmt = string.upper,
			icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
			color = { fg = oxocarbon.green, gui = "bold" },
		})

		ins_right({
			"branch",
			icon = "",
			color = { fg = oxocarbon.orange, gui = "bold" },
		})

		ins_right({
			function()
				return "▊"
			end,
			color = { fg = oxocarbon.blue },
			padding = { left = 1 },
		})

		-- Now don't forget to initialize lualine
		require("lualine").setup(config)
	end,
}
