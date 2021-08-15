let g:numberStatus = 0

noremap <silent> ge gj
noremap <silent> gu gk
noremap <silent> b B
noremap <silent> B b
noremap <silent> w W
noremap <silent> W w
noremap l u
noremap L <C-r>
noremap k n
noremap K N
noremap j e
noremap J E
noremap <M-u> {
noremap <M-e> }
noremap <silent> ]p p
noremap <silent> p ]p
noremap <silent> n h
noremap <silent> N ^
noremap <silent> I $
noremap <silent> i l
noremap <silent> h i
noremap <silent> u k
nnoremap <silent> U 10k
vnoremap <silent> U 3k
noremap <silent> e j
nnoremap <silent> E 10j
vnoremap <silent> E 3j
noremap <silent> H I
noremap <silent> <LEADER>ay ggyG
noremap <silent> <LEADER>ad ggdG
noremap <silent> <LEADER>ap ggVGP
noremap <silent> <LEADER>qn @n
noremap <silent> <LEADER>e :e!<CR>
noremap <M-f> /
" noremap  <LEADER><LEADER> :set nocursorcolumn<CR>:nohl<CR>
noremap <silent> <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
inoremap <silent> tn<LEADER> <++>
noremap <silent> <LEADER>ll :set cursorcolumn<CR>
noremap <silent> <M--> <C-o>
noremap <silent> <M-=> <C-i>
cnoremap <M-f> /
noremap s <nop>
inoremap <M-o> <nop>
" inoremap <M-e> <nop>
noremap <silent> si :set splitright<CR>:vsplit<CR>
noremap <silent> sn :set nospr<CR>:vsplit<CR>
noremap <silent> se :set splitbelow<CR>:split<CR>
noremap <silent> su :set nosplitbelow<CR>:split<CR>
noremap <silent> <M-I> <C-w><Right>
noremap <silent> <M-N> <C-w><Left>
noremap <silent> <M-E> <C-w><Down>
noremap <silent> <M-U> <C-w><Up>
noremap <silent> <LEADER>ta :tabe<CR>
noremap <silent> tt :NERDTreeToggle<CR>
nnoremap <silent> <M-n> :-tabnext<CR>
nnoremap <silent> <M-i> :+tabnext<CR>
inoremap <silent> <M-i> <Right>
inoremap <silent> <M-n> <Left>
noremap ; :

" nmap <CR> <nop>
nnoremap <silent> <up> :res +5<CR>
nnoremap <silent> <down> :res -5<CR>
nnoremap <silent> <left> :vertical resize -5<CR>
nnoremap <silent> <right> :vertical resize +5<CR>
nnoremap <silent> <M-q> :q!<CR>
nnoremap <silent> <M-w> :w<CR>
nnoremap <silent> <M-r> :source $MYVIMRC<CR>
inoremap <silent> <M-r> <ESC>:source $MYVIMRC<CR>a
" nnoremap  <silent> <M-t> :CocCommand explorer<CR>
nnoremap <silent> <M-t> :RangerWorkingDirectoryNewTab<CR>
noremap <silent> <LEADER>ww :w !sudo tee %<CR>
nnoremap <LEADER>coc :set splitright<CR>:vsplit<CR>:CocConfig<CR>
noremap <silent> ? *
noremap! <silent> <M-w> <Esc>:w<CR>"
noremap!  <Esc>
noremap <silent> <M-o> o<Esc>O
nnoremap > >>
nnoremap < <<
nnoremap <LEADER>lg :call system('st -e sh -c lazygit')<cr>
nnoremap <silent> <LEADER>ff :silent Vifm<CR>
nnoremap <silent> <LEADER>d <C-]>
" fold and unfold {{{
noremap <LEADER>o za
noremap <LEADER>zf :call Fold()<CR>
function! Fold()
    if &filetype=='cpp'
        exec 'normal! zfa{'
    else
        exec 'normal! zfip'
    endif
endfunction
" }}}

" markdown shortcut key {{{
autocmd Filetype markdown inoremap <buffer> <silent> ;, <++>
autocmd Filetype markdown inoremap <buffer> <silent> ;f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown nnoremap <buffer> <silent> ;f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap <buffer> <silent> ;s <Esc>/ <++><CR>:nohlsearch<CR>c5l
autocmd Filetype markdown inoremap <buffer> <silent> ;- ---<Enter><Enter>
autocmd Filetype markdown inoremap <buffer> <silent> ;b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> <silent> ;x ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> <silent> ;x ** <++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> <silent> ;q `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> <silent> ;c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> <silent> ;g - [ ] <Enter><++><ESC>kA
autocmd Filetype markdown inoremap <buffer> <silent> ;u <u></u><++><Esc>F/hi
autocmd Filetype markdown inoremap <buffer> <silent> ;p ![](<++>) <Enter><++><Esc>kF[a
autocmd Filetype markdown inoremap <buffer> <silent> ;a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> <silent> ;1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> <silent> ;2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> <silent> ;3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> <silent> ;4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> <silent> ;t <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
" }}}



