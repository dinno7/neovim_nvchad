return {
  "Exafunction/codeium.vim",
  event = "BufEnter",
  config = function()
    local map = vim.keymap.set

    map("i", "<C-g>", function()
      return vim.fn["codeium#Accept"]()
    end, { expr = true, silent = true, desc = "Codeium Accept" })

    map("i", "<C-x>", function()
      return vim.fn["codeium#Clear"]()
    end, { expr = true, silent = true, desc = "Codeium Clear" })

    map("i", "<C-]>", function()
      return vim.fn["codeium#CycleCompletions"](1)
    end, { expr = true, silent = true, desc = "Codeium Cycle Completions Next" })

    vim.g.codeium_filetypes = {
      markdown = false,
    }
  end,
}
