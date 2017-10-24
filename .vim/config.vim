" Always show 5 lines between current cursor line and top or bottom line
"set status line
set laststatus=2
set scrolloff=5   
set tags +=.git/tags
"set relativenumber and absolute number for current line
set rnu
set number
"
 "search by files completing like sh
 set wildmode=longest,list 

 "allow searching in subdirectories
 set path+=**

 set rtp+=~/.vim/bundle/Vundle.vim

"set status line
function! GitBranch()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
	let l:branchname = GitBranch()
	return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
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