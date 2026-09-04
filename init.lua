require("config.lazy")

-- set background to terminal
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
-- Optional: also clear sidebars and floats
vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })

-- set the number of spaces a tab inputs in insert mode
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.cmd("filetype plugin indent on")

-- vim.opt.lineheight = 2

-- :checkhealth vim.lsp (to check the status of the installed LSPs)

-- vim.keymap.set('n','K',vim.lsp.buf.hover)

-- vim.lsp.enable("lua_ls")
