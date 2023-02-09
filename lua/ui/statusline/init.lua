local statusline_opts = require("ui.config").statusline
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
return {
	setup = function(opts)
		statusline_opts = vim.tbl_deep_extend("force", statusline_opts, opts.statusline or {})
		vim.g.statusline_sep_style = statusline_opts.separator_style

		local modules = require("ui.statusline.modules")

		return table.concat({
			modules.mode(),
			modules.fileInfo(),
			modules.git(),
			-- modules.updates(),

			"%=",
			modules.LSP_progress(),
			"%=",

			modules.LSP_Diagnostics(),
			modules.LSP_status() or "",
			modules.current_session() or "",
			modules.cwd(),
			modules.cursor_position(),
		})
	end,
}
