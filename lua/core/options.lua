vim.g.mapleader = " "

vim.g.mapleader = " "
vim.g.maplocalleader = ","

local options = {

  -- options to configure user interface
  clipboard = vim.env.SSH_TTY and "",
  cmdheight = 1, -- only need to display one line for commands
  pumheight = 10, -- pop up menu height
  showtabline = 0, -- hide tabline
  inccommand = "split", -- when substituting multiple texts, display a preview at the bottom
  timeoutlen = 300, -- time for user to finish a key combination
  updatetime = 200, -- faster completion
  showmode = false, -- mode will be shown by statusline instead
  virtualedit = "block", -- enable highlighting empty spaces

  -- options to configure the left column
  magic = true, -- enable magic characters
  colorcolumn = "100", -- highlight the 80th column
  relativenumber = true, -- display relative line numbers
  number = true, -- display the current line number
  numberwidth = 4, -- set the width of number column
  signcolumn = "yes", -- add a column next to line number for signs

  -- options to configure how tab behaves

  expandtab = true, -- convert tabs into spaces
  switchbuf = "usetab", -- Use already opened buffers when switching
  showtabline = 2, -- Always show tabline
  -- options to configure how texts are shown in a window

  mouse = "a", -- disable the mouse in neovim
  wrap = false, -- no text wrapping (ugly)
  smartindent = true, -- automatic indentation
  sidescrolloff = 6, -- minimal number of screen columns to the left and right of the cursor
  smoothscroll = true,
  mousescroll = "ver:20,hor:6", -- Customize mouse scroll

  -- ui
  termguicolors = true, -- use the proper color
  breakindent = true, -- Indent wrapped lines to match line start
  cursorline = true, -- Enable highlighting of the current line
  laststatus = 2, -- Always show statusline
  linebreak = true, -- Wrap long lines at 'breakat' (if 'wrap' is set)
  list = true, -- Show helpful character indicators
  pumblend = 10, -- Make builtin completion menus slightly transparent
  pumheight = 10, -- Make popup menu smaller
  shortmess = "aoOWFcS", -- Disable certain messages from |ins-completion-menu|
  winblend = 10, -- Make floating windows slightly transparent
  wrap = false, -- Display long lines as just one line

  -- Editing
  autoindent = true, -- Use auto indent
  shiftwidth = 2, -- the number of spaces for each indentation
  formatoptions = "rqnl1j", -- Improve comment editing

  -- options to configure how search works
  incsearch = true, -- Show search results while typing
  hlsearch = true, -- highlight all words that match the search pattern
  ignorecase = true, -- search is case-insensitive
  smartcase = true, -- but if our search contains uppercase(s), it become case-sensitive

  -- options to configure how multiple panes behave

  splitbelow = true, -- for a vertical split, the new window goes to the bottom
  splitright = true, -- for a horizontal split, the new window goes to the right
  splitkeep = "screen",

  -- options to configure how text folding works
  foldmethod = "indent", -- Set 'indent' folding method
  foldlevel = 1, -- Display all folds except top ones
  foldnestmax = 10, -- Create folds only for some number of nested levels
  fillchars = {
    eob = " ", -- removes tilde from number column in a short file
    fold = "-", -- replace dots from trailing fold characters
  },

  foldlevelstart = 99, -- new files open with everything unfolded
  foldtext = "", -- keep colors of folded lines

  -- miscellaneous

  backup = false, -- do not creates a backup file
  writebackup = false, -- if a file is being edited in another program
  swapfile = false, -- do not creates a swapfile
  undofile = true, -- enable persistent undo
  fileencoding = "utf-8", -- the encoding written to a file

  --spelling
  spelllang = "en",
  spelloptions = "camel",
}

-- set all option parameters to their respective values

for parameter, value in pairs(options) do
  vim.opt[parameter] = value
end

vim.g.markdown_folding = 1 -- Use folding by heading in markdown files
vim.opt.iskeyword:append("-") -- Treat dash separated words as a word text object
vim.opt.complete:append("kspell") -- Add spellcheck options for autocomplete
vim.opt.complete:remove("t") -- Don't use tags for completion
vim.opt.completeopt:append("fuzzy") -- Use fuzzy matching for built-in completion
