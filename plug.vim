let g:plug_file_path = ""

if has("win32")
    let g:plug_file_path = "~/AppData/Local/nvim/plugged"
else
    let g:plug_file_path = "~/.config/nvim/plugged"
endif

call plug#begin(plug_file_path)

Plug 'vifm/vifm.vim'
" Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
"Plug 'vim-scripts/fcitx.vim'
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'Xuyuanp/nerdtree-git-plugin'

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
" Plug 'joker1007/vim-markdown-quote-syntax'
" Plug 'tpope/vim-markdown'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Go
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }

" Other useful utilities
"Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim' " distraction free writing mode
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
" Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line
Plug 'ludovicchabant/vim-gutentags'
" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'fadein/vim-FIGlet'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'

call plug#end()

" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1

let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-diagnostic',
    \ 'coc-eslint',
    \ 'coc-flutter-tools',
    \ 'coc-gitignore',
    \ 'coc-html',
    \ 'coc-import-cost',
    \ 'coc-json',
    \ 'coc-lists',
    \ 'coc-prettier',
    \ 'coc-prisma',
    \ 'coc-pyright',
    \ 'coc-python',
    \ 'coc-snippets',
    \ 'coc-sourcekit',
    \ 'coc-stylelint',
    \ 'coc-syntax',
    \ 'coc-tailwindcss',
    \ 'https://github.com/rodrigore/coc-tailwind-intellisense',
    \ 'coc-tasks',
    \ 'coc-translator',
    \ 'coc-tslint-plugin',
    \ 'coc-tsserver',
    \ 'coc-vetur',
    \ 'coc-vimlsp',
    \ 'coc-yaml',
    \ 'coc-yank']


" comment tags
autocmd FileType vim setlocal commentstring=\"\ %s
autocmd FileType c,cpp,json setlocal commentstring=//\ %s
autocmd FileType py setlocal commentstring=\#\ %s
autocmd FileType markdown setlocal commentstring=<!--\ %s\-->
autocmd BufEnter,BufRead,BufNewFile *.Xmodmap* setlocal commentstring=\!\%s
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
nnoremap <nowait> <silent> <LEADER>sn :set splitright<CR>:vsplit<CR>:CocCommand snippets.editSnippets<CR>
" nnoremap <LEADER>sn :CocCommand snippets.editSnippets<CR>
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
nmap <LEADER>tr <Plug>(coc-translator-p)
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
imap <M-e> <Plug>(coc-snippets-expand-jump)
vmap <M-e> <Plug>(coc-snippets-select)
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" ===
" === vim-instant-markdown
" ===
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
" let g:instant_markdown_mathjax = 1
let g:instant_markdown_autoscroll = 1
let g:instant_markdown_browser = "google-chrome-stable --new-window"

let g:vimwiki_list = [{'path': '~/vimwiki/',
\ 'syntax': 'markdown', 'ext': '.md'}]

" autopair
" let g:AutoPairsShortcutJump = '<M-i>'
let g:AutoPairsShortcutJump = '<M-0>'
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutFastWrap = ''

" nerdtree {{{
let g:NERDTreeMapCustomOpen      = get(g:, 'NERDTreeMapCustomOpen',      '<CR>')
let g:NERDTreeMapActivateNode    = get(g:, 'NERDTreeMapActivateNode',    'o')
let g:NERDTreeMapChangeRoot      = get(g:, 'NERDTreeMapChangeRoot',      'C')
let g:NERDTreeMapChdir           = get(g:, 'NERDTreeMapChdir',           'cd')
let g:NERDTreeMapCloseChildren   = get(g:, 'NERDTreeMapCloseChildren',   'X')
let g:NERDTreeMapCloseDir        = get(g:, 'NERDTreeMapCloseDir',        'x')
let g:NERDTreeMapDeleteBookmark  = get(g:, 'NERDTreeMapDeleteBookmark',  'D')
let g:NERDTreeMapMenu            = get(g:, 'NERDTreeMapMenu',            'm')
let g:NERDTreeMapHelp            = get(g:, 'NERDTreeMapHelp',            '?')
let g:NERDTreeMapJumpParent      = get(g:, 'NERDTreeMapJumpParent',      'p')
let g:NERDTreeMapJumpRoot        = get(g:, 'NERDTreeMapJumpRoot',        'P')
let g:NERDTreeMapOpenExpl        = get(g:, 'NERDTreeMapOpenExpl',        'j')
let g:NERDTreeMapOpenInTab       = get(g:, 'NERDTreeMapOpenInTab',       'ta')
let g:NERDTreeMapOpenInTabSilent = get(g:, 'NERDTreeMapOpenInTabSilent', 'T')
let g:NERDTreeMapOpenRecursively = get(g:, 'NERDTreeMapOpenRecursively', 'O')
let g:NERDTreeMapOpenSplit       = get(g:, 'NERDTreeMapOpenSplit',       'S')
let g:NERDTreeMapOpenVSplit      = get(g:, 'NERDTreeMapOpenVSplit',      's')
let g:NERDTreeMapPreview         = get(g:, 'NERDTreeMapPreview',         'g'.NERDTreeMapActivateNode)
let g:NERDTreeMapPreviewSplit    = get(g:, 'NERDTreeMapPreviewSplit',    'g'.NERDTreeMapOpenSplit)
let g:NERDTreeMapPreviewVSplit   = get(g:, 'NERDTreeMapPreviewVSplit',   'g'.NERDTreeMapOpenVSplit)
let g:NERDTreeMapQuit            = get(g:, 'NERDTreeMapQuit',            'q')
let g:NERDTreeMapRefresh         = get(g:, 'NERDTreeMapRefresh',         'r')
let g:NERDTreeMapRefreshRoot     = get(g:, 'NERDTreeMapRefreshRoot',     'R')
let g:NERDTreeMapToggleBookmarks = get(g:, 'NERDTreeMapToggleBookmarks', 'B')
let g:NERDTreeMapToggleFiles     = get(g:, 'NERDTreeMapToggleFiles',     'F')
let g:NERDTreeMapToggleFilters   = get(g:, 'NERDTreeMapToggleFilters',   'f')
let g:NERDTreeMapToggleHidden    = get(g:, 'NERDTreeMapToggleHidden',    'I')
let g:NERDTreeMapToggleZoom      = get(g:, 'NERDTreeMapToggleZoom',      'A')
let g:NERDTreeMapUpdir           = get(g:, 'NERDTreeMapUpdir',           'n')
let g:NERDTreeMapUpdirKeepOpen   = get(g:, 'NERDTreeMapUpdirKeepOpen',   'N')
let g:NERDTreeMapCWD             = get(g:, 'NERDTreeMapCWD',             'CD')
let g:NERDTreeMenuDown           = get(g:, 'NERDTreeMenuDown',           'e')
let g:NERDTreeMapJumpLastChild   = get(g:, 'NERDTreeMapJumpLastChild',   'E')
let g:NERDTreeMapJumpNextSibling = get(g:, 'NERDTreeMapJumpNextSibling', '<C-e>')
let g:NERDTreeMenuUp             = get(g:, 'NERDTreeMenuUp',             'u')
let g:NERDTreeMapJumpFirstChild  = get(g:, 'NERDTreeMapJumpFirstChild',  'U')
let g:NERDTreeMapJumpPrevSibling = get(g:, 'NERDTreeMapJumpPrevSibling', '<C-u>')
"}}}

" {{{ gutentags
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0
" }}}
