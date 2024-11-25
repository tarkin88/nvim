vim.keymap.set(
  "",
  "<space>",
  "<nop>",
  { noremap = true, silent = true, desc = "space does not do anything except being a leader key" }
)

local utils = require("core.utils")
local mode_keymaps = {

  normal = {
    ["q"] = { action = "<nop>", desc = "do not record macro, ever" },

    ["x"] = { action = '"_x', desc = "deleted character does not go into clipboard" },

    ["<C-q>"] = { action = "<cmd>quit<return>", desc = "close the current window" },
    ["<C-s>"] = { action = "<cmd>write<return>", desc = "write changes in the current window" },

    ["<C-h>"] = { action = "<C-w>h", desc = "move focus to the pane on the left" },
    ["<C-j>"] = { action = "<C-w>j", desc = "move focus to the pane below" },
    ["<C-k>"] = { action = "<C-w>k", desc = "move focus to the pane above" },
    ["<C-l>"] = { action = "<C-w>l", desc = "move focus to the pane on the right" },

    ["<M-right>"] = { action = "<cmd>bnext<return>", desc = "switch to the next buffer" },
    ["<M-left>"] = { action = "<cmd>bprevious<return>", desc = "switch to the previous buffer" },

    ["<leader>v"] = { action = "<cmd>split<return>", desc = "horizontal split" },
    ["<leader>h"] = { action = "<cmd>vsplit<return>", desc = "vertical split" },

    ["<C-m>"] = { action = "<cmd>vertical resize -2<return>", desc = "reduce current window number of rows" },
    ["<C-n>"] = { action = "<cmd>vertical resize +2<return>", desc = "increase current window number of columns" },
    ["<C-,>"] = { action = "<cmd>horizontal resize -2<return>", desc = "reduce current window number of columns" },
    ["<C-.>"] = { action = "<cmd>horizontal resize +2<return>", desc = "increase current window number of rows" },

    ["<Esc>"] = { action = "<cmd>nohlsearch<return>", desc = "remove highlight from search results" },

    ["<leader>t"] = { action = "<cmd>terminal<return>", desc = "open a terminal in the current window" },
    ["<leader>j"] = {
      action = "<cmd>botright new | resize 12 | terminal<return>",
      desc = "open a terminal in VS Code style",
    },

    ["<leader>a"] = { action = "za", desc = "fold the scope under cursor" },
    ["<leader>r"] = { action = "zR", desc = "expand all folds in the current buffer" },

    ["gb"] = { action = "<C-t>", desc = "go back after jump, e.g., goto definition" },
  },

  visual = {

    ["H"] = { action = "<gv", desc = "move highlighted text to the left" },
    ["J"] = { action = ":move '>+1<return>gv", desc = "move highlighted text down" },
    ["K"] = { action = ":move '<-2<return>gv", desc = "move highlighted text up" },
    ["L"] = { action = ">gv", desc = "move highlighted text to the right" },
    ["<C-c>"] = { action = '"+y', desc = "copy yank to the clipboard" },
    ["p"] = { action = '"_dP', desc = "better paste" },
    ["<leader>s"] = {
      action = "<cmd>lua vim.api.nvim_feedkeys(':ExactReplace ', 'c', false)<return>",
      desc = "search and replace exact words in highlighted text",
    },

    ["<leader>a"] = {
      action = ":s/$/",
      desc = "create multiple cursors and add text to the end of multiple lines",
    },

    ["<leader>i"] = {
      action = ":s/^/",
      desc = "create multiple cursors and add text to the beginning of multiple lines",
    },

    ["<leader>p"] = {
      action = "<cmd>lua vim.api.nvim_feedkeys(':AppendTo ', 'c', false)<return>",
      desc = "search and add text following the search results",
    },
  },

  command = {

    ["<C-y>"] = {
      action = "/g | nohlsearch<return>",
      desc = "confirm substitution-like operations without any highlight remaining",
    },
  },

  terminal = {

    ["qq"] = { action = "<C-\\><C-n>", desc = "exit terminal mode without closing the terminal" },
  },
}

utils.global_map(mode_keymaps)
