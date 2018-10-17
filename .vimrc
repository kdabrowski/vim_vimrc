set nocompatible " be iMproved

" Running tests in tmux session Bundle 'tpope/vim-dispatch'
" For vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" For Patogen
execute pathogen#infect()

" Dependencies of snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/vim-snippets"
Bundle "mattn/emmet-vim"

"Emblem highlighting support
Bundle 'heartsentwined/vim-emblem'

"Javascript completion
Bundle 'ternjs/tern_for_vim'

" Good looking bottom :)
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'

" Git tools
Bundle 'tpope/vim-fugitive'

" Dependency managment
Bundle 'gmarik/vundle'
" Rails :/
Bundle 'tpope/vim-rails.git'
" Snippets for our use :)
Bundle 'tomtom/tcomment_vim'
" Beutiful solarized theme
Bundle 'altercation/vim-colors-solarized'
" Molokai theme
Bundle 'sickill/vim-monokai'
" GruvBox theme
Bundle 'morhetz/gruvbox'
" Vim Ruby
Bundle 'vim-ruby/vim-ruby'
" Surround your code :)
Bundle 'tpope/vim-surround'
" Every one should have a pair (Autogenerate pairs for "{[( )
Bundle 'jiangmiao/auto-pairs'
" Tab completions
Bundle 'ervandew/supertab'
" CoffeeScript syntax
Bundle 'kchmck/vim-coffee-script'
" Fuzzu finder for vim (CTRL+P)
Bundle 'kien/ctrlp.vim'
" Easy motion for easy motion
Bundle 'Lokaltog/vim-easymotion'
" Safe pase with zsh
Bundle 'ConradIrwin/vim-bracketed-paste'
Bundle 'ngmy/vim-rubocop'
Bundle 'pangloss/vim-javascript'
Bundle 'jelera/vim-javascript-syntax'
Bundle "fatih/vim-go"

" Autocomplete
Bundle 'Valloric/YouCompleteMe'

" Autoformatting tool for RoR
Bundle 'KurtPreston/vim-autoformat-rails'

" Nerdtree
Bundle 'scrooloose/nerdtree'

" Vim-Rspec
Bundle 'thoughtbot/vim-rspec'

set grepprg=ack-grep " Set ACK as a default grep
set tags=./tags; " Set tags directory
set autoindent " Auto indention should be on
let mapleader=","
filetype plugin indent on

" Ruby stuff: Thanks Ben :)
" ================
syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

augroup myfiletypes
	" Clear old autocmds in group
	autocmd!
	" autoindent with two spaces, always expand tabs
	autocmd FileType ruby,javascript,eruby,yaml,markdown,coffee,html,handlebars,hbs,js,vue set ai sw=2 sts=2 et
augroup END
" ================
" Configs to make Molokai look great
syntax enable
set background=dark
let g:gruvbox_termcolors=256
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'

" Config for RuboCop
let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>

" Show trailing whitespace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Lovely linenumbers
set nu

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
" Remove highlights with leader + enter
nmap <Leader><CR> :nohlsearch<cr>

" Buffer switching
map <leader>p :bp<CR> " \p previous buffer
map <leader>n :bn<CR> " \n next buffer
map <leader>d :bd<CR> " \d delete buffer

" Airline Theme setup
let g:airline_theme = 'gruvbox'

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Removing escape
ino jj <esc>
cno jj <c-c>
vno v <esc>

" highlight the current line
set cursorline

" Highlight active column
set cuc cul"

" Spellcheck
set spell spelllang=en_us

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
""""""""""""""""""""""""""""""""""""""""
" BACKUP / TMP FILES
""""""""""""""""""""""""""""""""""""""""
if isdirectory($HOME . '/.vim/backup') == 0
	:silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" " If you have .vim-swap in the current directory, it'll use that.
" " Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
	:silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

autocmd BufNewFile,BufReadPost *.md,*.mdown,*.mdwn,*.mmd set filetype=markdown

" Trim white spaces
function! StripTrailingWhiteSpace()
  " skip for markdown
  if &filetype =~ 'markdown'
    return
  endif
  %s/\s\+$//e
endfunction

autocmd BufWritePre * call StripTrailingWhiteSpace()

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
	" undofile - This allows you to use undos after exiting and restarting
	" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
	" :help undo-persistence
	" This is only present in 7.3+
	if isdirectory($HOME . '/.vim/undo') == 0
		:silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
	endif
	set undodir=./.vim-undo//
	set undodir+=~/.vim/undo//
	set undofile
endif
" Tags file path
set tags=./tags,tags;$HOME

" Ruby hash syntax conversion
nnoremap :%s/:\([^ ]*\)\(\s*\)=>/\1:/g

" Increment numbers
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn))$'
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = [
      \ '.git',
      \ 'cd %s && git ls-files . -co --exclude-standard',
      \ 'find %s -type f'
      \ ]
let g:ctrlp_working_path_mode = 'r'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_cache_omnifunc = 0

" Syntax
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_checkers_ruby = ['RuboCop', 'Ruby-lint']

Plugin 'rking/ag.vim'
set runtimepath^=~/.vim/bundle/ag

set nocompatible
filetype off

let &runtimepath.=',~/.vim/bundle/ale'

filetype plugin on
