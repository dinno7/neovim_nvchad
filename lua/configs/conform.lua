local options = {
  formatters_by_ft = {
    -- Use the "*" filetype to run formatters on all filetypes.
    -- ["*"] = { "codespell" },
    -- Use the "_" filetype to run formatters on filetypes that don't
    -- have other formatters configured.
    ["_"] = { "trim_whitespace" },

    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
    css = { "prettierd" },
    html = { "prettierd" },
    json = { "prettierd" },
    yaml = { "prettierd" },
    markdown = { "prettierd" },
    graphql = { "prettierd" },
    vue = { "volar" },
    lua = { "stylua" },
    python = { "isort", "black" },
    cpp = { "clang-format" },
    go = { { "gofumpt", "goimports-reviser" } },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  },
}

return options
