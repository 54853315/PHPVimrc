set nocompatible   " 设置VIM不兼容VI

" ====整体风格设置=====
set t_Co=256
syntax on
set background=light
"xoria256
" Bundle 'Lokaltog/powerline' ", {'rtp': 'powerline/bindings/vim/'}

" PluginInstall
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'The-NERD-tree'
Plugin 'majutsushi/tagbar' 
Plugin 'tpope/vim-fugitive'
Plugin 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plugin 'L9'
Plugin 'sainnhe/sonokai'
Plugin 'schmich/vim-guifont'
Plugin 'mxw/vim-jsx'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'vim-airline/vim-airline'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'Lokaltog/vim-powerline'
call vundle#end()

"====================主题设置==================
colorscheme sonokai

"==========================guifont++===============
"让vim像IDE一样一键放大缩小字号
let guifontpp_size_increment=1 "每次更改的字号
let guifontpp_smaller_font_map="<M-Down>" "放大
let guifontpp_larger_font_map="<M-Up>"      "缩小
let guifontpp_original_font_map="<M-Home>"  "默认大小

set guifont=Menlo\ Regular:h24
set clipboard=unnamed
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
set linespace=15
set cursorline "突出显示当前行
set wildmenu                    "vim 自身命令行模式智能补全"
set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set backspace=2                   " 可以一直删到上一行
set showmatch                   "显示括号匹配
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set autoindent                  " always set autoindenting on  繼承前一行的縮排方式
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell           " don't beep
set noerrorbells         " don't beep
set autowrite  "Save on buffer switch
set mouse=a

" 进入时不显示上一次的搜索结果
" exec "nohlsearch"  
set incsearch " 启用即时搜索

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","


"Easy escaping to normal model
imap jj <esc>

"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

"Resize vsplit
" nmap <C-v> :vertical resize +5<cr>
nmap 25 :vertical resize 40<cr>
nmap 50 <c-w>=
nmap 75 :vertical resize 120<cr>

nmap <C-b> :NERDTreeToggle<cr>

"Load the current buffer in Chrome
nmap ,c :!open -a Google\ Chrome<cr>

"Show (partial) command in the status line
set showcmd

" Create split below
nmap rsp :rightbelow sp<cr>
" Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>
" Quickly go forward or backward to buffer
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>

highlight Search cterm=underline

" Swap files out of the project root
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" PHP IDE zone 
autocmd FileType php set omnifunc=phpcomplete#CompletePHP   "PHP的自动补全并格式化
" 自动打开NERDTree
autocmd VimEnter * NERDTree

" Run PHPUnit tests
map <Leader>t :!phpunit %<cr>

" Easy motion stuff
let g:EasyMotion_leader_key = '<Leader>'

" Powerline (Fancy thingy at bottom stuff)
let g:Powerline_symbols = 'fancy'
" set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
" set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch

" Remove search results
command! H let @/=""

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Abbreviations
    abbrev pft PHPUnit_Framework_TestCase

    abbrev gm !php artisan generate:model
    abbrev gc !php artisan generate:controller
    abbrev gmig !php artisan generate:migration

" Auto-remove trailing spaces
    autocmd BufWritePre *.php :%s/\s\+$//e

" Edit todo list for project
    nmap ,todo :e todo.txt<cr>

" Laravel framework commons
    nmap <leader>lr :e app/routes.php<cr>
    nmap <leader>lca :e app/config/app.php<cr>81Gf(%O
    nmap <leader>lcd :e app/config/database.php<cr>
    nmap <leader>lc :e composer.json<cr>

" Concept - load underlying class for Laravel
function! FacadeLookup()
    let facade = input('Facade Name: ')
    let classes = {
\       'Form': 'Html/FormBuilder.php',
\       'Html': 'Html/HtmlBuilder.php',
\       'File': 'Filesystem/Filesystem.php',
\       'Eloquent': 'Database/Eloquent/Model.php'
\   }

    execute ":edit vendor/laravel/framework/src/Illuminate/" . classes[facade]
endfunction
nmap ,lf :call FacadeLookup()<cr>

" CtrlP Stuff

" Familiar commands for file/symbol browsing
map <D-p> :CtrlP<cr>
" map <C-t> :CtrlPBufTag<cr>

" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**


" Create/edit file in the current directory
nmap :ed :edit %:p:h/

" Prepare a new PHP class
function! Class()
    let name = input('Class name? ')
    let namespace = input('Any Namespace? ')

    if strlen(namespace)
        exec 'normal i<?php namespace ' . namespace . ';
    else
        exec 'normal i<?php
    endif

    " Open class
    exec 'normal iclass ' . name . ' {^M}^[O^['
    
    exec 'normal i^M    public function __construct()^M{^M ^M}^['
endfunction
nmap ,1  :call Class()<cr>

" Add a new dependency to a PHP class
function! AddDependency()
    let dependency = input('Var Name: ')
    let namespace = input('Class Path: ')

    let segments = split(namespace, '\')
    let typehint = segments[-1]

    exec 'normal gg/construct^M:H^Mf)i, ' . typehint . ' $' . dependency . '^[/}^>O$this->^[a' . dependency . ' = $' . dependency . ';^[?{^MkOprotected $' . dependency . ';^M^[?{^MOuse ' . namespace . ';^M^['

    " Remove opening comma if there is only one dependency
    exec 'normal :%s/(, /(/g'
endfunction
nmap ,2  :call AddDependency()<cr>


filetype on                  " 打开时检查文件类型

filetype plugin indent on    " required 打开文件类型的插件和缩进

let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

" 按y复制选中内容，按p粘贴
map "+y :w !pbcopy<CR><CR>
map "+p :r !pbpaste<CR><CR>
" ctrl-x 剪切
vmap <C-x> :!pbcopy<cr>
" ctrl-c 复制
vmap <C-c> :w !pbcopy<cr><cr>
" ctrl-v 粘贴
" nmap <C-v> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
imap <C-v> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif


" Open tab
nmap <C-t> <Esc>:tabnew <CR>
" Reload vim 
map R :source $MYVIMRC<CR>
" save buffer file
map S :w<CR>
" quit vim
map Q :q<CR>
" next and current screen 

nmap <F9> <ESC> :TagbarToggle<CR> 

" go zone 
    let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
        \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
    \ }


" reactjs zone 
    let g:jsx_ext_required = 0 " Allow JSX in normal JS files
    let g:syntastic_javascript_checkers = ['eslint']
