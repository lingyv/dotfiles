" 关闭兼容模式
set nocompatible
" 定义快捷键的前缀，即<Leader>
let mapleader=" "

" 文件编码
let &termencoding=&encoding 
set fileencodings=utf-8,gbk

" MacVim字体
" set macligatures
" set guifont=Fira\ Code\ Retina:h13

" 显示相对行号（当前行为绝对行号）
set nu rnu
" 在屏幕右下角显示未完成的指令输入
set showmode
" 在屏幕右下角显示未完成的指令输入
set showcmd
" 上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=3

" 开启24bit真彩色
set termguicolors

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 高亮显示当前行/列
" set cursorline

" 关闭可视化响铃
set novisualbell
set visualbell t_vb=

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 根据不同的文件类型执行不同的命令 
" c/c++类型 
:autocmd FileType c,cpp :set foldmethod=syntax 
:autocmd FileType c,cpp :set cindent 
" 是python类型 
:autocmd FileType python :set foldmethod=syntax 
:autocmd FileType python :set smartindent

" .un~ 文件写入 ~/undodor 文件夹中
set undodir=~/.undodir

" 在输入成对的括号时，Vim会帮助你跳转并高亮一下匹配的括号然后回到你正在输入的位置
set showmatch
set matchtime=1

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 自适应不同语言的智能缩进
filetype indent on
" 自动缩进
set autoindent
" 自动对齐
set shiftround

" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4

" 基于缩进或语法进行代码折叠
set foldmethod=indent
" set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
" 折叠所有代码
nnoremap <Leader>{ zM
" 打开所有折叠
nnoremap <Leader>} zR
" 打开或关闭当前折叠
nnoremap <Leader>[ za

" 映射切换buffer的键位
nnoremap <leader>p :bp<CR>
nnoremap <leader>n :bn<CR>

" 开启实时搜索功能
set incsearch
" 高亮搜索 
set hlsearch
" 搜索时大小写不敏感
set ignorecase
set smartcase

" vim 自身命令行模式智能补全
set wildmenu

" 剪切板使用 "* 寄存器
set clipboard=unnamed
" 在缩进位置，行结束符，段首可以回删
set backspace=indent,eol,start

" 开启对于制表符（tab）、行尾空格符（trail）、行结束符（eol）等等特殊符号的回显
" set list listchars=eol:ϟ,tab:ϊ♪,trail:·,extends:⇒,precedes:⇐,

" w!! to sudo & write a file
cmap w!! w !sudo tee >/dev/null %

" fzf支持
" set rtp+=/usr/local/opt/fzf

" 插件管理
call plug#begin('~/.vim/plugged')
Plug 'tomasr/molokai'
Plug 'vim-scripts/phd'
Plug 'lingyv/Colorful'
Plug 'iCyMind/NeoSolarized'
Plug 'KeitaNakamura/neodark.vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'vim-airline/vim-airline' "美化状态栏
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/rainbow_parentheses.vim' "为括号上色
Plug 'Raimondi/delimitMate' " 自动补全单引号，双引号等
Plug 'tpope/vim-surround'
Plug 'docunext/closetag.vim' " 自动补全html/xml标签
Plug 'ludovicchabant/vim-gutentags' "自动索引
Plug 'voldikss/vim-floaterm' "浮动终端
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' } " 查看函数列表
Plug 'dyng/ctrlsf.vim'    "查找
Plug 'w0rp/ale' "异步代码检查
Plug 'jeetsukumaran/vim-pythonsense'    "Python 文本对象
Plug 'terryma/vim-multiple-cursors'   "多处编辑
Plug 'scrooloose/nerdcommenter'   "快速注释
" Plug 'Valloric/YouCompleteMe' "自动补全
Plug 'Shougo/neocomplete.vim' "自动补全
Plug 'preservim/nerdtree' "树状文件浏览
" if has('nvim')
"   Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' } "树状文件浏览
" else
"   Plug 'Shougo/defx.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
Plug 'Lokaltog/vim-easymotion'    "把满足条件的位置用 [;A~Za~z] 间的标签字符标出来
" Plug 'fatih/vim-go', {'for': 'go'}   "go语言插件
Plug 'Yggdroot/indentLine'    "缩进线
Plug 'itchyny/vim-cursorword' "当前单词下划线
Plug 'liuchengxu/vim-which-key'
" Plug 'tpope/vim-fugitive' "vim 里使用 git 命令
" Plug 'airblade/vim-gitgutter' "显示文件变动
" Plug 'junegunn/gv.vim' "git commit 浏览器
" Plug 'skywind3000/asyncrun.vim' "异步运行命令
call plug#end()

" 配色方案
set background=dark
" colorscheme Colorful
colorscheme NeoSolarized
" colorscheme neodark
" colorscheme space-vim-dark
" 斜体字
hi Comment cterm=italic
" 透明背景
" hi Normal     ctermbg=NONE guibg=NONE
" hi LineNr     ctermbg=NONE guibg=NONE
" hi SignColumn ctermbg=NONE guibg=NONE

" 设置状态栏主题风格
set t_Co=256
set laststatus=2
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1

" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 代码检查
let g:airline#extensions#ale#enabled = 0
let g:ale_set_highlights = 0
let g:ale_fix_on_save = 1
let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '•'
let g:ale_echo_msg_error_str = '✹ Error'
let g:ale_echo_msg_warning_str = '⚠ Warning'
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
" run lint only on saving a file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 0
" dont run lint on opening a file
let g:ale_lint_on_enter = 0

" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<c-space>"

" 提供python3自动完成
" Disable AutoComplPop.
let g:acp_enableAtStartup = 1
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1
" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：tree
nnoremap <Leader>t :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 快速注释配置
" 默认情况下在注释分隔符后添加空格
let g:NERDSpaceDelims = 1
" 取消注释时，启用修剪尾随空格
let g:NERDTrimTrailingWhitespace = 1
 
" 关闭默认快捷键
let g:EasyMotion_do_mapping = 0 
" 跳转到任何地方
nnoremap s <Plug>(easymotion-s)
" 不区分大小写
let g:EasyMotion_smartcase = 1
" 快速跳转到上一行,下一行
nnoremap <Leader>j <Plug>(easymotion-j)
nnoremap <Leader>k <Plug>(easymotion-k)

" 插件在工程内全局查找
nnoremap <m-f> :CtrlSF<Space>

" 插件Leaderf -> 关闭预览功能,ESC退出函数列表
let g:Lf_ShortcutF = "<leader>f"
noremap <Leader>r :LeaderfMru<cr>
noremap <Leader>m :LeaderfFunction!<cr>
noremap <Leader>l :LeaderfLine<cr>
noremap <m-t> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_ShowDevIcons = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0}
let g:Lf_NormalMap = {
	\ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
	\ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
	\ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
	\ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
	\ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
	\ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
	\ }


" 插件Better Rainbow Parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" vim-gutentags 配置
set tags=./tags;,tags
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 检测函数（检测光标位置处文字的样式名）
function! <SID>SynStack()
    echo map(synstack(line('.'),col('.')),'synIDattr(v:val, "name")')
    endfunc

" 绑定检测键位（按键后样式名信息会输出在指令栏的位置）
nnoremap <leader>vc :call <SID>SynStack()<CR>

" 定义函数AutoSetFileHead，自动插入文件头
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    "如果文件类型为python
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(1, "__author__ = 'lingyv'")
        call append(1, "")
        call append(1, "\# -*- coding: utf-8 -*-")
    endif

    normal G
    normal o
    normal o
endfunc

" normal模式切换到指定tab
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<cr>

" 可视模式下快速全局替换
vnoremap <C-R> y:%s`<C-R>"``g<left><left>

" Quick run via <F5>
nnoremap <F5> :call <SID>compile_and_run()<CR>
function! s:compile_and_run()
    exec 'w'
    if &filetype == 'c'
        exec "AsyncRun! gcc % -o %<; time ./%<"
    elseif &filetype == 'cpp'
       exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
    elseif &filetype == 'java'
       exec "AsyncRun! javac %; time java %<"
    elseif &filetype == 'sh'
       exec "AsyncRun! time bash %"
    elseif &filetype == 'python'
       exec "AsyncRun! time python %"
    elseif &filetype == 'go'
        exec "AsyncRun! time go run %"
    elseif &filetype == 'scala'
        exec "AsyncRun! time scala %"
    endif
endfunction
" asyncrun now has an option for opening quickfix automatically
let g:asyncrun_open = 15
