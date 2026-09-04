-- recommended mappings
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous)
-- swapping buffers between windows
vim.keymap.set("n", "<leader><leader>h", require("smart-splits").swap_buf_left)
vim.keymap.set("n", "<leader><leader>j", require("smart-splits").swap_buf_down)
vim.keymap.set("n", "<leader><leader>k", require("smart-splits").swap_buf_up)
vim.keymap.set("n", "<leader><leader>l", require("smart-splits").swap_buf_right)

local wk = require("which-key")

local map = vim.keymap.set

-- Define the buffer group in which-key
wk.add({
	{ "<leader>p", group = "MiniPick Keymaps" },
	{ "<leader>b", group = "Buffer Keymaps " },
	{ "<leader>pb", desc = "Buffer " },
	{ "<leader>pg", desc = "Grep" },
	{ "<leader>pgl", desc = "Grep Live" },
	{ "<leader>ph", desc = "Help" },
	{ "<leader>pf", desc = "Files" },
	{
		mode = { "n" },
	},
})

-- The actual keymaps (needed for which-key to trigger)
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete buffer" })
map("n", "<leader>bl", "<cmd>Pick buffers<cr>", { desc = "List buffers" })

map("n", "<leader>pb", "<cmd>Pick buffers<cr>", { desc = "List buffers" })
map("n", "<leader>pf", "<cmd>Pick files<cr>", { desc = "List files" })
map("n", "<leader>pg", "<cmd>Pick grep<cr>", { desc = "grep" })
map("n", "<leader>pgl", "<cmd>Pick grep_live<cr>", { desc = "grep live" })
map("n", "<leader>ph", "<cmd>Pick help<cr>", { desc = "help" })
