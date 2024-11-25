return {
  {
    "echasnovski/mini.files",
    version = false,
    opts = {
      mappings = {
        close = "<Escape>",
        go_in_plus = "<CR>",
      },
    },
    config = true,
    keys = {
      { "<leader>e", "", desc = "+files", mode = { "n", "v" } },
      { "<leader>ef", "<cmd>lua MiniFiles.open(MiniFiles.get_latest_path())<cr>", desc = "open mini files" },
      {
        "<leader>ee",
        "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<cr>",
        desc = "open mini files in current path",
      },
    },
  },
  -- {
  --   "echasnovski/mini.completion",
  --   version = false,
  --   opts = {
  --     window = {
  --       info = { height = 25, width = 80, border = "none" },
  --       signature = { height = 25, width = 80, border = "none" },
  --     },
  --   },
  --   config = true,
  -- },
}
