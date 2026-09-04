-- return {"nmac427/guess-indent.nvim", opt={auto_cmd = false,
--     override_editorconfig = false,
--     filetype_exclude = { "netrw", "tutor" },
--     buftype_exclude = { "help", "nofile", "terminal", "prompt" },
--     on_tab_options = {
--       expandtab = false,
--     },
--     on_space_options = {
--       expandtab = true,
--       tabstop = "detected",
--       softtabstop = "detected",
--       shiftwidth = "detected",
--     },},  cmd = { "GuessIndent" },  event = "BufReadPost",
--
-- }

return{
  "nmac427/guess-indent.nvim",
  opts = {
    auto_cmd = true,
    on_space_options = {
      expandtab = true,
      tabstop = "detected",
      softtabstop = "detected",
      shiftwidth = "detected",
    },
    on_tab_options = {
      expandtab = false,
    },
  },
  event = "BufReadPost",
  cmd = { "GuessIndent" },
}
