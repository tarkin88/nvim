return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  dependencies = {
    "windwp/nvim-ts-autotag",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "p00f/nvim-ts-rainbow",
    "andymass/vim-matchup",
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
    -- rainbow = {
    --   enable = true,
    --   disable = { "html" },
    --   extended_mode = false,
    --   max_file_lines = nil,
    -- },
    -- autopairs = { enable = true },
    -- autotag = { enable = true },
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
