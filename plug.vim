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

try

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

try
    let g:SnazzyTransparent = 1
    color snazzy
catch
    color default
endtry


" coc-snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<a-e>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<a-u>'

let g:NERDTreeMapOpenSplit = 's'

" U<C-j> for both expand and jump (make expand higher priority.)
imap <A-f> <Plug>(coc-snippets-expand-jump)
vmap <A-f> <Plug>(coc-snippets-select)
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

catch
endtry
