return {
  "Djancyp/better-comments.nvim",
  event = "VeryLazy",
  config = function()
    require("better-comment").Setup {
      tags = {
        {
          name = ">",
          fg = "#a5adcb",
          bg = "",
          bold = true,
          virtual_text = "📚",
        },
        {
          name = ":",
          fg = "#b8c0e0",
          bg = "",
          bold = false,
          virtual_text = "",
        },
        {
          name = "!",
          fg = "#ed8796",
          bg = "",
          bold = true,
          virtual_text = "‼️",
        },
        {
          name = "?",
          fg = "#8aadf4",
          bg = "",
          bold = true,
          virtual_text = "❔",
        },
      },
    }
  end,
}
