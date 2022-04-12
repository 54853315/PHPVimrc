scriptencoding utf-8
" ============================================================================
" Author: konakona
" Blog: http://blog.crazyphper.com
" Version: v0.1.0
" Update Time: 2022-04-08

" ============================================================================

syntax on

" PluginInstall 插件
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle/')
Plugin 'VundleVim/Vundle.vim'   " let Vundle manage Vundle, required
Plugin 'git://git.wincent.com/command-t.git'
" 状态栏
Plugin 'vim-airline/vim-airline'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'L9'
" 侧边文件浏览器
Plugin 'The-NERD-tree'
 " 可视化缩进插件
Plugin 'nathanaelkane/vim-indent-guides'    
" 侧边导航
Plugin 'majutsushi/tagbar'
" 简单的Git指令包
Plugin 'tpope/vim-fugitive'
" 在编辑时显示git change
Plugin 'airblade/vim-gitgutter'
" Paint css colors with the real color 需要用GO安装
"Plugin 'lilydjwg/colorizer' 如果安装后，启动vim时报错，可以看下你的终端是否支持 :echo has('termguicolors')
Plugin 'https://github.com/BourgeoisBear/clrzr'
" PHP自动补全
Plugin 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
" PHP格式化
Plugin 'stephpy/vim-php-cs-fixer'
" Golang Plugins
Plugin 'fatih/vim-go'
" 主题包
Plugin 'sainnhe/sonokai'
" Vim字体设置
Plugin 'schmich/vim-guifont'
" 支持JSX
Plugin 'mxw/vim-jsx'
" 支持Vue语法高亮
"Plugin 'posva/vim-vue'
" Vue.js syntax and highlighting
Plugin 'tao12345666333/vim-vue'
" Dockerfile support
Plugin 'ekalinin/Dockerfile.vim'
" 文件查找
Plugin 'git@github.com:ctrlpvim/ctrlp.vim.git'
Plugin 'fisadev/vim-ctrlp-cmdpalette'
" Tab list panel
Plugin 'kien/tabman.vim'
Plugin 'ycm-core/YouCompleteMe'
"Plugin 'Lokaltog/vim-powerline'
call vundle#end()

"主题设置
colorscheme sonokai
let g:sonokai_style = 'shusia'  "另一个更好看的风格 andromeda
"let g:sonokai_better_performance = 1       "加快主题加载速度
let g:solarized_termcolors=256
let guifontpp_size_increment=2              "每次更改的字号
let guifontpp_smaller_font_map="<M-Down>"   "放大
let guifontpp_larger_font_map="<M-Up>"      "缩小
let guifontpp_original_font_map="<M-Home>"  "默认大小
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
set nocompatible
set background=light
set guifont=Menlo\ Regular:h24
set clipboard=unnamed
set guioptions-=T               " Removes top toolbar
set guioptions-=r               " Removes right hand scroll bar
set go-=L                       " Removes left hand scroll bar
set linespace=15
set cursorline                  "突出显示当前行
set wildmenu                    "vim 自身命令行模式智能补全"
set showmode                    " always show what mode we're currently editing in
set wrap                    
set cc=80
set cc+=120
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
set visualbell                  " don't beep
set noerrorbells                " don't beep
set autowrite                   "Save on buffer switch
set mouse=a
set incsearch                   " 启用即时搜索
" exec "nohlsearch"  " 进入时不显示上一次的搜索结果
set showcmd
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set encoding=utf-8

"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

 "方便没有Ecs键的朋友
imap jj <esc>

nmap <C-+> :vertical resize +5<cr>      "Resize vsplit
nmap <C--> :vertical resize -5<cr>
nmap 25 :vertical resize 40<cr>
nmap 75 :vertical resize 120<cr>
nmap vs :vsplit<cr>                     " Open splits
nmap sp :split<cr>
nmap ,c :!open -a Google\ Chrome<cr>    "Load the current buffer in Chrome
nmap <C-b> :NERDTreeToggle<cr>
nmap rsp :rightbelow sp<cr>             " Create split below
nnoremap <D-p> :CtrlP<cr>                    " Familiar commands for file/symbol browsing
"map <D-p> :CtrlP<cr>                    " Familiar commands for file/symbol browsing
map <C-r> :CtrlPBufTag<cr>
nmap :bp :BufSurfBack<cr>               " Quickly go forward or backward to buffer
nmap :bn :BufSurfForward<cr>
nmap "+y :w !pbcopy<CR><CR>              " 按y复制选中内容
nmap "+p :r !pbpaste<CR>                 " 按p粘贴 
vmap <C-x> :!pbcopy<CR>                 " ctrl-x 剪切
vmap <C-c> :w !pbcopy<cr><cr>           
" nmap <C-v> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
imap <C-v> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>

nnoremap <F9> <ESC> :TagbarToggle<CR> 
nmap <C-[> <ESC>:tabp <CR>
nmap <C-]> <ESC>:tabn <CR>
nmap td <Esc>:tabnew <CR>                " Open tab
nnoremap R :source $MYVIMRC<CR>              " Reload vim 
nnoremap S :w<CR>                           " save buffer file
nnoremap Q :q<CR>                            " quit vim
nnoremap <C-i> <ESC> :IndentGuidesToggle<CR>
nnoremap <C-k> <ESC> :Git blame<CR>

"auto open or close NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowHidden=1                   " 显示所有文件
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']  " 不需要显示的文件
let g:NERDTreeMapOpenInTabSilent='<2-LeftMouse>'
" CtrlP Stuff
let g:ctrlp_extensions = ['buffertag']
" 缩进设置
"let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1
"set ts=4 sw=4 et
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

highlight Search cterm=underline

"PHP的自动补全并格式化
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Run PHPUnit tests
nmap <Leader>t :!phpunit %<cr>

" Easy motion stuff
let g:EasyMotion_leader_key = '<Leader>'

" Powerline (Fancy thingy at bottom stuff)
let g:Powerline_symbols = 'fancy'
" set laststatus=2   " Always show the statusline
" set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch

" Remove search results
command! H let @/=""

" If php-cs-fixer is in $PATH, you don't need to define line below
" let g:php_cs_fixer_path = "~/php-cs-fixer.phar" " define the path to the php-cs-fixer.phar

" If you use php-cs-fixer version 2.x
let g:php_cs_fixer_rules = "@PSR12"          " options: --rules (default:@PSR2)
"let g:php_cs_fixer_cache = ".php_cs.cache" " options: --cache-file
"let g:php_cs_fixer_config_file = '.php_cs' " options: --config
" End of php-cs-fixer version 2 config params

let g:php_cs_fixer_php_path = "php"               " Path to PHP
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.
let g:php_cs_fixer_level='all'                    " 防止php-cs-fixer报没有level指令的错误

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


if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif


" golang setting 
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


" reactjs setting 
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint']

" vuejs setting
let g:vue_pre_processors = ['pug', 'scss', 'vue']

" clrzr setting
if has('termguicolors')
  " for neovim >= 0.1.5 and vim >= 8
  let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
  let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
  set termguicolors
elseif has('neovim')
  " for neovim 0.1.3 and 0.1.4
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
else
  " for vim 7
  set t_Co=256
endif

" YouComplateMe setting
set completeopt=menu,menuone
let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_complete_in_strings=1
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
let g:ycm_semantic_triggers =  {
                        \   'c': ['->', '.'],
                        \   'perl': ['->'],
                        \   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.'],
                        \   'php': ['->', '::'],
                        \   'lua': ['.', ':'],
                        \ }
