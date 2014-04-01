set nocompatible
filetype off

" ========================================================================
" Vundle stuff
" ========================================================================
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'ervandew/supertab'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'nono/vim-handlebars'
Bundle 'tpope/vim-endwise'
Bundle 'vim-ruby/vim-ruby'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tsaleh/vim-align'
Bundle 'slim-template/vim-slim'
Bundle 'sjl/gundo.vim'
Bundle 'skammer/vim-css-color'
Bundle 'Command-T'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-json-bundle'



Bundle 'endel/ctrlp-filetype.vim'
Bundle 'zhaocai/linepower.vim'

Bundle 'koron/nyancat-vim'
Bundle 'https://github.com/scrooloose/syntastic.git'
Bundle 'kien/rainbow_parentheses.vim'
" ========================================================================
"  Settings
" ========================================================================

syntax enable
color lucius
LuciusDarkLowContrast

filetype plugin indent on
set number
set ruler
set cursorline
set history=200
set scrolloff=5
set guioptions-=L
set guioptions-=r
set guioptions-=T
set backupdir=~/.vim/_backup
set directory=~/.vim/_temp
set nobackup
set nowritebackup
set hidden

"" Whitespace
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set list
set backspace=indent,eol,start
set listchars=trail:⋅,nbsp:⋅,tab:▸\

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Windows
set winwidth=84
set winheight=10
set winminheight=10
set winheight=999

" Use Ag instead of grep
set grepprg=ag

" Able to 'gf' files
set suffixesadd=.rb,.coffee,.js

" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1

" View full list when tab-complete in command mode
set wildmode=list:full

" Statusline
set laststatus=2
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
let g:Powerline_symbols = 'fancy'

" more space for command output
set shortmess=a
set cmdheight=2

" When at 3 spaces and I hit >>, go to 4, not 5.
set shiftround


"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
"highlight Pmenu ctermbg=238 gui=bold
" Go Lang
set rtp+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

" don't use Ex mode, use Q for formatting
map Q gq

" Nerdtree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" clear the search buffer when hitting return
nnoremap <silent> <CR> :nohlsearch<cr>

" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" ignore Rubinius, Sass cache files
set wildignore+=*/tmp/**,*.rbc,.rbx,*.scssc,*.sassc,*/vendor/**,*.so,*.swp,*.zip,*.dump,*.sql

" disable cursor keys in normal mode
map <Left>  :echo "no! arrows you shall not use!"<cr>
map <Right> :echo "no! arrows you shall not use!"<cr>
map <Up>    :echo "no! arrows you shall not use!"<cr>
map <Down>  :echo "no! arrows you shall not use!"<cr>

" No difference between ; and ;
map ; :

" ignore Rubinius, Sass cache files
set wildignore+=*/tmp/**,*.rbc,.rbx,*.scssc,*.sassc,*/vendor/**,*.so,*.swp,*.zip

command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>

" Command T
let g:CommandTCancelMap=['<ESC>','<C-c>']

" CSS COLOR
let g:cssColorVimDoNotMessMyUpdatetime = 1

" Leader
let mapleader=","

" ========================================================================
"  Mappings
" ========================================================================

nnoremap <leader><leader> <c-^>

" CtrlP familiar to Command-T
" silent! nnoremap <unique> <silent> <Leader>t :CtrlP<CR>
silent! nnoremap <unique> <silent> <Leader>f :CommandT<CR>
silent! nnoremap <unique> <silent> <Leader>b :CommandTBuffer<CR>

map <leader>F :CommandT %%<cr>
map <leader>.v :CommandT app/views<cr>
map <leader>.c :CommandT app/controllers<cr>
map <leader>.m :CommandT app/models<cr>
map <leader>.h :CommandT app/helpers<cr>
map <leader>.k :CommandT config<cr>
map <leader>.l :CommandT lib<cr>
map <leader>.t :CommandT spec<cr>
map <leader>.r :topleft :split config/routes.rb<cr>
map <leader>.j :CommandT app/assets/javascripts<cr>
map <leader>.s :CommandT app/assets/stylesheets<cr>
map <leader>/t :CommandT app/assets/javascripts/templates<cr>
map <leader>/m :CommandT app/assets/javascripts/models<cr>
map <leader>/v :CommandT app/assets/javascripts/views<cr>
map <leader>/c :CommandT app/assets/javascripts/views<cr>

map <leader>bi :BundleInstall<cr>
map <leader>bc :BundleClean<cr>
map <leader>bs :BundleSearch<cr>

map <leader>wc :CoffeeCompile watch vert<cr>

" find merge conflict markers
nmap <leader>cf <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Clear whitespace
nmap <leader>W :KillWhitespace<CR>

" Tabs to spaces
map <leader>i :%s/\t/  /g<CR>

" Easy commenting
map <leader>cc :TComment<cr>

" Make editing vimrc simple
nmap <leader>v :e $MYVIMRC<CR>

" Window management
map <Leader>z :bp<CR>
map <Leader>x :bn<CR>
map <Leader>q :bd<CR>
map <Leader>w :bp<CR>:bd#<CR>

" Open current dir in finder
nmap <leader>o :! open .<cr><cr>
nmap <leader>O :! open %%<cr><cr>

" Tests
map <Leader>t :call RunCurrentTest()<CR>
map <Leader>T :call RunCurrentLineInTest()<CR>
map <Leader>a :!rspec<CR>

"Rename File
map <leader>n :call RenameFile()<cr>

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

map <C-n> :NERDTreeToggle<CR>

" Insert Launchy
nmap <leader>s A<cr>save_and_open_page<esc>

"bind command-] to indent
nmap <D-]> >>
vmap <D-]> >gv
imap <D-]> <C-O>>>
 
"bind command-[ to outdent
nmap <D-[> <<
vmap <D-[> <gv
imap <D-[> <C-O><<

"CoffeeScript
"
hi link coffeeReservedError NONE
hi link coffeeSemicolonError NONE
hi link coffeeSpaceError NONE
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" Rainbow Parenthesis
nnoremap <leader>rp :RainbowParenthesesToggle<CR>
" Nerdtree

" ========================================================================
"  Autocmd
" ========================================================================

if has("autocmd")
  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif

  " mark Jekyll YAML frontmatter as comment
  au BufNewFile,BufRead *.{md,markdown,html,xml} sy match Comment /\%^---\_.\{-}---$/

  " Treat ERB as ruby erb file
  au BufRead,BufNewFile *.erb set filetype=eruby.html

  " Reload vimrc on save
  au BufWritePost .vimrc source $MYVIMRC

  " Flush CtrlP automaticaly
  au FocusGained,BufWritePost * CommandTFlush
endif


" ========================================================================
"  Functions
" ========================================================================

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

function! RunCurrentTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()

    if match(expand('%'), '\.feature$') != -1
      call SetTestRunner("!cucumber")
      exec g:bjo_test_runner g:bjo_test_file
    elseif match(expand('%'), '_spec\.rb$') != -1
      call SetTestRunner("!rspec --no-color")
      exec g:bjo_test_runner g:bjo_test_file
    else
      call SetTestRunner("!ruby -Itest")
      exec g:bjo_test_runner g:bjo_test_file
    endif
  else
    exec g:bjo_test_runner g:bjo_test_file
  endif
endfunction

function! SetTestRunner(runner)
  let g:bjo_test_runner=a:runner
endfunction

function! RunCurrentLineInTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFileWithLine()
  end

  exec "!rspec" g:bjo_test_file . ":" . g:bjo_test_file_line
endfunction

function! SetTestFile()
  let g:bjo_test_file=@%
endfunction

function! SetTestFileWithLine()
  let g:bjo_test_file=@%
  let g:bjo_test_file_line=line(".")
endfunction

function! CorrectTestRunner()
  if match(expand('%'), '\.feature$') != -1
    return "cucumber"
  elseif match(expand('%'), '_spec\.rb$') != -1
    return "rspec"
  else
    return "ruby"
  endif
endfunction
