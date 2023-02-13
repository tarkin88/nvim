require("mini.tabline").setup {
  show_icons = true,
  set_vim_settings = true,
  tabpage_section = "left",
}

local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }

keymap("n", "<A-Right>", "<cmd>bnext<cr>", opts)
keymap("n", "<A-Left>", "<cmd>bprevious<cr>", opts)
keymap("n", "<A-Down>", "<cmd>bdelete<cr>", opts)
keymap("n", "<A-Up>", "<cmd>Telescope buffers<cr>", opts)
