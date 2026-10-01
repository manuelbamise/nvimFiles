-- Retro/hacker style for Neo-tree
-- Folders: bold and slightly bigger (using brighter color to simulate "bigger")
vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", {
	bold = true,
	fg = "#33ff33", -- bright phosphor green
	-- Note: font size can't be changed via highlight groups in most terminals
	-- but bold + brighter color gives the "bigger" feel
})

vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", {
	bold = true,
	fg = "#33ff33",
})

-- Files: normal text, dimmer green
vim.api.nvim_set_hl(0, "NeoTreeFileName", {
	bold = false,
	fg = "#1a8c1a", -- dimmer green
})

vim.api.nvim_set_hl(0, "NeoTreeFileNameOpened", {
	bold = false,
	fg = "#00ffff", -- cyan for opened files
})

vim.api.nvim_set_hl(0, "NeoTreeRootName", {
	bold = true,
	fg = "#ffb000", -- amber for root
})

vim.api.nvim_set_hl(0, "NeoTreeExpander", {
	fg = "#33ff33",
})

vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", {
	fg = "#0d3d0d", -- very dark green
})

vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", {
	fg = "#33ff33",
	bg = "#0a0a0a",
})

vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", {
	fg = "#ffb000",
	bg = "#0a0a0a",
	bold = true,
})

vim.api.nvim_set_hl(0, "NeoTreeTitleBar", {
	fg = "#0a0a0a",
	bg = "#33ff33",
})

vim.api.nvim_set_hl(0, "NeoTreeModified", {
	fg = "#ffb000",
})

vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = "#33ff33" })
vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "#ffb000" })
vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { fg = "#ff3333" })
vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = "#888888" })

vim.keymap.set("n", "<leader>e", "<Cmd>Neotree float<CR>")

return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			-- Removed nvim-web-devicons since we don't want icons
		},
		lazy = false,
		---@module 'neo-tree'
		---@type neotree.Config
		opts = {
			close_if_last_window = false,
			popup_border_style = "NC",
			clipboard = {
				sync = "none",
			},
			enable_git_status = true,
			enable_diagnostics = true,
			open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
			open_files_using_relative_paths = false,
			sort_case_insensitive = false,
			sort_function = nil,

			default_component_configs = {
				container = {
					enable_character_fade = true,
				},
				indent = {
					indent_size = 2,
					padding = 1,
					with_markers = true,
					indent_marker = "│",
					last_indent_marker = "└",
					highlight = "NeoTreeIndentMarker",
					with_expanders = true, -- enabled so we can style expanders
					expander_collapsed = ">", -- simple text instead of icon
					expander_expanded = "v", -- simple text instead of icon
					expander_highlight = "NeoTreeExpander",
				},
				modified = {
					symbol = "[+]",
					highlight = "NeoTreeModified",
				},
				name = {
					trailing_slash = false,
					use_filtered_colors = true,
					use_git_status_colors = true,
					highlight = "NeoTreeFileName",
				},
				git_status = {
					symbols = {
						added = "+",
						modified = "~",
						deleted = "x",
						renamed = "r",
						untracked = "?",
						ignored = "!",
						unstaged = "*",
						staged = "✓",
						conflict = "!",
					},
				},
				-- Disable the extra columns for a cleaner look
				file_size = { enabled = false },
				type = { enabled = false },
				last_modified = { enabled = false },
				created = { enabled = false },
				symlink_target = { enabled = false },
			},

			commands = {},

			window = {
				position = "float", -- Float by default
				width = 40,
				mapping_options = {
					noremap = true,
					nowait = true,
				},
				mappings = {
					["<C-s>"] = {
						"quick_jump",
						config = {
							on_jump = "open_or_toggle",
							jump_labels = "jfkdlsahgnuvrbytmiceoxwpqz",
						},
					},
					["<Tab>"] = "select",
					["<C-;>"] = "clear_selection",
					["<space>"] = {
						"toggle_node",
						nowait = false,
					},
					["<2-LeftMouse>"] = "open",
					["<cr>"] = "open",
					["<esc>"] = "cancel",
					["P"] = {
						"toggle_preview",
						config = {
							use_float = true,
						},
					},
					["l"] = "focus_preview",
					["S"] = "open_split",
					["s"] = "open_vsplit",
					["t"] = "open_tabnew",
					["w"] = "open_with_window_picker",
					["C"] = "close_node",
					["z"] = "close_all_nodes",
					-- File/folder operations
					["a"] = {
						"add",
						config = {
							show_path = "none",
						},
					},
					["A"] = "add_directory",
					["d"] = "delete",
					["r"] = "rename",
					["b"] = "rename_basename",
					["y"] = "copy_to_clipboard",
					["x"] = "cut_to_clipboard",
					["p"] = "paste_from_clipboard",
					["<C-r>"] = "clear_clipboard",
					["c"] = "copy",
					["m"] = "move",
					["q"] = "close_window",
					["R"] = "refresh",
					["?"] = "show_help",
					["<"] = "prev_source",
					[">"] = "next_source",
					["i"] = "show_file_details",
				},
			},

			nesting_rules = {},

			filesystem = {
				filtered_items = {
					visible = false,
					hide_dotfiles = true,
					hide_gitignored = true,
					hide_ignored = true,
					ignore_files = {
						".neotreeignore",
						".ignore",
					},
					hide_hidden = true,
					hide_by_name = {},
					hide_by_pattern = {},
					always_show = {},
					always_show_by_pattern = {},
					never_show = {},
					never_show_by_pattern = {},
				},
				follow_current_file = {
					enabled = false,
					leave_dirs_open = false,
				},
				group_empty_dirs = false,
				hijack_netrw_behavior = "open_default",
				use_libuv_file_watcher = false,
				window = {
					mappings = {
						["<bs>"] = "navigate_up",
						["."] = "set_root",
						["H"] = "toggle_hidden",
						["/"] = "fuzzy_finder",
						["D"] = "fuzzy_finder_directory",
						["#"] = "fuzzy_sorter",
						["f"] = "filter_on_submit",
						["<c-x>"] = "clear_filter",
						["[g"] = "prev_git_modified",
						["]g"] = "next_git_modified",
						["o"] = {
							"show_help",
							nowait = false,
							config = { title = "Order by", prefix_key = "o" },
						},
						["oc"] = { "order_by_created", nowait = false },
						["od"] = { "order_by_diagnostics", nowait = false },
						["og"] = { "order_by_git_status", nowait = false },
						["om"] = { "order_by_modified", nowait = false },
						["on"] = { "order_by_name", nowait = false },
						["os"] = { "order_by_size", nowait = false },
						["ot"] = { "order_by_type", nowait = false },
					},
					fuzzy_finder_mappings = {
						["<down>"] = "move_cursor_down",
						["<C-n>"] = "move_cursor_down",
						["<up>"] = "move_cursor_up",
						["<C-p>"] = "move_cursor_up",
						["<esc>"] = "close",
						["<S-CR>"] = "close_keep_filter",
						["<C-CR>"] = "close_clear_filter",
						["<C-w>"] = { "<C-S-w>", raw = true },
						{
							n = {
								["j"] = "move_cursor_down",
								["k"] = "move_cursor_up",
								["<S-CR>"] = "close_keep_filter",
								["<C-CR>"] = "close_clear_filter",
								["<esc>"] = "close",
							},
						},
					},
				},
				commands = {},
			},

			buffers = {
				follow_current_file = {
					enabled = true,
					leave_dirs_open = false,
				},
				group_empty_dirs = true,
				show_unloaded = true,
				window = {
					mappings = {
						["d"] = "buffer_delete",
						["bd"] = "buffer_delete",
						["<bs>"] = "navigate_up",
						["."] = "set_root",
						["o"] = {
							"show_help",
							nowait = false,
							config = { title = "Order by", prefix_key = "o" },
						},
						["oc"] = { "order_by_created", nowait = false },
						["od"] = { "order_by_diagnostics", nowait = false },
						["om"] = { "order_by_modified", nowait = false },
						["on"] = { "order_by_name", nowait = false },
						["os"] = { "order_by_size", nowait = false },
						["ot"] = { "order_by_type", nowait = false },
					},
				},
			},

			git_status = {
				window = {
					position = "float",
					mappings = {
						["A"] = "git_add_all",
						["gu"] = "git_unstage_file",
						["gU"] = "git_undo_last_commit",
						["ga"] = "git_add_file",
						["gt"] = "git_toggle_file_stage",
						["gr"] = "git_revert_file",
						["gc"] = "git_commit",
						["gp"] = "git_push",
						["gl"] = "git_pull",
						["gg"] = "git_commit_and_push",
						["o"] = {
							"show_help",
							nowait = false,
							config = { title = "Order by", prefix_key = "o" },
						},
						["oc"] = { "order_by_created", nowait = false },
						["od"] = { "order_by_diagnostics", nowait = false },
						["om"] = { "order_by_modified", nowait = false },
						["on"] = { "order_by_name", nowait = false },
						["os"] = { "order_by_size", nowait = false },
						["ot"] = { "order_by_type", nowait = false },
					},
				},
			},
		},
	},
}
