return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "emmet-ls",
      "eslint-lsp",
      "prettierd",
      "lua-language-server",
      "bash-language-server",
      "typescript-language-server",
      -- > GO lang
      "gopls",
      "gofumpt",
      "goimports",
      "golangci-lint",
      "golines",
      -- > Others
      "codespell",
      -- "clang-format",
      -- "clangd",
      -- "vue-language-server",
    },
  },
}
