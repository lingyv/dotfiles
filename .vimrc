" 关闭兼容模式
set nocompatible
" 定义快捷键的前缀，即<Leader>
let mapleader=" "

" 文件编码
let &termencoding=&encoding 
set fileencodings=utf-8,gbk

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
nmap <Leader>{ zM
" 打开所有折叠
nmap <Leader>} zR
" 打开或关闭当前折叠
nnoremap <Leader>[ za

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
set rtp+=/usr/local/opt/fzf

" 插件管理
call plug#begin('~/.vim/plugged')
Plug 'tomasr/molokai'
Plug 'vim-scripts/phd'
Plug 'lingyv/Colorful'
Plug 'iCyMind/NeoSolarized'
Plug 'KeitaNakamura/neodark.vim'
Plug 'vim-airline/vim-airline' "美化状态栏
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/rainbow_parentheses.vim' "为括号上色
Plug 'Raimondi/delimitMate' " 自动补全单引号，双引号等
Plug 'docunext/closetag.vim' " 自动补全html/xml标签
Plug 'ludovicchabant/vim-gutentags' "自动索引
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' } " 查看函数列表
Plug 'dyng/ctrlsf.vim'    "查找
" Plug 'w0rp/ale' "异步代码检查
Plug 'jeetsukumaran/vim-pythonsense'    "Python 文本对象
Plug 'terryma/vim-multiple-cursors'   "多处编辑
Plug 'scrooloose/nerdcommenter'   "快速注释
Plug 'Valloric/YouCompleteMe' "自动补全
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}    "目录树
Plug 'Lokaltog/vim-easymotion'    "把满足条件的位置用 [;A~Za~z] 间的标签字符标出来
Plug 'fatih/vim-go', {'for': 'go'}   "go语言插件
Plug 'derekwyatt/vim-scala', {'for': 'scala'}   "scala语言插件
Plug 'pangloss/vim-javascript', {'for': 'js'}  " 前端 js
Plug 'mxw/vim-jsx', {'for': 'js'}  " 前端库 React
Plug 'chrisbra/csv.vim', {'for': 'csv'}  " CSV
Plug 'Yggdroot/indentLine'    "缩进线
Plug 'asins/vimcdoc' "中文文档
Plug 'tpope/vim-fugitive' "vim 里使用 git 命令
Plug 'airblade/vim-gitgutter' "显示文件变动
Plug 'junegunn/gv.vim' "git commit 浏览器
Plug 'skywind3000/asyncrun.vim' "异步运行命令
call plug#end()

" 设定 doc 文档目录
let helptags=$VIM."/vimfiles/doc"
set helplang=cn

" 配色方案
set background=dark
colorscheme Colorful
" colorscheme NeoSolarized
" colorscheme neodark

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
" let g:ale_sign_error = '😡'
" let g:ale_sign_warning = '😢'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'


" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<c-space>"

" 提供python3自动完成
let g:ycm_python_binary_path = 'python'
" YCM 补全菜单配色
" 菜单
" highlight Pmenu ctermfg=2 ctermbg=3 guifg=#00D1E8 guibg=#12FF12
" 选中项
" highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#00D1E8 guibg=#106900
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
" inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
" 跳转到定义处 查找光标下的符号，跳转到它的定义;如果定义不能访问，则跳转到符号的声明
nnoremap <leader>jd :YcmCompleter GoTo<CR>
" 跳转到引用处 查找项目中的所有引用到光标下的标识符
nnoremap <leader>jr :YcmCompleter GoToReferences<CR>
" 获取变量或者方法的类型
nnoremap <leader>gt :YcmCompleter GetType<CR>
" 获取文档
nnoremap <leader>gd :YcmCompleter GetDoc<CR>
" 自动弹出语义补全
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：tree
nmap <Leader>t :NERDTreeToggle<CR>
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
nmap s <Plug>(easymotion-s)
" 不区分大小写
let g:EasyMotion_smartcase = 1
" 快速跳转到上一行,下一行
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" 插件在工程内全局查找
nnoremap <C-f> :CtrlSF<Space>

" 插件Leaderf -> 关闭预览功能,ESC退出函数列表
" F2查看函数列表
noremap <Leader>m :LeaderfFunction!<cr>
noremap <Leader>l :LeaderfLine<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
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
noremap <leader>n :tabnew<CR>
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

" 格式化 Python 代码
autocmd FileType python nnoremap <Leader>l :0,$!yapf<CR>

" 可视模式下快速全局替换
vmap <C-R> y:%s`<C-R>"``g<left><left>
