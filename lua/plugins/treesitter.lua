return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
    {
      "andymass/vim-matchup",
      config = function() vim.g.matchup_matchparen_offscreen = { method = "popup" } end,
    },
  },
  build = ":TSUpdate",
  opts = {
    sync_install = false,
    ensure_installed = {
      "bash",
      "dockerfile",
      "help",
      "html",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "vim",
      "yaml",
    },
    highlight = { enable = true },
    indent = {
      enable = false,
      disable = { "python" },
    },
    matchup = {
      enable = true,
      disable = { "c", "ruby" },
    },
    context_commentstring = { enable = true, enable_autocmd = false },
    autopairs = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
    -- Treesitter based folding
    vim.opt.foldlevel = 20
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  end,
}
