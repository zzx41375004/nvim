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
set tabstop=2
set shiftwidth=2
set softtabstop=2
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
"let &t_SI = \"<Esc>]50;CursorShape=1\x7"
"let &t_SR = \"<Esc>]50;CursorShape=2\x7"
"let &t_EI = \"<Esc>]50;CursorShape=0\x7"
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

let &t_ut=''
set nocompatible
set number
syntax on
set wrap
set showcmd
set wildmenu
set hlsearch
let loaded_matchparen = 0
set incsearch
set ignorecase
set smartcase
set clipboard+=unnamed
"set mouse=a
set cursorline
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
set relativenumber

noremap <nowait> <silent> j <Left>
noremap <nowait> <silent> h i
noremap <nowait> <silent> i <Up>
noremap <nowait> <silent> k <Down>
noremap <nowait> <silent> H I
noremap <nowait> <silent> <A-j> <Left>
noremap <nowait> <silent> <A-l> <Right>
noremap <nowait> <silent> <A-i> <Up>
noremap <nowait> <silent> <A-k> <Down>
noremap <nowait> <silent> <LEADER>ay ggyG
noremap <nowait> <silent> <LEADER>ad ggdG
noremap <nowait> <M-f> /
noremap <LEADER><CR> :nohl<CR>                
noremap <nowait> <silent> I 10<Up>                      
noremap <nowait> <silent> K 10<Down> 
cnoremap <nowait> <M-f> /

map s <nop>
map <nowait> <silent> sl :set splitright<CR>:vsplit<CR>
map <nowait> <silent> sj :set nospr<CR>:vsplit<CR>
map <nowait> <silent> sk :set splitbelow<CR>:split<CR>
map <nowait> <silent> si :set nosplitbelow<CR>:split<CR>
map <nowait> <silent> <C-l> <C-w><Right>
map <nowait> <silent> <C-j> <C-w><Left>
map <nowait> <silent> <C-k> <C-w><Down>
map <nowait> <silent> <C-i> <C-w><Up>
map <nowait> <silent> tt :tabe<CR>
map <nowait> <silent> th :-tabnext<CR>
map <nowait> <silent> tl :+tabnext<CR>
map <nowait> <silent> <A-h> <Home>
map <nowait> <silent> <A-;> <End>
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
nnoremap <silent><nowait> ff :NERDTreeToggle<CR>
                      

nnoremap <nowait> <LEADER>cc :set splitright<CR>:vsplit<CR>:CocConfig<CR> 
noremap! <nowait> <silent> <M-w> <Esc>:w<CR>
noremap! <nowait> <silent> <M-a> <End><CR>
noremap! <nowait> <silent> <A-h> <Home>
noremap! <nowait> <silent> <A-;> <End>
noremap! <nowait>  ( ()<Left>
noremap! <nowait>  { {}<Left>
noremap! <nowait>  <A-[> {}<left><CR>1<CR><Up><Right><BS><Tab>
noremap! <nowait>  " ""<Left>
noremap! <nowait>  ' ''<Left>
noremap! <nowait>  [ []<Left>
noremap! <nowait> <silent> <A-j> <Left>
noremap! <nowait> <silent> <A-k> <Down>
noremap! <nowait> <silent> <A-i> <Up>
noremap! <nowait> <silent> <A-l> <Right>
noremap! <nowait> <silent> <A-b> <BS>
noremap! <nowait>  <A-p> %
noremap! <nowait>  <A-s> &
noremap! <nowait> <silent> <A-u> <Esc><Undo>i
noremap! <nowait>  <M-[> {}<left><CR>1<CR><Up><Right><BS><Tab>

"function ClosePair(char)
"if getline('.')[col('.') - 1] == a:char
"   return \"\<Right>"
"else
"    return a:char
"endif
"endf
exec 'nohl'
if has("nvim")
  autocmd TermOpen * startinsert
endif

let g:plug_file_path = ""
if has("win32")
  let g:plug_file_path = "~/vimfiles/plugged"
else
  let g:plug_file_path = "~/.vim/plugged"
endif

call plug#begin(plug_file_path)

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
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'fadein/vim-FIGlet'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'honza/vim-snippets'

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
nmap ts <Plug>(coc-translator-p)
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

" U<C-j> for both expand and jump (make expand higher priority.)
imap <A-o> <Plug>(coc-snippets-expand-jump)
vmap <A-o> <Plug>(coc-snippets-select)
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

map <silent> <nowait> <LEADER>b :set splitright<CR>:vsplit<CR>:call Compile()<CR>
map <silent> <nowait> <LEADER>B :set splitright<CR>:vsplit<CR>:call Run()<CR>

let g:file_name = @%
let file_exe_name = expand('%<').'.exe' 

func! Compile()
    if &filetype == 'c' 
        exec '!clang % -o %<'
    elseif &filetype == 'cpp'
        exec 'te clang++ % -o %<.exe'
    endif
endfunc 

func! Run()
  if &filetype == 'cpp'
    exec 'te %<.exe'
  endif
endfunc
