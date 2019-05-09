"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#load_toml('~/.config/nvim/dein.toml')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"""""""""""""""
" General preferences
"""""""""""""""

" Color
:set t_Co=256
syntax enable
colorscheme hybrid

" Indentation
set shiftwidth=2
set autoindent
set expandtab

" Line number
set number

" Swap colon for us keyboard
noremap : ;
noremap ; :

" Cursor moving on insert mode
inoremap <C-l> <Right>
inoremap <C-h> <Left>

" Keymap for Buffer
nnoremap <silent> <C-n>  :bnext<CR>
nnoremap <silent> <C-p>  :bprevious<CR>

" Hacks
vnoremap * "zy:let @/ = @z<CR>n"

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Rename
command! -nargs=1 -complete=file Rename f %:h/<args>|call delete(expand('#'))

"""""""""""""""
" Denite.vim
"""""""""""""""

noremap  [denite] <Nop>
map      <Space> [denite]
nnoremap <silent>[denite]e :<C-u>Denite file_rec<CR>
nnoremap <silent>[denite]<S-Char-101> :<C-u>DeniteCursorWord -mode=normal file_rec<CR>
nnoremap <silent>[define]<S-Char-103> :<C-u>DeniteCursorWord -mode=normal grep<CR>
nnoremap <silent>[denite]f :<C-u>DeniteProjectDir file_mru<CR>
nnoremap <silent>[denite]b :<C-u>DeniteProjectDir file_mru -mode=normal<CR>
nnoremap <silent>[denite]l :<C-u>DeniteCursorWord -auto-preview -mode=normal line<CR>
nnoremap <silent>[denite]g :<C-u>Denite grep -buffer-name=search-buffer-denite<CR>
nnoremap <silent>[denite]r :<C-u>Denite -resume -buffer-name=search-buffer-denite<CR>
nnoremap <silent>[denite]n :<C-u>Denite -resume -buffer-name=search-buffer-denite -select=+1 -immediately<CR>
nnoremap <silent>[denite]p :<C-u>Denite -resume -buffer-name=search-buffer-denite -select=-1 -immediately<CR>

"""""""""""""""
" For specific languages/frameworks
"""""""""""""""

" C++11
if executable("g++-6")
  let g:syntastic_cpp_compiler = 'g++-6'
  let g:syntastic_cpp_compiler_options = '-std=c++14'
  let g:quickrun_config = {}
  let g:quickrun_config['cpp/g++14'] = {
      \ 'cmdopt': '-std=c++14',
      \ 'type': 'cpp/g++'
    \ }
  let g:quickrun_config['cpp'] = {'type': 'cpp/g++14'}
elseif executable("clang++")
  let g:syntastic_cpp_compiler = 'clang++'
  let g:syntastic_cpp_compiler_options = '-std=c++1y'
  let g:quickrun_config = {}
  let g:quickrun_config['cpp/clang++1y'] = {
      \ 'cmdopt': '-std=c++1y',
      \ 'type': 'cpp/clang++'
    \ }
  let g:quickrun_config['cpp'] = {'type': 'cpp/clang++1y'}
endif
autocmd FileType cpp setl tabstop=4 expandtab shiftwidth=4 softtabstop=4

" " GoLang
" set rtp+=$GOROOT/misc/vim
" exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
" au BufNewFile,BufRead *.go setf go
" autocmd FileType go setl tabstop=8 shiftwidth=8 softtabstop=8

" PHP
autocmd FileType php setl autoindent
autocmd FileType php setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType php setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
let g:syntastic_quiet_messages = { "type": "style", "file": '\m\c\.php$'}

" Python
autocmd FileType python setl tabstop=4 expandtab shiftwidth=4 softtabstop=4

" Gauche
autocmd FileType scheme vmap <CR> <Plug>(gosh_repl_send_block)

" Haskell
autocmd FileType haskell setl tabstop=4 expandtab shiftwidth=4 softtabstop=4

" Rust
let g:racer_cmd = "$HOME/.cargo/bin/racer"
let g:racer_experimental_completer = 1
