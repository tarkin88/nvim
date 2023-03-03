return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    options = {
      compile_path = vim.fn.stdpath("cache") .. "/nightfox",
      compile_file_suffix = "_compiled",
      dim_inactive = true,
      styles = {
        comments = "italic",
        keywords = "bold",
        types = "italic,bold",
      },
      module_default = false,
      modules = {
        aerial = true,
        cmp = true,
            ["dap-ui"] = true,
        diagnostic = true,
        gitsigns = true,
        hop = true,
        native_lsp = true,
        neotree = true,
        notify = true,
        telescope = true,
        treesitter = true,
        tsrainbow = true,
        whichkey = true,
      },
    },
    groups = {
      all = {
        NormalFloat = { link = "Normal" },
      },
    },
  },
  config = function(_, opts)
    require("nightfox").setup(opts)
    vim.cmd "colorscheme terafox"
  end,
}
