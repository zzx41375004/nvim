" _____           __     ___
"|__  /______  __ \ \   / (_)_ __ ___
"  / /|_  /\ \/ /  \ \ / /| | '_ ` _ \
" / /_ / /  >  <    \ V / | | | | | | |
"/____/___|/_/\_\    \_/  |_|_| |_| |_|

let mapleader=" "
function! MySys()
    if has("win32")
        return "windows"
    else
        return "linux"
    endif
endfunction

let g:plug_file_path = ""

if has("win32")
    let g:plug_file_path = "~/AppData/Local/nvim/plugged"
    let g:VIMPATH = "~/AppData/Local/nvim"
else
    let g:plug_file_path = "~/.config/nvim/plugged"
    let g:VIMPATH = "~/.config/nvim"
endif

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set shortmess+=c
set updatetime=100
set termencoding=utf-8
set fileencoding=utf-8
set timeoutlen=3000
"set shell=powershell.exe

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set noswapfile
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set scrolloff=99
set sidescrolloff=6
set tw=0
set indentexpr=
set backspace=indent,eol,start
"set foldmethod=indent
"set foldlevel=99
set foldmethod=marker
set laststatus=2
set autochdir
set shortmess=atl
set formatoptions=tcrqn
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
		  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
		  \,sm:block-blinkwait175-blinkoff150-blinkon175

"let &t_SI = \"<Esc>]50;CursorShape=1\x7"
"let &t_SR = \"<Esc>]50;CursorShape=2\x7"
"let &t_EI = \"<Esc>]50;CursorShape=0\x7"
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

let &t_ut=''
set nocompatible
set number
set relativenumber
syntax on
set wrap
set linebreak
set showcmd
set noshowmode
set wildmenu
set hlsearch
let loaded_matchparen = 0
set incsearch
set ignorecase
set smartcase
set clipboard+=unnamed,unnamedplus
set clipboard+=unnamedplus
"set mouse=a
set cursorline
"set cursorcolumn
set cmdheight=1
set noerrorbells
set showmatch
"set visualbell
set autoindent
set smartindent
set cindent
set pyxversion=3
"set pythonthreedll=python39.dll
"set fillchars=vert:\,stl:\,stlnc:\
set hidden
set tags=tags
set tags+=./tags

exec 'nohl'

" if has("nvim")
" autocmd TermOpen * startinsert
" endif

exec 'source '.g:VIMPATH.'/map.vim'
exec 'source '.g:VIMPATH.'/plug.vim'
" source ~/.config/nvim/map.vim
" source ~/.config/nvim/plug.vim

autocmd FileType vim setlocal commentstring=\"\ %s
autocmd FileType c,cpp,json setlocal commentstring=//\ %s
autocmd FileType py setlocal commentstring=\#\ %s
autocmd FileType markdown setlocal commentstring=<!--\ %s\-->

autocmd WinLeave * setlocal nocursorline
" autocmd WinEnter * setlocal cursorline
autocmd BufEnter * setlocal cursorline
autocmd BufEnter,BufRead,BufNewFile *.md set filetype=markdown
autocmd BufEnter,BufRead,BufNewFile *.md set fdm=marker
autocmd BufEnter,BufRead,BufNewFile vifmrc set filetype=vim
autocmd BufWritePre * :%s/\s\+$//e
" U<C-j> for both expand and jump (make expand higher priority.)

noremap <nowait> <LEADER>bb :call Compile()<CR>
noremap <LEADER>B :call ZzxRun()<CR>
nmap <silent> <nowait> <M-k> gcc
vmap <silent> <nowait> <M-k> gc

let curdir = substitute(getcwd(), $HOME, "~", "g")
let g:file_whole_name = @%
let file_exe_name = expand('%<').'.exe'
" let g:file_exe_name = expand('%<')
let g:file_name = expand('%:t<')

func! Compile()
    let name=g:file_whole_name
    if &filetype == 'cpp'
        exec 'tabe'
        exec 'term g++ '.name.' -o ~/Documents/cpptmp.exe'
    elseif &filetype == 'c'
        exec 'tabe'
        exec 'term gcc '.name.' -o ~/Documents/ctmp.exe'
    elseif &filetype == 'go'
        exec 'tabe'
        exec 'term go build'
    "" call system('st -e sh -c \"g++ ' .g:file_name. ' -o ~/Documents/cpptmp.exe; read a"')
  endif
endfunc

function! ZzxRun()
    if &filetype == 'cpp'
        call system('st -e sh -c "~/Documents/cpptmp.exe; echo; echo; echo [process end]; read a"')
    elseif &filetype == 'c'
        call system('st -e sh -c "~/Documents/ctmp.exe; echo; echo; echo [process end]; read a"')
    elseif &filetype == 'java'
       exec "!javac %"
       exec "!time java %<"
    elseif &filetype == 'asm'
       exec "!lc3as %<"
    elseif &filetype == 'sh'
     :!time bash %
   elseif &filetype == 'python'
     set splitbelow
     :sp
     :term python3 %
   elseif &filetype == 'html'
     silent! exec "!".g:mkdp_browser." % &"
   elseif &filetype == 'markdown'
     exec "InstantMarkdownPreview"
   elseif &filetype == 'tex'
     silent! exec "VimtexStop"
     silent! exec "VimtexCompile"
   elseif &filetype == 'dart'
     exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
     silent! exec "CocCommand flutter.dev.openDevLog"
   elseif &filetype == 'javascript'
     set splitbelow
     :sp
     :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
   elseif &filetype == 'go'
       call system('st -e sh -c "go run '.@%.'; echo; echo [ Process exit ]; read a"')
  endif
endfunc

exec 'highlight Cursor guibg=Red'

" ##### auto fcitx  ###########
" let g:input_toggle = 1
" function! Fcitx2en()
"    let s:input_status = system("fcitx5-remote")
"    if s:input_status == 2
"       let g:input_toggle = 1
"       let l:a = system("fcitx5-remote -c")
"    endif
" endfunction

" function! Fcitx2zh()
"    let s:input_status = system("fcitx5-remote")
"    if s:input_status != 2 && g:input_toggle == 1
"       let l:a = system("fcitx5-remote -o")
"       let g:input_toggle = 0
"    endif
" endfunction

" set ttimeoutlen=150
" 退出插入模式
" autocmd InsertLeave * call Fcitx2en()
" 进入插入模式
" autocmd InsertEnter * call Fcitx2zh()
" ##### auto fcitx end ######
"
