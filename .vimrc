filetype plugin indent on

source ~/.vimrc.custom

" Options

" set softtabstop=4
" set expandtab

function Indent()
	DetectIndent
	" Fix anomalies
	if &shiftwidth == 2
		let &softtabstop = 2
	endif
	if &shiftwidth == 8
		let &shiftwidth = 4
	endif
	" echo &shiftwidth
	" echo &softtabstop
	" This is the good default
	set tabstop=4
endfunction

autocmd BufReadPost * call Indent()

set modeline
set modelines=5

set nofoldenable

set number

set list
set listchars=tab:·\ ,extends:»,precedes:«

set hlsearch

set formatoptions-=t

set backspace=indent,eol,start

set textwidth=72

set ruler
set laststatus=2

" au WinLeave * set nocursorline
" au WinEnter * set cursorline
" set cursorline

" Fix jslint plugin
let $JS_CMD='node'

" Necessary in Ubuntu, since /etc/vim/vimrc says 'syntax on', after which
" ftdetect scripts are loaded, and after that, ~/vimfiles/ is added to
" runtimepath (but files in ~/vimfiles/ftdetect are not loaded!). This forces
" loading scripts in ~/vimfiles/ftdetect. Complicated enough?
filetype off
filetype on
filetype plugin on

syntax on

" persistent undo (vim 7.3)
if has("persistent_undo")
	set undodir=~/.vim/.vimundo
	set undofile
	set undolevels=1000
	set undoreload=10000
endif

" Commenting blocks of code. Source:
" http://stackoverflow.com/questions/1676632/whats-a-quick-way-to-comment-uncomment-lines-in-vim
autocmd FileType c,cpp,java,scala,javascript,less let b:comment_leader = '//'
autocmd FileType sh,ruby,python,coffee let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,c :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,u :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Turns out, this sucks
" set autochdir

" It would make more sense to create a color scheme for the terminal, but let's
" just do this.
" hi LineNr ctermfg=grey

color ir_black

" An incomplete list of things to fix so things won't look unreadable on OS X
" Lion terminal with IR_Black theme installed
hi SpellBad ctermbg=none ctermfg=red cterm=underline
hi ErrorMsg ctermbg=none ctermfg=red cterm=none
hi Error ctermbg=none ctermfg=red cterm=underline
hi WarningMsg ctermbg=none ctermfg=5
hi SpecialKey cterm=none ctermfg=darkgrey ctermbg=none
hi PMenuSel cterm=underline
hi PMenuThumb cterm=underline ctermbg=5
hi PMenuSbar cterm=underline ctermbg=3

" Trying something funky
hi Visual cterm=underline,bold ctermbg=none

" Highlight trailing whitespace
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * redraw!
autocmd BufWinLeave * call clearmatches()

au BufNewFile,BufRead *.less set filetype=less
au! BufRead,BufNewFile *.vs,*.fs,*.glsl set filetype=glsl
au! BufRead,BufNewFile *.ejs set filetype=jst
au! BufRead,BufNewFile *.json setfiletype json
au BufNewFile,BufRead *.txt set formatoptions-=a formatoptions+=t

au Filetype coffeescript set autoindent
set autoindent

" CTRL-Tab is Next window
noremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cnoremap <C-Tab> <C-C><C-W>w
onoremap <C-Tab> <C-C><C-W>w

" CTRL-Shift-Tab is Previous window
noremap <C-S-Tab> <C-W>W
inoremap <C-S-Tab> <C-O><C-W>W
cnoremap <C-S-Tab> <C-C><C-W>W
onoremap <C-S-Tab> <C-C><C-W>W

" CTRL-F4 is Close window
noremap <C-F4> <C-W>c
inoremap <C-F4> <C-O><C-W>c
cnoremap <C-F4> <C-C><C-W>c
onoremap <C-F4> <C-C><C-W>c

nnoremap <silent> <F8> :TlistToggle<CR>

" let tlist_tex_settings   = 'latex;s:sections;g:graphics;l:labels'
" let tlist_make_settings  = 'make;m:makros;t:targets'

" Use a bar-shaped cursor for insert mode, even through tmux.
if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
else
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=2\x7"
endif

