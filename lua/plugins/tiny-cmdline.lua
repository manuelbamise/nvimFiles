-- return {
-- 	"rachartier/tiny-cmdline.nvim",
-- 	-- event = "Lazy",
-- 	config = function()
-- 		local colors = {
-- 			green = "#33ff33",
-- 			dark_green = "#0d3d0d",
-- 			very_dark_green = "#051a05",
-- 			amber = "#ffb000",
-- 			red = "#ff3333",
-- 			cyan = "#00ffff",
-- 			white = "#e0e0e0",
-- 			black = "#0a0a0a",
-- 			dark = "#111111",
-- 		}
--
-- 		require("tiny-cmdline").setup({
-- 			width = {
-- 				value = "70%", -- Slightly wider for that terminal feel
-- 				min = 50,
-- 				max = 90,
-- 			},
-- 			position = {
-- 				x = "50%",
-- 				y = "45%", -- Classic terminal prompt position
-- 			},
-- 			border = "single", -- Single border like old terminals
-- 			menu_col_offset = 3,
-- 			native_types = { "/", "?" },
-- 			title = {
-- 				enabled = true,
-- 				pos = "left",
-- 			},
-- 			on_reposition = function(window)
-- 				-- Make it look like a phosphor screen
-- 				local border_hl = vim.api.nvim_create_namespace("TinyCmdlineGlow")
-- 				vim.api.nvim_set_hl(0, "TinyCmdlineBorder", {
-- 					fg = colors.green,
-- 					bg = colors.very_dark_green,
-- 					bold = true,
-- 					italic = false,
-- 				})
-- 				vim.api.nvim_set_hl(0, "TinyCmdlineTitle", {
-- 					fg = colors.amber, -- Amber title for contrast
-- 					bg = colors.dark,
-- 					bold = true,
-- 				})
-- 				vim.api.nvim_set_hl(0, "TinyCmdline", {
-- 					fg = colors.green,
-- 					bg = colors.black,
-- 				})
-- 				vim.api.nvim_set_hl(0, "TinyCmdlineCursor", {
-- 					fg = colors.black,
-- 					bg = colors.green,
-- 					bold = true,
-- 				})
-- 			end,
-- 		})
--
-- 		-- Set up the color scheme for the cmdline
-- 		vim.api.nvim_set_hl(0, "TinyCmdlineBorder", { fg = colors.green, bg = colors.black })
-- 		vim.api.nvim_set_hl(0, "TinyCmdlineTitle", { fg = colors.amber, bg = colors.dark })
-- 		vim.api.nvim_set_hl(0, "TinyCmdline", { fg = colors.green, bg = colors.black })
-- 		vim.api.nvim_set_hl(0, "TinyCmdlineCursor", { fg = colors.black, bg = colors.green })
-- 	end,
-- }

return {
	"rachartier/tiny-cmdline.nvim",
	event = "VeryLazy",
	config = function()
		-- Same color palette as Lualine (retro/hacker theme)
		local colors = {
			green = "#33ff33",
			bright_green = "#66ff66",
			dim_green = "#1a8c1a",
			dark_green = "#0d3d0d",
			very_dark_green = "#051a05",
			amber = "#ffb000",
			bright_amber = "#ffcc44",
			red = "#ff3333",
			cyan = "#00ffff",
			magenta = "#ff00ff",
			white = "#e0e0e0",
			gray = "#888888",
			dark_gray = "#222222",
			black = "#0a0a0a",
			dark = "#111111",
		}

		-- Setup the cmdline with retro hacker style
		require("tiny-cmdline").setup({
			-- Cmdline window width - wide enough for commands but not too wide
			width = {
				value = "60%",
				min = 50,
				max = 100,
			},

			-- Perfectly centered on screen
			position = {
				x = "50%", -- Horizontal center
				y = "50%", -- Vertical center
			},

			-- Border style for the floating window
			border = "rounded", -- Can use "single", "double", "rounded", "solid", "shadow", "none"

			-- Horizontal offset of the completion menu anchor
			menu_col_offset = 3,

			-- Keep search commands native (they already look retro)
			native_types = { "/", "?" },

			-- Title configuration with retro style
			title = {
				enabled = true,
				pos = "center", -- Center the title for hacker feel
			},

			-- Callback for custom styling
			on_reposition = function(window)
				-- Apply retro colors to the window
				vim.api.nvim_set_hl(0, "TinyCmdlineBorder", {
					fg = colors.green,
					bg = colors.black,
					bold = true,
				})
				vim.api.nvim_set_hl(0, "TinyCmdlineTitle", {
					fg = colors.amber,
					bg = colors.dark,
					bold = true,
				})
				vim.api.nvim_set_hl(0, "TinyCmdline", {
					fg = colors.green,
					bg = colors.black,
				})
				vim.api.nvim_set_hl(0, "TinyCmdlineCursor", {
					fg = colors.black,
					bg = colors.green,
					bold = true,
				})
			end,
		})

		-- Additional retro styling for the cmdline
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = function()
				-- Set cmdline colors to match retro theme
				vim.api.nvim_set_hl(0, "TinyCmdlineBorder", {
					fg = colors.green,
					bg = colors.black,
					bold = true,
				})
				vim.api.nvim_set_hl(0, "TinyCmdlineTitle", {
					fg = colors.amber,
					bg = colors.dark,
					bold = true,
				})
				vim.api.nvim_set_hl(0, "TinyCmdline", {
					fg = colors.green,
					bg = colors.black,
				})
				vim.api.nvim_set_hl(0, "TinyCmdlineCursor", {
					fg = colors.black,
					bg = colors.green,
					bold = true,
				})
			end,
		})
	end,
}
