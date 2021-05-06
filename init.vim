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


if has("win32")
  if empty(glob('~/vimfiles/autoload/plug.vim'))
    silent !iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
          \ ni $HOME/vimfiles/autoload/plug.vim -Force
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
else
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
  	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
  				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
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

source ~/.config/nvim/map.vim

"function ClosePair(char)
"if getline('.')[col('.') - 1] == a:char
"   return \"\<Right>"
"else
"    return a:char
"endif
"endf
exec 'nohl'

" if has("nvim")
" autocmd TermOpen * startinsert
" endif

source ~/.config/nvim/plug.vim

autocmd FileType vim setlocal commentstring=\"\ %s
autocmd FileType c,cpp setlocal commentstring=//\ %s
autocmd FileType py setlocal commentstring=\#\ %s

autocmd WinLeave * setlocal nocursorline
" autocmd WinEnter * setlocal cursorline
autocmd BufEnter * setlocal cursorline
autocmd BufWritePre * :%s/\s\+$//e
" U<C-j> for both expand and jump (make expand higher priority.)

noremap <nowait> <LEADER>b :call Compile()<CR>
noremap <LEADER>B :call ZzxRun()<CR>
nmap <silent> <nowait> <M-k> gcc
vmap <silent> <nowait> <M-k> gc

let curdir = substitute(getcwd(), $HOME, "~", "g")
let g:file_whole_name = @%
let file_exe_name = expand('%<').'.exe'
" let g:file_exe_name = expand('%<')
let g:file_name = expand('%:t<')

func! Compile()
  if &filetype == 'cpp'
    let name = g:file_whole_name
    exec'tabe'
    exec 'te g++ '.name.' -o ~/Documents/tmpAlgorithmResult.exe'
    " call system('st -e sh -c \"g++ ' .g:file_name. ' -o ~/Documents/tmpAlgorithmResult.exe; read a"')
  endif
endfunc

function! ZzxRun()
  if &filetype == 'cpp'||'c'
    call system('st -e sh -c "~/Documents/tmpAlgorithmResult.exe; read a"')
   elseif &filetype == 'java'
     exec "!javac %"
     exec "!time java %<"
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
     set splitbelow
     :sp
     :term go run .
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

" map <nowait> <M-b> :w<CR>:te g++ % -o ~/Documents/tmpAlgorithmResult.exe<CR>
" map <nowait> <M-B> :te ~/Documents/tmpAlgorithmResult.exe<CR>
