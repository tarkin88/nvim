return {
  { "nvim-lua/plenary.nvim", module = "plenary" },
  { "famiu/bufdelete.nvim", cmd = { "Bdelete", "Bwipeout" } },

  { "MunifTanjim/nui.nvim", lazy = true },
  { "nathom/filetype.nvim", event = "BufRead" },
  { "folke/noice.nvim", config = true },
  { "lewis6991/impatient.nvim" },
  -- {
  --   "stevearc/dressing.nvim",
  --   opts = {
  --     input = {
  --       default_prompt = "➤ ",
  --       win_options = { winhighlight = "Normal:Normal,NormalNC:Normal" },
  --     },
  --     select = {
  --       backend = { "telescope", "builtin" },
  --       builtin = { win_options = { winhighlight = "Normal:Normal,NormalNC:Normal" } },
  --     },
  --   },
  -- },
  {
    "numToStr/Comment.nvim",
    keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
    opts = function()
      return { pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook() }
    end,
  },
  -- {
  --   "NMAC427/guess-indent.nvim",
  --   opts = {
  --     auto_cmd = true,
  --   },
  --   config = function(_, opts) require("guess-indent").setup(opts) end,
  -- },
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
    "iamcco/markdown-preview.nvim",
    opt = true,
    build = function() vim.fn["mkdp#util#install"]() end,
    ft = "markdown",
    cmd = { "MarkdownPreview" },
    dependencies = { "zhaozg/vim-diagram", "aklt/plantuml-syntax" },
  },
}
