"------------------------------------
"" PluginManager dein
"------------------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/bundles')
  call dein#begin('~/.vim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/unite.vim'                       )
  call dein#add('Shougo/vimfiler'                        )
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('Shougo/neomru.vim'                      )
  call dein#add('Shougo/neoinclude.vim')
  call dein#add('Shougo/deoplete-clangx')
  call dein#add('fatih/vim-go'                      )
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  "C++ complete
  call dein#add('lighttiger2505/deoplete-vim-lsp.git')
  call dein#add('prabirshrestha/vim-lsp.git')
  call dein#add('mattn/vim-lsp-settings.git')
  call dein#add('thinca/vim-quickrun')
  call dein#add('rhysd/vim-clang-format.git')
  "call dein#add('neoclide/coc.nvim')
  let g:deoplete#enable_at_startup = 1 

  "Filer
  call dein#add('ryym/vim-viler')

  "カッコ補完
  call dein#add('itmammoth/doorboy.vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable
let g:dein#auto_recache = 1

"------------------------------------
"" General Settings
"------------------------------------
set nobackup
set writebackup
set clipboard=unnamed
" Configuration of showing
syntax on
set title
set nonumber
set showcmd
set laststatus=2
set number
"カッコの表示、表示時間
set showmatch
set matchtime=2
set hlsearch
set wildmenu
set nowrap

set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
"colorscheme molokai
let g:molokai_original = 1

let g:python_host_prog = system('echo -n $(which python2)')
let g:python3_host_prog = system('echo -n $(which python3)')

"OpenGL
set path+=$HOME/works/opengl/learnopengl/glad/include
set path+=/usr/local/Cellar/glfw/3.3.2/include/GLFW
set path+=/usr/local/include/GLFW


"前回のカーソル位置を復元
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   exe "normal! g`\"" |
    \ endif
augroup END

nnoremap <silent> <c-g> :echo expand("%:p")<CR>

"------------------------------------
"" vimfiler 関連付け
"------------------------------------
let g:vimfiler_safe_mode_by_default=0
let g:vimfiler_as_default_explorer = 1
nnoremap <Space>f :<C-u>VimFiler<CR>
let g:vimfiler_enable_auto_cd = 1

"------------------------------------
"" タブ機能
"------------------------------------
nnoremap <silent> tf :<c-u>tabfirst<cr>
nnoremap <silent> tl :<c-u>tablast<cr>
nnoremap <silent> tn :<c-u>tabnext<cr>
nnoremap <silent> tN :<c-u>tabNext<cr>
nnoremap <silent> tb :<c-u>tabprevious<cr>
nnoremap <silent> te :<c-u>tabedit<cr>
nnoremap <silent> tc :<c-u>tabnew<cr>
nnoremap <silent> tq :<c-u>tabclose<cr>
nnoremap <silent> to :<c-u>tabonly<cr>
nnoremap <silent> ts :<c-u>tabs<cr>

"------------------------------------
"" vimgrep
"------------------------------------
autocmd QuickFixCmdPost *grep* cwindow
nnoremap [q :cprevious<CR>   " 前へ
nnoremap ]q :cnext<CR>       " 次へ
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR>  " 最後へ

"------------------------------------
"" go-vim
"------------------------------------
let g:go_def_mode = 'godef'

set completeopt-=preview


"------------------------------------
"" For mac
"------------------------------------
set backspace=indent,eol,start

"------------------------------------
"" deoplete
"------------------------------------
let g:deoplete#sources#clang#libclang_path = system("llvm-config --prefix")[:-2] . '/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = system("llvm-config --prefix")[:-2] . '/lib/clang'
let g:deoplete#sources#clang#sort_algo = 'priority'
let g:deoplete#sources#clang#clang_complete_database="./build/"

call deoplete#enable()
" No display of the number of competion list
set shortmess+=c

" <TAB>: completion.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"
" <C-e>: popup cancel
inoremap <expr><C-e>       deoplete#cancel_popup()

call deoplete#custom#source('_', 'matchers', ['matcher_head'])
call deoplete#custom#source('_', 'converters', [
      \ 'converter_remove_paren',
      \ 'converter_remove_overlap',
      \ 'matcher_length',
      \ 'converter_truncate_abbr',
      \ 'converter_truncate_menu',
      \ 'converter_auto_delimiter',
      \ ])
call deoplete#custom#option('keyword_patterns', {
      \ '_': '[a-zA-Z_]\k*\(?',
      \ 'tex': '[^\w|\s][a-zA-Z_]\w*',
      \ })
call deoplete#custom#option('camel_case', v:true)

"------------------------------------
"" quickrun
"------------------------------------
let g:quickrun_config = {}
"let g:quickrun_config.cpp = {
"      \   'command': 'g++',
"      \   'cmdopt': '-std=c++17'
"      \ }
let g:quickrun_config = {
            \ 'cpp': {
            \   'command': 'g++',
            \   'exec': ['%c %o %s -o %s:p:r', '%s:p:r %a'],
            \   'tempfile': '%{tempname()}.cpp',
            \   'cmdopt': '-std=c++17',
            \   'hook/sweep/files': '%S:p:r',
            \ },
            \}
nnoremap <silent> qr :QuickRun<cr>
nnoremap <silent> qq :only<cr>

"------------------------------------
"" clang_format
"------------------------------------
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
let g:clang_format#auto_format=1
"------------------------------------
"let $BASH_ENV = "~/.zsh_aliases"
set sh=zsh
" neovim terminal mapping
if has('nvim')
	" 新しいタブでターミナルを起動
	nnoremap tt :tabe<CR>:terminal<CR>
	" q + t でターミナルを終了
	tnoremap tq <C-\><C-n>:q<CR>
	" ESCでターミナルモードからノーマルモードへ
	tnoremap <ESC> <C-\><C-n>
endif
