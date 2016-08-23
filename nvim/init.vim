set nocompatible
filetype off


call plug#begin('~/.dotfiles/nvim/bundle')

Plug 'The-NERD-Tree'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neomake/neomake'
Plug 'benjie/neomake-local-eslint.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'flowtype/vim-flow'

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }


call plug#end()

filetype plugin indent on

set relativenumber 
set number    

set showmatch
set ruler
set autoindent
set smartindent
set tabstop=2 shiftwidth=2 expandtab
set termguicolors

syntax enable

colorscheme OceanicNext

" let g:gruvbox_contrast_dark="hard"
" let g:gruvbox_italic=1

" colorscheme gruvbox
set background=dark    " Setting dark mode

" set omnifunc=syntaxcomplete#Complete

"""""""""""""""""""
" Plugin settings
"""""""""""""""""""
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1
" let g:syntastic_ruby_checkers = ['rubocop']
" let g:syntastic_javascript_checkers = ['eslint']
" let g:neomake_open_list = 0
" let g:neomake_javascript_eslint_maker = {
"     \ 'args': ['--verbose'],
"     \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
"    \ }
" let g:neomake_javascript_enabled_makers = ['eslint']


let g:neomake_javascript_enabled_makers = ['eslint', 'flow']
let g:neomake_jsx_enabled_makers = ['eslint', 'flow']

let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:deoplete#enable_at_startup = 1
let g:AutoPairsFlyMode = 0

" flowtype
let g:flow#omnifunc = 0


set statusline+=%{fugitive#statusline()}

" http://vim.wikia.com/wiki/Find_in_files_within_Vim
set grepprg=ag\ --vimgrep

nnoremap <F4> :grep <cword> . <Bar> :cw<CR>


" Key mapping
:imap jj <ESC>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

map <F7> :NERDTreeToggle<CR>
map <C-t> :FZF<CR>

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

" Because copying to clipboard is not supported...
function! ClipboardYank()
  call system('pbcopy', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('pbpaste')
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p
onoremap <silent> y y:call ClipboardYank()<cr>
onoremap <silent> d d:call ClipboardYank()<cr>

autocmd! BufWritePost * Neomake