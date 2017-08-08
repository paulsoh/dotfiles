call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'w0ng/vim-hybrid'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install —all' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
" Auto Pair for () {} 
Plug 'jiangmiao/auto-pairs'
" Do operations on surrounding tags etc
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'paulsoh/vim-snippets'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-python/python-syntax'

call plug#end()

set background=dark
colorscheme hybrid

set relativenumber 
set number    
set showmatch
set ruler
set mouse=a


" Enable tmux sessions to use clipboard
set clipboard=unnamed

autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'
let g:airline_powerline_fonts=1
let g:python3_host_prog = $NEOVIM3_PATH

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

:nnoremap <C-g> :NERDTreeToggle<CR>
:noremap <C-t> :FZF<CR>

:imap jj <ESC>
nnoremap qq :noh<return><esc>

let g:deoplete#enable_at_startup = 1

let g:python_highlight_all = 1

" Make TAB to move around deoplete
" inoremap <silent><expr> <TAB>
" \ pumvisible() ? "\<C-n>" :
" \ <SID>check_back_space() ? "\<TAB>" :
" \ deoplete#mappings#manual_complete()

" function! s:check_back_space() abort "{{{
" 	let col = col('.') - 1
" 	return !col || getline('.')[col - 1]  =~ '\s'
" endfunction"}}}
" Make TAB to move around deoplete end

" Closes window after deoplete completion
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Python autofix
let g:ale_fixers = {'python': ['autopep8']}
let g:ale_python_autopep8_options = '--aggressive'

let g:airline#extensions#ale#enabled = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0

call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])
" Allows you to indent without cursor getting loose everytime

vmap <Tab> :><CR>gv
vmap <S-Tab> :<<CR>gv


" Allow multiple cursors to function quickly even in large files
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if has('nvim')
    call deoplete#disable()
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if has('nvim')
    call deoplete#enable()
  endif
endfunction
