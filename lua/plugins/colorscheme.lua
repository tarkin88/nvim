return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  opts = {
    dark_variant = "moon",
    bold_vert_split = true,
    dim_nc_background = false,
    disable_background = false,
    disable_float_background = false,
    disable_italics = false,
    groups = {
      background = "base",
      panel = "surface",
      border = "highlight_med",
      comment = "muted",
      link = "iris",
      punctuation = "subtle",

      error = "love",
      hint = "iris",
      info = "foam",
      warn = "gold",

      headings = {
        h1 = "iris",
        h2 = "foam",
        h3 = "rose",
        h4 = "gold",
        h5 = "pine",
        h6 = "foam",
      },
    },

    highlight_groups = {
      ColorColumn = { bg = "surface" },
    },
  },
  config = function(_, opts)
    require("rose-pine").setup(opts)
    vim.cmd "colorscheme rose-pine"
  end,
}
