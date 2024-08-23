return {
  "ray-x/go.nvim",
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup {}
    require("nvim-treesitter.configs").setup {
      incremental_selection = {
        enable = enable,
        keymaps = {
          -- mappings for incremental selection (visual mappings)
          init_selection = "", -- maps in normal mode to init the node/scope selection
          node_incremental = "", -- increment to the upper named parent
          scope_incremental = "", -- increment to the upper scope (as defined in locals.scm)
          node_decremental = "", -- decrement to the previous node
        },
      },
    }

    -- Run gofmt + goimports on save
    local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        require("go.format").goimports()
      end,
      group = format_sync_grp,
    })
  end,
  -- event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
