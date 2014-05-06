"""""""""""""""
" NeoBundle
"""""""""""""""
if has ('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

" Goods
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'kana/vim-submode'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'tpope/vim-surround'
NeoBundle 'chazmcgarvey/vimcoder'
NeoBundle 'Shougo/unite.vim'

" Color schemes
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/newspaper.vim'
NeoBundle 'altercation/vim-colors-solarized'

" For specific languages/frameworks
NeoBundle 'aharisu/vim_goshrepl'
NeoBundle 'aharisu/vim-gdev'
NeoBundle 'kana/vim-filetype-haskell'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'soh335/vim-symfony'
NeoBundle 'derekwyatt/vim-scala'

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

" Keymap for Tree, Buffer
nnoremap <silent> <C-t>      :NERDTreeToggle<CR>
vnoremap <silent> <C-t> <Esc>:NERDTreeToggle<CR>
onoremap <silent> <C-t>      :NERDTreeToggle<CR>
inoremap <silent> <C-t> <Esc>:NERDTreeToggle<CR>
cnoremap <silent> <C-t> <C-u>:NERDTreeToggle<CR>
nnoremap <silent> <C-n>  :bnext<CR>
nnoremap <silent> <C-p>  :bprevious<CR>

" Keymap for resizing window
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>-')
call submode#map('winsize', 'n', '', '-', '<C-w>+')

" Keymap for Ctags
nnoremap t    <Nop>
nnoremap tt  <C-]>
nnoremap tj  :<C-u>tag<CR>
nnoremap tk  :<C-u>pop<CR>
nnoremap tl  :<C-u>tags<CR>

" Neocomplcache
let g:neocomplcache_enable_at_startup = 1

" NeoSnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

"""""""""""""""
" For specific languages/frameworks
"""""""""""""""
" Syntastic c++11
if executable("clang++")
  let g:syntastic_cpp_compiler = 'clang++'
  let g:syntastic_cpp_compiler_options = '-std=c++1y'
  let g:quickrun_config = {}
  let g:quickrun_config['cpp/clang++1y'] = {
      \ 'cmdopt': '-std=c++1y',
      \ 'type': 'cpp/clang++'
    \ }
  let g:quickrun_config['cpp'] = {'type': 'cpp/clang++1y'}
endif

" Haskell
" let g:neocomplete#keyword_patterns['gosh-repl'] = "[[:alpha:]+*/@$_=.!?-][[:alnum:]+*/@$_:=.!?-]*"

" GoLang
set rtp+=$GOROOT/misc/vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.go = '\h\w*\.\?'
au BufNewFile,BufRead *.go setf go

" PHP
autocmd FileType php setl autoindent
autocmd FileType php setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType php setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
let g:syntastic_quiet_messages = { "type": "style", "file": '\m\c\.php$'}



filetype plugin indent on
NeoBundleCheck
