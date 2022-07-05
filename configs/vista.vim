let g:vista_fold_toggle_icons = ["╰─▸ ", "├─▸ "]
" let g:vista_icon_indent = ["▸ ", ""]
let g:vista_default_executive = 'ctags'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
" let g:vista_stay_on_open = 0
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
let g:vista_python_executive = 'coc'

let g:vista_sidebar_width='45'

" function! NearestMethodOrFunction() abort
"   return get(b:, 'vista_nearest_method_or_function', '')
" endfunction

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()


nnoremap <F5> <cmd>Vista!!<CR>
