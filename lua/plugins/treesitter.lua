return {
'nvim-treesitter/nvim-treesitter',
    version = false,
    build = ":TSUpdate",
    cmd = {
      "TSBufDisable",
      "TSBufEnable",
      "TSBufToggle",
      "TSDisable",
      "TSEnable",
      "TSToggle",
      "TSInstall",
      "TSInstallInfo",
      "TSInstallSync",
      "TSModuleInfo",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
    },
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
        "pyhon",
        "query",
        "regex",
        "vim",
        "yaml",
      },
       highlight = { enable = true },
      indent = { enable = true, disable = { "python" } },
      context_commentstring = { enable = true },
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
    end,

}
