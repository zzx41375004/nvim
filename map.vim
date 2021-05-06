noremap <nowait> <silent> <Space> <nop>
noremap <nowait> <silent> ge gj
noremap <nowait> <silent> gu gk
noremap <nowait> <silent> <M-u> {
noremap <nowait> <silent> <M-e> }
noremap <nowait> <silent> b B
noremap <nowait> <silent> B b
noremap <nowait> <silent> w W
noremap <nowait> <silent> W w
noremap <nowait> l u
noremap <nowait> L <C-r>
noremap <nowait> k n
noremap <nowait> K N
noremap <nowait> <silent> ]p p
noremap <nowait> <silent> p ]p
noremap <nowait> <silent> n h
noremap <nowait> <silent> N ^
noremap <nowait> <silent> I $
noremap <nowait> <silent> i l
noremap <nowait> <silent> h i
noremap <nowait> <silent> u k
noremap <nowait> <silent> e j
noremap <nowait> <silent> U 10<Up>
noremap <nowait> <silent> E 10<Down>
noremap <nowait> <silent> H I
noremap <nowait> <silent> <LEADER>ay ggyG
noremap <nowait> <silent> <LEADER>ad ggdG
noremap <nowait> <silent> <LEADER>ap ggVGP
noremap <nowait> <silent> <LEADER>qj @j
noremap <nowait> <silent> <LEADER>e :e!<CR>
noremap <nowait> <M-f> /
" noremap <nowait> <LEADER><LEADER> :set nocursorcolumn<CR>:nohl<CR>
noremap <nowait> <silent> <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
noremap <nowait> <silent> <LEADER>ll :set cursorcolumn<CR>
noremap <nowait> <silent> <M--> <C-o>
noremap <nowait> <silent> <M-=> <C-i>
cnoremap <nowait> <M-f> /
noremap s <nop>
noremap <nowait> <silent> si :set splitright<CR>:vsplit<CR>
noremap <nowait> <silent> sn :set nospr<CR>:vsplit<CR>
noremap <nowait> <silent> se :set splitbelow<CR>:split<CR>
noremap <nowait> <silent> su :set nosplitbelow<CR>:split<CR>
noremap <nowait> <silent> <M-I> <C-w><Right>
noremap <nowait> <silent> <M-N> <C-w><Left>
noremap <nowait> <silent> <M-E> <C-w><Down>
noremap <nowait> <silent> <M-U> <C-w><Up>
noremap <nowait> <silent> <LEADER>t :tabe<CR>
noremap <nowait> <silent> tn :-tabnext<CR>
noremap <nowait> <silent> ti :+tabnext<CR>
noremap <nowait> <silent> <M-n> :-tabnext<CR>
noremap <nowait> <silent> <M-i> :+tabnext<CR>
noremap <nowait> ; :
noremap <M-y> :w !/mnt/c/Windows/System32/clip.exe<CR>

" nmap <CR> <nop>
nnoremap <nowait><silent><LEADER>rc :set splitright<CR>:vsplit<CR>:e $MYVIMRC<CR>
nnoremap <nowait><silent><LEADER>mp :set splitright<CR>:vsplit<CR>:e ~/.config/nvim/map.vim<CR>
nnoremap <nowait><silent><LEADER>pl :set splitright<CR>:vsplit<CR>:e ~/.config/nvim/plug.vim<CR>
nnoremap <nowait> <silent> <up> :res +5<CR>
nnoremap <nowait> <silent> <down> :res -5<CR>
nnoremap <nowait> <silent> <left> :vertical resize -5<CR>
nnoremap <nowait> <silent> <right> :vertical resize +5<CR>
nnoremap <nowait> <silent> <M-q> :q!<CR>
nnoremap <nowait> <silent> <M-w> :w<CR>
nnoremap <nowait> <silent> <M-r> :source $MYVIMRC<CR>
nnoremap <silent><nowait> tt :tabe<CR>
" nnoremap <nowait> <silent> <M-t> :CocCommand explorer<CR>
nnoremap <nowait> <silent> <M-t> :RangerWorkingDirectoryNewTab<CR>
noremap <nowait> <silent> <LEADER>w :w !sudo tee %<CR>
nnoremap <nowait> <LEADER>coc :set splitright<CR>:vsplit<CR>:CocConfig<CR>
noremap <nowait> <silent> ? *
noremap <nowait> <silent> <Esc> :nohl<CR>:set nocursorcolumn<CR>


noremap! <nowait> <silent> <M-w> <Esc>:w<CR>

" 括号补全

noremap! <nowait>  ( ()<Left>
noremap! <nowait>  { {}<Left>
noremap! <nowait>  " ""<Left>
noremap! <nowait>  ' ''<Left>
noremap! <nowait>  [ []<Left>
noremap! <nowait>  <M-[> {}<left><CR>1<CR><Up><Right><BS><Tab>
" inoremap <nowait> <silent> <BS> <Esc>:call IsSurround()<CR>a
function! IsSurround()
    let str=getline(".")
    let pos=col(".")
    if (str[pos-1]=='(' && str[pos]==')') || (str[pos-1]=='[' && str[pos]==']') ||(str[pos-1]=='{' && str[pos]=='}') ||(str[pos-1]=='<' && str[pos]=='>')
        exec 'normal! xx'
    else
        exec 'normal! x'
    endif
    if col(".")==pos
        exec 'normal! h'
    endif
endfunction

" fold ant unfold
noremap <LEADER>zf :call Fold()<CR>
function! Fold()
    if &filetype=='cpp'
        exec 'normal! zfa{'
    else
        exec 'normal! zfip'
    endif
endfunction


" register yank and paste
noremap <nowait>  <LEADER>pn "np
noremap <nowait>  <LEADER>pe "ep
noremap <nowait>  <LEADER>pi "ip
vnoremap <nowait>  <LEADER>yn "ny
vnoremap <nowait>  <LEADER>ye "ey
vnoremap <nowait>  <LEADER>yi "iy
vnoremap <nowait>   <Esc>

" number key
noremap <nowait>  <LEADER>na 1
noremap <nowait>  <LEADER>nr 2
noremap <nowait>  <LEADER>ns 3
noremap <nowait>  <LEADER>nt 4
noremap <nowait>  <LEADER>nd 5
noremap <nowait>  <LEADER>nh 6
noremap <nowait>  <LEADER>nn 7
noremap <nowait>  <LEADER>ne 8
noremap <nowait>  <LEADER>ni 9
noremap <nowait>  <LEADER>nA !
noremap <nowait>  <LEADER>nR @
noremap <nowait>  <LEADER>nS #
noremap <nowait>  <LEADER>nT $
noremap <nowait>  <LEADER>nD %
noremap <nowait>  <LEADER>nH ^
noremap <nowait>  <LEADER>nN &
noremap <nowait>  <LEADER>nE *
noremap <nowait>  <LEADER>nI (
noremap <nowait>  <LEADER>nO )
noremap! <nowait>  <M-a> 1
noremap! <nowait>  <M-A> !
noremap! <nowait>  <M-r> 2
noremap! <nowait>  <M-R> @
noremap! <nowait>  <M-s> 3
noremap! <nowait>  <M-S> #
noremap! <nowait>  <M-t> 4
noremap! <nowait>  <M-T> $
noremap! <nowait>  <M-d> 5
noremap! <nowait>  <M-D> %
noremap! <nowait>  <M-h> 6
noremap! <nowait>  <M-H> ^
noremap! <nowait>  <M-n> 7
noremap! <nowait>  <M-N> &
noremap! <nowait>  <M-e> 8
noremap! <nowait>  <M-E> *
noremap! <nowait>  <M-i> 9
noremap! <nowait>  <M-I> (
noremap! <nowait>  <M-o> 0
noremap! <nowait>  <M-O> )
noremap! <nowait>  1 -
noremap! <nowait>  2 =
noremap! <nowait>  3 +
noremap! <nowait>  4 _
noremap! <nowait>  <M-l> ()<left>
noremap! <nowait>  <M-u> []<left>
noremap! <nowait>  <M-y> <Esc>A{}<left><CR>1<CR><Up><Right><BS><Tab>
noremap! <nowait>  <Esc>
