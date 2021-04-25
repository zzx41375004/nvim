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
"set shell=powershell.exe

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

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
set showcmd
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

noremap <nowait> <silent> ]p p
noremap <nowait> <silent> p ]p
noremap <nowait> <silent> j <Left>
noremap <nowait> <silent> J 10<Left>
noremap <nowait> <silent> L 10<Right>
noremap <nowait> <silent> h i
noremap <nowait> <silent> i <Up>
noremap <nowait> <silent> k <Down>
noremap <nowait> <silent> I 10<Up>
noremap <nowait> <silent> K 10<Down>
noremap <nowait> <silent> H I
noremap <nowait> <silent> <LEADER>ay ggyG
noremap <nowait> <silent> <LEADER>ad ggdG
noremap <nowait> <silent> <LEADER>ap ggVGP
noremap <nowait> <silent> <LEADER>qj @j
noremap <nowait> <silent> <LEADER>e :e!<CR>
noremap <nowait> <M-f> /
noremap <nowait> <LEADER><LEADER> :set nocursorcolumn<CR>:nohl<CR>
noremap <nowait> <silent> <LEADER>ll :set cursorcolumn<CR>
noremap <nowait> <silent> <M-o> <C-o>
cnoremap <nowait> <M-f> /

noremap <nowait> <silent> <A-N> 1
noremap <nowait> <silent> <M-M> 2
noremap <nowait> <silent> <M-<> 3
noremap <nowait> <silent> <M-H> 4
noremap <nowait> <silent> <M-J> 5
noremap <nowait> <silent> <M-K> 6
noremap <nowait> <silent> <M-Y> 7
noremap <nowait> <silent> <M-U> 8
noremap <nowait> <silent> <M-I> 9
noremap <nowait> <silent> <M-L> 0
noremap! <nowait> <silent> <A-N> 1
noremap! <nowait> <silent> <M-M> 2
noremap! <nowait> <silent> <M-<> 3
noremap! <nowait> <silent> <M-H> 4
noremap! <nowait> <silent> <M-J> 5
noremap! <nowait> <silent> <M-K> 6
noremap! <nowait> <silent> <M-Y> 7
noremap! <nowait> <silent> <M-U> 8
noremap! <nowait> <silent> <M-I> 9
noremap! <nowait> <silent> <M-L> 0

map s <nop>
map <nowait> <silent> sl :set splitright<CR>:vsplit<CR>
map <nowait> <silent> sj :set nospr<CR>:vsplit<CR>
map <nowait> <silent> sk :set splitbelow<CR>:split<CR>
map <nowait> <silent> si :set nosplitbelow<CR>:split<CR>
noremap! <nowait> <silent> <M-l> <Right>
noremap! <nowait> <silent> <M-j> <Left>
noremap! <nowait> <silent> <M-k> <Down>
noremap! <nowait> <silent> <M-i> <Up>
map <nowait> <silent> <M-l> <C-w><Right>
map <nowait> <silent> <M-j> <C-w><Left>
map <nowait> <silent> <M-k> <C-w><Down>
map <nowait> <silent> <M-i> <C-w><Up>
map <nowait> <silent> <LEADER>t :tabe<CR>
map <nowait> <silent> tj :-tabnext<CR>
map <nowait> <silent> tl :+tabnext<CR>
map <nowait> <silent> <M-h> ^
map <nowait> <silent> <M-;> <End>
map <nowait> ; :
map <M-y> :w !/mnt/c/Windows/System32/clip.exe<CR>

nmap <CR> <nop>
nnoremap <nowait><silent><LEADER>rc :set splitright<CR>:vsplit<CR>:e $MYVIMRC<CR>
nnoremap <nowait> <silent> <up> :res +5<CR>
nnoremap <nowait> <silent> <down> :res -5<CR>
nnoremap <nowait> <silent> <left> :vertical resize -5<CR>
nnoremap <nowait> <silent> <right> :vertical resize +5<CR>
nnoremap <nowait> <silent> <A-q> :q!<CR>
nnoremap <nowait> <silent> <A-w> :w<CR>
nnoremap <nowait> <silent> <A-r> :source $MYVIMRC<CR>
nnoremap <silent><nowait> tt :NERDTreeToggle<CR>
noremap <nowait> <silent> <LEADER>w :w !sudo tee %<CR>

nnoremap <nowait> <LEADER>coc :set splitright<CR>:vsplit<CR>:CocConfig<CR>
noremap! <nowait> <silent> <M-w> <Esc>:w<CR>
noremap! <nowait> <silent> <M-a> <End><CR>
noremap! <nowait>  ( ()<Left>
noremap! <nowait>  { {}<Left>
noremap! <nowait>  <A-[> {}<left><CR>1<CR><Up><Right><BS><Tab>
noremap! <nowait>  " ""<Left>
noremap! <nowait>  ' ''<Left>
noremap! <nowait>  [ []<Left>
noremap! <nowait>  <A-p> %
noremap! <nowait>  <A-s> &
noremap! <nowait> <silent> <A-u> <Esc><Undo>i
noremap! <nowait>  <M-[> {}<left><CR>1<CR><Up><Right><BS><Tab>

inoremap <nowait> <M-h> </<C-X><C-O>

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

let g:plug_file_path = ""
if has("win32")
let g:plug_file_path = "~/AppData/Local/nvim/plugged"
else
let g:plug_file_path = "~/.config/nvim/plugged"
endif

call plug#begin(plug_file_path)

"Plug 'vim-scripts/fcitx.vim'
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Error checking
"Plug 'w0rp/ale'

" Auto Complete
"Plug 'Valloric/YouCompleteMe'

" Undo Tree
"Plug 'mbbill/undotree/'

" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'
"Plug 'itchyny/vim-cursorword'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'

" Python
Plug 'vim-scripts/indentpython.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Other useful utilities
"Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim' " distraction free writing mode
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
" Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'fadein/vim-FIGlet'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'

call plug#end()

let g:coc_global_extensions = [
\ 'coc-css',
\ 'coc-diagnostic',
\ 'coc-explorer',
\ 'coc-flutter-tools',
\ 'coc-gitignore',
\ 'coc-html',
\ 'coc-json',
\ 'coc-lists',
\ 'coc-prettier',
\ 'coc-pyright',
\ 'coc-python',
\ 'coc-snippets',
\ 'coc-sourcekit',
\ 'coc-stylelint',
\ 'coc-syntax',
\ 'coc-tasks',
\ 'coc-translator',
\ 'coc-tslint-plugin',
\ 'coc-tsserver',
\ 'coc-vetur',
\ 'coc-vimlsp',
\ 'coc-yaml',
\ 'coc-yank',
\ 'coc-marketplace']

" \ !pumvisible() ? \"\<TAB>" :
inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
  let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
if has('nvim')
inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>+ <Plug>(coc-diagnostic-next)
autocmd CursorHold * silent call CocActionAsync('highlight')

function! Show_documentation()
call CocActionAsync('highlight')
if (index(['vim','help'], &filetype) >= 0)
  execute 'h '.expand('<cword>')
else
  call CocAction('doHover')
endif
endfunction
nnoremap <LEADER>h :call Show_documentation()<CR>
nnoremap <LEADER>c :CocCommand<CR>
nnoremap <nowait><silent><LEADER>sn :set splitright<CR>:vsplit<CR>:CocCommand snippets.editSnippets<CR>
" Text Objects
"xmap kf <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap kf <Plug>(coc-funcobj-i)
"omap af <Plug>(coc-funcobj-a)
"xmap kc <Plug>(coc-classobj-i)
"omap kc <Plug>(coc-classobj-i)
"xmap ac <Plug>(coc-classobj-a)
"omap ac <Plug>(coc-classobj-a)
"" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
"nmap ff :CocCommand explorer<CR>
" coc-translator
nmap <LEADER>dd <Plug>(coc-translator-p)
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)w
" coctodolist
" nnoremap <leader>tn :CocCommand todolist.create<CR>
" nnoremap <leader>tl :CocList todolist<CR>
" nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
" coc-tasks
noremap <silent> <leader>ts :CocList tasks<CR>

let g:SnazzyTransparent = 1
color snazzy


" coc-snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<a-k>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<a-i>'

let g:NERDTreeMapOpenSplit = 's'
autocmd FileType vim setlocal commentstring=\"\ %s
autocmd FileType c setlocal commentstring=//\ %s
autocmd FileType py setlocal commentstring=\#\ %s
" U<C-j> for both expand and jump (make expand higher priority.)
imap <A-o> <Plug>(coc-snippets-expand-jump)
vmap <A-o> <Plug>(coc-snippets-select)
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" map <silent> <nowait> <LEADER>b :set splitright<CR>:vsplit<CR>:call Compile()<CR>
noremap <nowait> <LEADER>b :call Compile()<CR>
" map <silent> <nowait> <LEADER>B :set splitright<CR>:vsplit<CR>:call Run()<CR>
noremap <LEADER>B :call ZzxRun()<CR>
nmap <silent> <nowait> <M-n> gcc
vmap <silent> <nowait> <M-n> gc

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
