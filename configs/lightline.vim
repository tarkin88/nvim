let g:lightline = {
      \'enable': {
      \   'tabline': 0
      \ },
      \ 'colorscheme': 'everforest',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'relativepath', 'readonly', 'modified'] ],
      \   'right': [
        \ ['cocstatus'],
        \ ['lineinfo'], ['percent'],
        \  ],
      \ },
      \ 'inactive': {
      \   'left': [ [ 'relativepath' ] ]
      \},
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \ 'gitbranch': 'FugitiveHead'
      \ },
      \ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ },
      \ }
