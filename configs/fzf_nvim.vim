lua << EOF
require('fzf-lua').setup{
  fzf_layout          = 'reverse',      -- fzf '--layout=' options
  fzf_args            = '',             -- adv: fzf extra args, empty unless adv
  preview_border      = 'noborder',       -- border|noborder
  preview_wrap        = 'nowrap',       -- wrap|nowrap
  preview_opts        = 'hidden',     -- hidden|nohidden
  preview_vertical    = 'down:0%',     -- up|down:size
  preview_layout      = 'vertical',         -- horizontal|vertical|flex
  flip_columns        = 120,            -- #cols to switch to horizontal on flex
}
EOF

nnoremap <C-p> <cmd>FzfLua files<CR>
nnoremap <F6> <cmd>FzfLua oldfiles<CR>
nnoremap <F7> <cmd>FzfLua grep<CR>
nnoremap <F8> <cmd>FzfLua grep_cword<CR>
