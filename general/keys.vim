let mapleader = ','

" Alternate way to save
nnoremap <C-S> :w<CR>
vnoremap <C-S> <esc>:w<CR>
inoremap <C-S> <esc>:w<CR>
nnoremap <silent> <C-s> :w<CR>
nnoremap <C-Q> :q<CR>
inoremap <C-Q> <esc>:q<CR>
" nnoremap <C-Q> :bd <CR>

nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>

" Ctrl + C to xclip
vnoremap <C-c> "+y

" similar ctrl A
nnoremap <C-A> ggvG$

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")



" Change into split panels
nnoremap  <silent>   <M-tab> <C-w>w <CR>

" Make an new habit
" map <Left> <Nop>
" map <Right> <Nop>
" map <Up> <Nop>
" map <Down> <Nop>

" Use the space key to toggle folds
" nnoremap <silent> <space> za
" vnoremap <silent> <space> zf

" nnoremap <silent> <M-S-Right>    :vertical resize -2<CR>
" nnoremap <silent> <M-S-Left>    :vertical resize +2<CR>
