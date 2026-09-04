-- return {
-- 	"nvim-lualine/lualine.nvim",
-- 	opts = {
-- 		options = {
-- 			icons_enabled = true,
-- 			theme = "auto",
-- 			component_separators = { left = "", right = "" },
-- 			section_separators = { left = "", right = "" },
-- 			disabled_filetypes = {
-- 				statusline = {},
-- 				winbar = {},
-- 			},
-- 			ignore_focus = {},
-- 			always_divide_middle = true,
-- 			always_show_tabline = true,
-- 			globalstatus = false,
-- 			refresh = {
-- 				statusline = 1000,
-- 				tabline = 1000,
-- 				winbar = 1000,
-- 				refresh_time = 16, -- ~60fps
-- 				events = {
-- 					"WinEnter",
-- 					"BufEnter",
-- 					"BufWritePost",
-- 					"SessionLoadPost",
-- 					"FileChangedShellPost",
-- 					"VimResized",
-- 					"Filetype",
-- 					"CursorMoved",
-- 					"CursorMovedI",
-- 					"ModeChanged",
-- 				},
-- 			},
-- 		},
-- 		sections = {
-- 			lualine_a = { "mode" },
-- 			lualine_b = { "branch", "diff", "diagnostics" },
-- 			lualine_c = { "filename" },
-- 			lualine_x = { "encoding", "fileformat", "filetype" },
-- 			lualine_y = { "buffers" },
-- 			lualine_z = { "location", {
-- 				"datetime",
-- 				style = "%H:%M",
-- 			} },
-- 		},
-- 		inactive_sections = {
-- 			lualine_a = {},
-- 			lualine_b = {},
-- 			lualine_c = { "filename" },
-- 			lualine_x = { "location" },
-- 			lualine_y = {},
-- 			lualine_z = {},
-- 		},
-- 		tabline = {},
-- 		winbar = {},
-- 		inactive_winbar = {},
-- 		extensions = {},
-- 	},
-- }

return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- Retro hacker color palette (CRT/Phosphor inspired)
		local colors = {
			-- Main phosphor green
			green = "#33ff33",
			bright_green = "#66ff66",
			dim_green = "#1a8c1a",
			dark_green = "#0d3d0d",
			very_dark_green = "#051a05",

			-- Classic terminal colors
			amber = "#ffb000",
			bright_amber = "#ffcc44",
			red = "#ff3333",
			cyan = "#00ffff",
			magenta = "#ff00ff",
			white = "#e0e0e0",
			gray = "#888888",
			dark_gray = "#222222",

			-- Background
			black = "#0a0a0a",
			dark = "#111111",
		}

		-- Function to get current buffer count (hacker style)
		local function buffer_count()
			local bufs = vim.api.nvim_list_bufs()
			local current = vim.api.nvim_get_current_buf()
			local idx
			for i, b in ipairs(bufs) do
				if b == current then
					idx = i
					break
				end
			end
			return string.format("[%d/%d]", idx or "?", #bufs)
		end

		-- Custom mode strings for retro feel
		local function mode_str()
			local m = vim.api.nvim_get_mode().mode
			local map = {
				["n"] = " NORMAL ",
				["i"] = " INSERT ",
				["v"] = " VISUAL ",
				["V"] = " VISUAL ",
				[""] = " BLOCK ",
				["s"] = " SELECT ",
				["S"] = " SELECT ",
				[""] = " SELECT ",
				["r"] = " REPLACE ",
				["c"] = " COMMAND",
				["t"] = " TERMINAL",
			}
			return map[m] or " UNKNOWN "
		end

		-- Setup lualine with retro theme
		require("lualine").setup({
			options = {
				theme = {
					-- Normal mode (green)
					normal = {
						a = { fg = colors.black, bg = colors.green },
						b = { fg = colors.green, bg = colors.dark },
						c = { fg = colors.white, bg = colors.dark },
						x = { fg = colors.cyan, bg = colors.dark },
						y = { fg = colors.amber, bg = colors.dark },
						z = { fg = colors.green, bg = colors.black },
					},
					-- Insert mode (cyan)
					insert = {
						a = { fg = colors.black, bg = colors.cyan },
						b = { fg = colors.cyan, bg = colors.dark },
						c = { fg = colors.white, bg = colors.dark },
						x = { fg = colors.cyan, bg = colors.dark },
						y = { fg = colors.amber, bg = colors.dark },
						z = { fg = colors.green, bg = colors.black },
					},
					-- Visual mode (amber)
					visual = {
						a = { fg = colors.black, bg = colors.amber },
						b = { fg = colors.amber, bg = colors.dark },
						c = { fg = colors.white, bg = colors.dark },
						x = { fg = colors.cyan, bg = colors.dark },
						y = { fg = colors.amber, bg = colors.dark },
						z = { fg = colors.green, bg = colors.black },
					},
					-- Replace mode (red)
					replace = {
						a = { fg = colors.black, bg = colors.red },
						b = { fg = colors.red, bg = colors.dark },
						c = { fg = colors.white, bg = colors.dark },
						x = { fg = colors.cyan, bg = colors.dark },
						y = { fg = colors.amber, bg = colors.dark },
						z = { fg = colors.green, bg = colors.black },
					},
					-- Command mode (amber with black bg)
					command = {
						a = { fg = colors.black, bg = colors.amber },
						b = { fg = colors.amber, bg = colors.dark },
						c = { fg = colors.white, bg = colors.dark },
						x = { fg = colors.cyan, bg = colors.dark },
						y = { fg = colors.amber, bg = colors.dark },
						z = { fg = colors.green, bg = colors.black },
					},
					-- Inactive windows (dimmed)
					inactive = {
						a = { fg = colors.gray, bg = colors.black },
						b = { fg = colors.gray, bg = colors.black },
						c = { fg = colors.gray, bg = colors.black },
						x = { fg = colors.gray, bg = colors.black },
						y = { fg = colors.gray, bg = colors.black },
						z = { fg = colors.gray, bg = colors.black },
					},
				},
				-- Retro style separators (using ASCII for compatibility)
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "▐", right = "▌" },
				-- Or for a more retro feel, use these:
				-- section_separators = { left = "", right = "" },
				globalstatus = false,
				always_divide_middle = true,
			},
			sections = {
				-- Left side
				lualine_a = {
					{
						mode_str,
						padding = { left = 1, right = 1 },
					},
				},
				lualine_b = {
					{
						"branch",
						icon = "⎇",
						padding = { left = 1, right = 1 },
					},
					{
						"diff",
						symbols = { added = "+", modified = "~", removed = "-" },
						padding = { left = 0, right = 1 },
					},
					{
						"diagnostics",
						symbols = { error = "✗", warn = "△", info = "ℹ", hint = "?" },
						padding = { left = 0, right = 1 },
					},
				},
				lualine_c = {
					{
						"filename",
						path = 1, -- Show relative path
						symbols = {
							modified = "●",
							readonly = "🔒",
							unnamed = "[No Name]",
							newfile = "✨",
						},
						padding = { left = 1, right = 1 },
					},
				},

				-- Right side
				lualine_x = {
					{
						"encoding",
						fmt = string.upper,
						padding = { left = 1, right = 0 },
					},
					{
						"fileformat",
						symbols = {
							unix = "LF",
							dos = "CRLF",
							mac = "CR",
						},
						padding = { left = 0, right = 0 },
					},
					{
						"filetype",
						icon = "◈",
						padding = { left = 1, right = 1 },
					},
				},
				lualine_y = {
					{
						buffer_count,
						padding = { left = 1, right = 1 },
					},
				},
				lualine_z = {
					{
						"location",
						padding = { left = 1, right = 0 },
					},
					{
						"datetime",
						style = "%H:%M",
						padding = { left = 1, right = 1 },
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						"filename",
						path = 1,
					},
				},
				lualine_x = {
					{ "location" },
				},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = { "fzf", "nvim-tree" },
		})
	end,
}
