local map = require("core.utils").map
local opts = { silent = true }

map("n", "<C-s>", "<cmd>w<CR>", opts)
map("n", "<C-q>", "<cmd>q<CR>", opts)
