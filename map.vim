let g:numberStatus = 0

if !has('nvim')
    for i in range(97,122)
        let c = nr2char(i)
        exec "set <M-.".c.">=\e".c.""
    endfor
    exec "set <M-->=\e-"
    exec "set <M-=>=\e="
endif

command! -bar SplitRight :set splitright|:vsplit
command! EditMap SplitRight|exec 'e '.g:VIMPATH.'/map.vim'
command! EditPlug SplitRight|exec 'e '.g:VIMPATH.'/plug.vim'
command! MyEsc :nohl|:set nocursorcolumn|exec 'source '.g:VIMPATH.'/numberOff.vim'|:let g:numberStatus=0


nnoremap <nowait><silent> <LEADER>rc :SplitRight<CR>:e $MYVIMRC<CR>
nnoremap <nowait><silent> <LEADER>mp :EditMap<CR>
nnoremap <nowait><silent> <LEADER>pl :EditPlug<CR>
nnoremap <nowait> <silent> <Esc> :MyEsc<CR>

noremap <nowait> <silent> ge gj
noremap <nowait> <silent> gu gk
noremap <nowait> <silent> b B
noremap <nowait> <silent> B b
noremap <nowait> <silent> w W
noremap <nowait> <silent> W w
noremap <nowait> l u
noremap <nowait> L <C-r>
noremap <nowait> k n
noremap <nowait> K N
noremap <nowait> j e
noremap <nowait> J E
noremap <nowait> <M-u> {
noremap <nowait> <M-e> }
noremap <nowait> <silent> ]p p
noremap <nowait> <silent> p ]p
noremap <nowait> <silent> n h
noremap <nowait> <silent> N ^
noremap <nowait> <silent> I $
noremap <nowait> <silent> i l
noremap <nowait> <silent> h i
noremap <nowait> <silent> u k
noremap <nowait> <silent> e j
nnoremap <nowait> <silent> U 10<Up>
nnoremap <nowait> <silent> E 10<Down>
noremap <nowait> <silent> H I
noremap <nowait> <silent> <LEADER>ay ggyG
noremap <nowait> <silent> <LEADER>ad ggdG
noremap <nowait> <silent> <LEADER>ap ggVGP
noremap <nowait> <silent> <LEADER>qn @n
noremap <nowait> <silent> <LEADER>e :e!<CR>
noremap <nowait> <M-f> /
" noremap <nowait> <LEADER><LEADER> :set nocursorcolumn<CR>:nohl<CR>
noremap <nowait> <silent> <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
inoremap <nowait> <silent> tn<LEADER> <++>
noremap <nowait> <silent> <LEADER>ll :set cursorcolumn<CR>
noremap <nowait> <silent> <M--> <C-o>
noremap <nowait> <silent> <M-=> <C-i>
cnoremap <nowait> <M-f> /
noremap s <nop>
inoremap <M-o> <nop>
" inoremap <M-e> <nop>
noremap <nowait> <silent> si :set splitright<CR>:vsplit<CR>
noremap <nowait> <silent> sn :set nospr<CR>:vsplit<CR>
noremap <nowait> <silent> se :set splitbelow<CR>:split<CR>
noremap <nowait> <silent> su :set nosplitbelow<CR>:split<CR>
noremap <nowait> <silent> <M-I> <C-w><Right>
noremap <nowait> <silent> <M-N> <C-w><Left>
noremap <nowait> <silent> <M-E> <C-w><Down>
noremap <nowait> <silent> <M-U> <C-w><Up>
noremap <nowait> <silent> <LEADER>ta :tabe<CR>
noremap <nowait> <silent> tt :NERDTreeToggle<CR>
noremap <nowait> <silent> <M-n> :-tabnext<CR>
noremap <nowait> <silent> <M-i> :+tabnext<CR>
noremap <nowait> ; :

" nmap <CR> <nop>
nnoremap <nowait> <silent> <up> :res +5<CR>
nnoremap <nowait> <silent> <down> :res -5<CR>
nnoremap <nowait> <silent> <left> :vertical resize -5<CR>
nnoremap <nowait> <silent> <right> :vertical resize +5<CR>
nnoremap <nowait> <silent> <M-q> :q!<CR>
nnoremap <nowait> <silent> <M-w> :w<CR>
nnoremap <nowait> <silent> <M-r> :source $MYVIMRC<CR>
inoremap <nowait> <silent> <M-r> <ESC>:source $MYVIMRC<CR>a
" nnoremap <nowait> <silent> <M-t> :CocCommand explorer<CR>
nnoremap <nowait> <silent> <M-t> :RangerWorkingDirectoryNewTab<CR>
noremap <nowait> <silent> <LEADER>ww :w !sudo tee %<CR>
nnoremap <nowait> <LEADER>coc :set splitright<CR>:vsplit<CR>:CocConfig<CR>
noremap <nowait> <silent> ? *
noremap! <nowait> <silent> <M-w> <Esc>:w<CR>"
noremap! <nowait>  <Esc>
noremap <nowait> <silent> <M-o> o<Esc>O
nnoremap > >>
nnoremap < <<
nnoremap <LEADER>LG :call system('st -e sh -c lazygit')<cr>
nnoremap <silent> <LEADER>ff :silent Vifm<CR>
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

" register yank and paste {{{
noremap <nowait>  <LEADER>pn "np
noremap <nowait>  <LEADER>pe "ep
noremap <nowait>  <LEADER>pi "ip
vnoremap <nowait>  <LEADER>yn "ny
vnoremap <nowait>  <LEADER>ye "ey
vnoremap <nowait>  <LEADER>yi "iy
vnoremap <nowait>   <Esc>
" }}}

" number key {{{
inoremap <nowait> tna 1
inoremap <nowait> tnr 2
inoremap <nowait> tns 3
inoremap <nowait> tnt 4
inoremap <nowait> tnd 5
inoremap <nowait> tnh 6
inoremap <nowait> tnn 7
inoremap <nowait> tne 8
inoremap <nowait> tni 9
inoremap <nowait> tno 0
inoremap <nowait> tnA !
inoremap <nowait> tnR @
inoremap <nowait> tnS #
inoremap <nowait> tnT $
inoremap <nowait> tnD %
inoremap <nowait> tnH ^
inoremap <nowait> tnN &
inoremap <nowait> tnE *
inoremap <nowait> tnI (
inoremap <nowait> tnO )
inoremap <nowait> tn<Enter> \n

inoremap <nowait>  1 -
inoremap <nowait>  2 =
inoremap <nowait>  3 +
inoremap <nowait>  4 _
inoremap <nowait>  <M-l> ()<left>
inoremap <nowait>  <M-u> []<left>
inoremap <nowait>  <M-y> <end>{}<left>
inoremap <nowait>  <Esc>

" imap aa <c-r>=1+1<cr>
inoremap <silent> <nowait> <M-h> <c-r>=Numbertoggle()<cr>
inoremap <silent> <nowait> ` <c-r>=Numbertoggle()<cr>
function! Numbertoggle()
    if g:numberStatus == 0
        let g:numberStatus=1
        exec 'source '.g:VIMPATH.'/numberOn.vim'
    else
        let g:numberStatus=0
        exec 'source '.g:VIMPATH.'/numberOff.vim'
    endif
    return ""
endfunc

" }}}

