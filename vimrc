set laststatus=2        " grey status bar at the bottom
syn on                  " syntax highlighting
filetype indent on      " activates indenting for files
set ai                  " auto indenting
set nu                  " line numbers
set ic                  " case insensitive search
colorscheme desert      " colorscheme desert
set mouse=a		" allows to use the mouse to select stuff

" Function that allows to close brackets and parenthesis automatically
function! ConditionalPairMap(open, close)
	let line = getline('.')
	let col = col('.')
	if col < col('$') || stridx(line, a:close, col + 1) != -1
		return a:open
	else
		return a:open . a:close . repeat("\<left>", len(a:close))
	endif
endf
inoremap <expr> ( ConditionalPairMap('(', ')')
inoremap <expr> { ConditionalPairMap('{', '}')
inoremap <expr> [ ConditionalPairMap('[', ']')
