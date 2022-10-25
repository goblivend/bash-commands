" ~/.vimrc

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" https://github.com/tpope/vim-sensible
Plugin 'tpope/vim-sensible'


Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


" All of your Plugins must be added before the following line
call vundle#end()            " required

call plug#begin()

Plug 'bluz71/vim-moonfly-colors'
Plug 'vim-scripts/AutoComplPop'
" Plug 'luochen1990/rainbow'

" Use release branch (recommend)
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Or build from source code by using yarn: https://yarnpkg.com
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}



call plug#end()
colorscheme slate

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

runtime! plugin/sensible.vim

set encoding=utf-8 fileencodings=
syntax on

set number
set relativenumber 
set cc=80
set cursorline
set autowrite
set tabstop=4
set shiftwidth=4
set expandtab

set list listchars=tab:»·,trail:·
set autochdir

" set listchars=eol:$,tab:»,trail:· " ,space:·
" set list
" set lcs=spaces:.
set autoindent
set incsearch
set smartcase
set showmode
set showcmd
set scrolloff=10
set splitbelow
set splitright
set autoread
set showmatch
set hlsearch

set wildmenu
set wildmode=list:longest
set wildignore=*.out,*.png,*.jpg,*.pdf

autocmd BufWritePre *.c :%s/\s\+$//e
autocmd BufWritePre *.h :%s/\s\+$//e
autocmd BufWritePre Makefile :%s/\s\+$//e

let g:clang_format#detect_style_file = 1
map <F5> :call CompileRun() \| :call clang_format#do_auto_format()<CR>
imap <F5> <Esc>:call CompileRun()<CR>
vmap <F5> <Esc>:call CompileRun()<CR>

func! CompileRun(...)
exec "w"
if &filetype == 'c'
    :silent exec "!gcc -Wall -Werror -Wextra -pedantic -std=c99 -fsanitize=address  % -o %<"
    exec "!time ./%<" . join(a:000, ' ')
elseif &filetype == 'sh'
    exec "!time bash %"
endif
endfunc

command! Compile call CompileRun(<args>) | :call clang_format#do_auto_format()

autocmd Filetype make setlocal noexpandtab

" set list listchars=tab:»·,trail:·


" per .git vim configs
" just `git config vim.settings "expandtab sw=4 sts=4"` in a git repository
" change syntax settings for this repository
let git_settings = system("git config --get vim.settings")
if strlen(git_settings)
	exe "set" git_settings
endif
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
