"Colors {{{
colorscheme base16-gruvbox-dark-medium
"colorscheme blackboard
"highlight Comment cterm=italic
"}}}


"To Remove or to Categorize... {{{
"Not sure what issue they fix
"map OA <up>
"map OB <down>
"map OC <right>
"map OD <left>
""}}}


"Setting tabs Set tabstop, softtabstop and shiftwidth to the same value {{{
command! -nargs=* Stab call Stab()
function! Stab()
    let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
    if l:tabstop > 0
        let &l:sts = l:tabstop
        let &l:ts = l:tabstop
        let &l:sw = l:tabstop
    endif
    call SummarizeTabs()
endfunction

function! SummarizeTabs()
    try
        echohl ModeMsg
        echon 'tabstop='.&l:ts
        echon ' shiftwidth='.&l:sw
        echon ' softtabstop='.&l:sts
        if &l:et
            echon ' expandtab'
        else
            echon ' noexpandtab'
        endif
    finally
        echohl None
    endtry
endfunction
" }}}

"Coding settings {{{
set tags +=.git/tags
"It defaults diff splits to be vertical
set diffopt+=vertical
"mark white spaces
augroup whitespace
	autocmd!
	au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
augroup END
"Line added before autcmd run as it gives and error when opening .py
"files because BadWhitespace does not exist
:highlight BadWhitespace ctermfg=16 ctermbg=253 guifg=#000000 guibg=#F8F8F0
" }}}

"Vimscript file setting ----- {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

"Editing settings {{{
"Allows to paste text copied from Vim after exit vim
autocmd VimLeave * call system("xclip -o | xclip -selection c")

"}}}

"""Navigating docs {{{

"Remove backup files swp
set nobackup nowritebackup
"Allow exit buffer without saving
set hidden
"
" Always show 5 lines between current cursor line and top or bottom line
set scrolloff=5   

"set relativenumber and absolute number for current line
set rnu
set number
" }}}


" Folding {{{
" Folding based on indentation:
set foldmethod=indent
set nofoldenable
nnoremap , za
" }}}


"Searching {{{
"search by files completing like sh
set wildmode=longest,list 
"allow searching in subdirectories
set path+=**
" hilight searched term
set hlsearch
"Allows vim to use ag with ack plugin
let g:ackprg = 'ag --nogroup --nocolor --column'
nmap <leader>a <Esc>:Ack! 
"}}}


"Controls {{{
set mouse=a  "enable mouse
set clipboard=unnamed
" }}}

"Status Line {{{
"Display status line always
set laststatus=2
function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
"
set statusline=
set statusline+=%#PmenuSel#
"set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=\
"}}}

