return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "<leader>cF",
      function() require("conform").format { formatters = { "injected" }, timeout_ms = 3000 } end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
  },
  opts = {
    format_on_save = {
      timeout_ms = 500,
      async = false,
      quiet = false,
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      fish = { "fish_indent" },
      lua = { "stylua" },
      markdown = { "prettier" },
      python = { "isort", "black" },
      sh = { "shfmt" },
      yaml = { "prettier" },
      ["*"] = { "codespell", "trim_whitespace" },
    },
    formatters = {
      injected = { options = { ignore_errors = true } },
    },
  },
  config = true,
}
