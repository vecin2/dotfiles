" Always show 5 lines between current cursor line and top or bottom line
"set status line
set laststatus=2
set scrolloff=5   
set tags +=.git/tags
"set relativenumber and absolute number for current line
set rnu
set number

"Remove backup files swp
set nobackup nowritebackup
"
"Allow exit buffer without saving
set hidden
"
"search by files completing like sh
set wildmode=longest,list 
"allow searching in subdirectories
set path+=**
"hilight searched term
set hlsearch




set mouse=a  "enable mouse
set clipboard=unnamed
"Changet current directory when opening a new file
"set autochdir
"set noswapfile 
""
"set status line
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
set statusline+=\

"FORMATTING
command! -nargs=* Wrap set wrap linebreak nolist
Wrap
"Setting tabs Set tabstop, softtabstop and shiftwidth to the same value
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
