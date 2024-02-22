:colorscheme default

"show line numbers on the left
:set number

:set tabstop=4
:set softtabstop=4

:set shiftwidth=4
:set expandtab
:set smarttab
:syntax on
:filetype indent on
:set autoindent
:set smartindent
:set cindent
:set cino=(0,ws,Ws,m1)

:set tpm=30

:set showtabline=2
:set spell spelllang=en_us

function! Vtip()
    echomsg system('curl -s -m 3 https://vtip.43z.one')
endfunction
