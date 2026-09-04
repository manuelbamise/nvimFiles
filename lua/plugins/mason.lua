--
-- return{	{"mason-org/mason.nvim", opts = {}},
--         {"williamboman/mason-lspconfig.nvim",
--          ensure_installed={
--          "lua_ls"}},
--         {"neovim/nvim-lspconfig", 
--
--        }
--  }
--

return {	{"mason-org/mason.nvim", opts = {}},{
  "williamboman/mason-lspconfig.nvim",
  ensure_installed={"lua_ls"},
  dependencies = {
    { "neovim/nvim-lspconfig", dependencies = { "AstroNvim/astrolsp", opts = {features={
    inlay_hints=true}} },  config = function ()
                vim.lsp.enable({"lua_ls"})
        end},
  },
  opts = {}
}}
