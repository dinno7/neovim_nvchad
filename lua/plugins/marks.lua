return {
  "chentoast/marks.nvim",
  lazy = false,
  config = function ()
    require("marks").setup({
      builtin_marks = { ".", "<", ">", "^" },
      refresh_interval = 250,
    })
  end
}
