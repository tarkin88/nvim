return {
  "nvim-lua/plenary.nvim",
  "MunifTanjim/nui.nvim",
  "stevearc/dressing.nvim",
  { "echasnovski/mini.extra", version = false, config = true },
  { "echasnovski/mini.surround", version = false, config = true },
  { "echasnovski/mini.statusline", version = false, config = true },
  { "echasnovski/mini.comment", version = false, config = true },
  { "echasnovski/mini.cursorword", version = false, config = true },
  { "echasnovski/mini.animate", version = false, config = true },
  { "echasnovski/mini.tabline", version = false, config = true },
  { "echasnovski/mini.pairs", version = false, config = true },
  {
    "echasnovski/mini.clue",
    version = false,
    opts = function()
      local miniclue = require("mini.clue")
      local opts = {
        window = {
          delay = 100,
          config = {
            width = 60,
          },
        },
        triggers = {
          -- Leader triggers
          { mode = "n", keys = "<Leader>" },
          { mode = "x", keys = "<Leader>" },

          -- Built-in completion
          { mode = "i", keys = "<C-x>" },

          -- `g` key
          { mode = "n", keys = "g" },
          { mode = "x", keys = "g" },

          -- Marks
          { mode = "n", keys = "'" },
          { mode = "n", keys = "`" },
          { mode = "x", keys = "'" },
          { mode = "x", keys = "`" },

          -- Registers
          { mode = "n", keys = '"' },
          { mode = "x", keys = '"' },
          { mode = "i", keys = "<C-r>" },
          { mode = "c", keys = "<C-r>" },

          -- Window commands
          { mode = "n", keys = "<C-w>" },

          -- `z` key
          { mode = "n", keys = "z" },
          { mode = "x", keys = "z" },
        },
        clues = {
          -- Enhance this by adding descriptions for <Leader> mapping groups
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows({ submode_resize = true }),
          miniclue.gen_clues.z(),
        },
      }
      return opts
    end,
    config = true,
  },
  { "echasnovski/mini.notify", version = false, config = true },

  {
    "echasnovski/mini.icons",
    version = false,
    config = function()
      local icons = require("mini.icons")
      icons.setup()
      icons.tweak_lsp_kind()
    end,
  },
  {
    "echasnovski/mini.bufremove",
    version = false,
    keys = {
      { "<M-Down>", "<cmd>lua require('mini.bufremove').delete()<cr>", desc = "remove buffer" },
    },
    config = true,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPre",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { show_start = false, show_end = false },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "lazy",
          "mason",
          "text",
          "notify",
          "toggleterm",
        },
      },
    },
    config = true,
  },
  { "lewis6991/gitsigns.nvim", config = true },
}
