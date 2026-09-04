return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			always_show_tabline = true,
			globalstatus = false,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
				refresh_time = 16, -- ~60fps
				events = {
					"WinEnter",
					"BufEnter",
					"BufWritePost",
					"SessionLoadPost",
					"FileChangedShellPost",
					"VimResized",
					"Filetype",
					"CursorMoved",
					"CursorMovedI",
					"ModeChanged",
				},
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { "filename" },
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "buffers" },
			lualine_z = { "location", {
				"datetime",
				style = "%H:%M",
			} },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	},
}

-- return {
-- 	"nvim-lualine/lualine.nvim",
-- 	event = "VeryLazy",
-- 	config = function()
-- 		local colors = {
-- 			normal_mode_bg = "#2ecc71",
-- 			insert_mode_bg = "#4a90e2",
-- 			visual_mode_bg = "#f5d142",
-- 			replace_mode_bg = "#e74c3c",
-- 			inactive_bg = "#080808",
-- 			fg = "#c6c6c6",
-- 			secondary_bg = "#303030",
-- 		}
--
-- 		require("lualine").setup({
-- 			options = {
-- 				theme = {
-- 					normal = {
-- 						a = { fg = colors.inactive_bg, bg = colors.normal_mode_bg },
-- 						b = { fg = colors.fg, bg = colors.secondary_bg },
-- 						c = { fg = colors.fg },
-- 					},
-- 					insert = { a = { fg = colors.inactive_bg, bg = colors.insert_mode_bg } },
-- 					visual = { a = { fg = colors.inactive_bg, bg = colors.visual_mode_bg } },
-- 					replace = { a = { fg = colors.inactive_bg, bg = colors.replace_mode_bg } },
-- 					inactive = {
-- 						a = { fg = colors.fg, bg = colors.inactive_bg },
-- 						b = { fg = colors.fg, bg = colors.inactive_bg },
-- 						c = { fg = colors.fg },
-- 					},
-- 				},
-- 				component_separators = { left = "", right = "" },
-- 				section_separators = { left = "", right = "" },
-- 			},
-- 			sections = {
-- 				lualine_a = { "mode" },
-- 				lualine_b = { "branch", "filename" },
-- 				lualine_c = {},
-- 				lualine_x = { "diagnostics", "filetype" },
-- 				lualine_y = { "progress" },
-- 				lualine_z = {
-- 					"buffers",
-- 					"location",
-- 					{
-- 						"datetime",
-- 						style = "%H:%M",
-- 						-- cond = function()
-- 						-- 	return true
-- 						-- end,
-- 					},
-- 				},
-- 				extensions = { "git", "diagnostics" },
-- 			},
-- 		})
-- 	end,
-- }
