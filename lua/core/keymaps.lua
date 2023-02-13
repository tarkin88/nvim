local map = require("core.utils").map
local opts = { silent = true, noremap = true }

map("n", "<C-s>", "<cmd>w<CR>", opts)
map("n", "<C-q>", "<cmd>q<CR>", opts)
map("n", "<ESC>", [[<C-\><C-n>]], opts)
map("n", "<leader>h", "<cmd>nohlsearch<cr>", opts)
