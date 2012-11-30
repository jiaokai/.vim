" vim: fileencoding=utf-8
" vim: foldmethod=marker
" vim: foldcolumn=2
"=============================================================================
" FILE_NAME: .vimrc
" FILE_ENCODING: GBK(cp936)
" AUTHOR: 焦凯
" VERSION: 3.1
" REFERENCE: http://amix.dk/vim/vimrc.html
" LAST_CHANGE: 2010-01-06 18:38:22
" INTRODUCE:
"           Vim 编辑器的配置文件；
"           必须使用 GBK 作为本文件的编码，否则 "guifontwide" 参数的设置会出错
"=============================================================================
" CHANGLOG: {{{1
"   3.1 :
"       - FIX set vb t_vb=
"



"== 1. 一般设置 == {{{1
"=============================================================================
" 全局设置 {{{2
set all&            " 读取此配置文件的开始，所有选项使用缺省值；
                    " “&”：是为了避免打开vim时，显示一个个选项缺省值的对话框

set nocompatible    " 关掉有关vi一致性模式，避免以前版本的一些bug和局限

" 设置 runtimepath
"set runtimepath+=~/.vim

" 不再发出“哔哔”声
" "set vb t_vb=" 应该设置在 ".gvimrc"中才能生效，因为 Vim 在启动 GUI 时，重置
" 了 t_vb 的值，使用 au 在 GuiEnter 时设置；
autocmd! GuiEnter * set vb t_vb=

set nospell         " 关闭拼写检查（开启：spell）
set hidden          " 允许不保存而切换 buffer

set autochdir       " 自动切换工作目录，以当前打开的文件的目录为准
set autoindent      " 打开自动缩进
set smartindent
set nobackup        " 缺省不产生备份文件（否：backup）
set showmatch       " 在输入括号时光标短暂地跳到与之相匹配的括号处，不影响输入
set autoread        " 如果一个文件在vim之外被修改，自动读取
set lazyredraw      " 在执行@宏的时候，不重画；强制重画时用 :redraw
                    " XXX 此选项与 pydiction 冲突；
                    " XXX 可能与其他 “自动补全” 的设置冲突

set updatecount=200     " updatecount：键入200个字符后，保存 swp 文件
set updatetime=60000    " updatetime：60000milliseconds 后自动保存
set undolevels=200      " updolevels：只允许 200 次 uodo，默认win32为1000
set history=400         " 记录历史行数

"使光标保持在中央位置
"set sidescrolloff=     " 当设置了 nowarp 时，设置屏幕左右的 columns
set scrolloff=3         " scrolloff：上下移动时, 不保留最上最下 n 行不动
                        " h l 都不能直接到屏幕的这 2 行

set nostartofline       " 换页时不要调到行的第一个字符
set ttyfast         " smoother changes

" 设置 viminfo
set viminfo='10,\"100,:20,%,n~/.viminfo

set fileformats=unix,dos,mac

" 下面两个选项实现每行80字符后自动断行
set nowrap                " 自动换行，不换行为 nowrap
" set showbreak=>
" set textwidth=78        " 行宽
" set formatoptions+=mMb  " 正确地处理中文字符的折行和拼接

"当光标在一行的第一个/最后一个字符位置的时候，允许光标可以继续move的keys
set whichwrap+=h,l,b,s,[,],<,>
set backspace=indent,eol,start      " 设置 backspace 键

" 存盘时自动去掉行尾的空格
"au BufWrite * exec 'norm my' | %s/\s\+$//ge | norm `y

" 再次打开前次使用的文件, 自动到上次的光标位置
au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ exe "norm g`\"" |
        \ endif

" win32下粘贴设置
if has('win32')
  se cb+=unnamed      " 这样在 windows 下使用很方便
                      " * 和 + 都是系统剪切板
endif

" 查询设置（Search） {{{2
"=============================================================================
set ignorecase      " Search 时，对大小写的匹配设置
set incsearch
set magic           " 正则表达式
                    " magic(\m)：除了 $ . * ^ 之外其他元字符都要加反斜杠。
                    " nomagic(\M)：除了 $ ^ 之外其他元字符都要加反斜杠。
set hlsearch        " 高亮 Search 的东西


" 编码设置 {{{2
" ===========================================================================
" ucs-bom是unicode编码的一种，类似utf8，
" 将其和utf8放在最前面是因为，vim在试图用ucs-bom或utf-8来读文件的时候，
" 如果发现错误则选用后续编码来读文件，
" 而vim却不能根据gbk和gb18030进行错误识别。
" 没有gb2312？因为在vimrc中设置gb2312根本没用
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,chinese,GBK

" 当 encoding 设为 utf-8 时，命令栏中的提示消息会出问题，用这个可以改善一些
language messages zh_CN.utf-8

" 判断 Vim 是否包含多字节语言支持，并且版本号大于 6.1
if has('multi_byte') && v:version > 601
    " 如果 Vim 的语言（受环境变量 LANG 的影响）是中文（zh）、日文（ja）
    " 或韩文（ko）。将模糊宽度的 Unicode 字符的宽度设置为双宽度（double）
    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
endif

" 鼠标设置 {{{2
"=============================================================================
" 如果 gVim 支持鼠标，则启用鼠标支持
set mousehide

if has('mouse')
    set mouse=a
endif

" 不使用鼠标中键
map  <MiddleMouse> <Nop>
map! <MiddleMouse> <Nop>

" 鼠标右键为粘贴
ino <RightMouse> <Esc>gP
vno <RightMouse> y


"== 2. 界面设置 == {{{1
"=============================================================================
" let g:solarized_style = "dark"
" color solarized      " 配色方案Olivia
color olivia

syntax enable       " 使用语法高亮
" Solarized VIM
set t_Co=256
" set background=dark
" colorscheme solarized
" let g:molokai_original = 1
set cursorline      " 高亮当前行


set number          " 显示行号(否：nonumber）
set numberwidth=4
"set ruler          " 显示标尺
set cmdheight=1     " commandbar 高度为1
set splitbelow      " splitbelow：新的 split 窗口放在下面
set wildmenu

set linespace=2     " 设置行间距
" set fillchars=stlnc:=,fold:.

" GUI 设置 {{{2
"=============================================================================
if has("gui_running")
    set guioptions-=m   " 不显示 Menu bar
    set guioptions-=T   " 不显示 Toolbar
    set guioptions-=l   " 不显示左边的 scrollbar
    set guioptions-=L   " split window 时也不显示左边的 scrollbar
    set guioptions-=r   " 不显示右边的 scrollbar
    set guioptions-=R   " split window 时也不显示右边的 scrollbar
    set guifont=Monaco:h12
    " set guifontwide=Hei:h11
    set showtabline=1
    set lines=80
    set columns=120
endif

"  开启vim时，窗口的大小和位置 {{{2
winpos  250 02      " 窗口位置
"win    120 80      " 窗口大小，超出显示器大小，则用屏幕大小 [Obsolete]

" Status Line {{{2
"=============================================================================
" 总是显示 Status line
set laststatus=2    " 0 永远不显示 status line；
                    " 1 至少有两个分切开的窗口时；
                    " 2 总是显示 status line

" 格式化 Status line
set statusline =
            \%-([%n]%m[\%f][%<%{expand('%:p:h')}]%)
            \%=
            \%(%4l\ %3v\ %3p%%\ %4LL\ \ [0x%04B]\ [%{&ff}][%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\"[BOM]\":\"\")}]%y%r%)

" Tab 设置 {{{2
"=============================================================================
set switchbuf=usetab

" 字体设置 {{{2
"=============================================================================
if has("win32")
    set guifont=Consolas:h8:cANSI
    "set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
    "set guifont=Courier_New\ Monospace\ Bitstream\ Vera\ Sans\h12:cANSI
    set guifontwide=YaHei_Mono:h8:cGB2312
endif


"== 3. 编程设置 == {{{1
"=============================================================================
" 自动检测文件类型并加载相应的设置
filetype plugin indent on

" 显示 TAB 和 行尾空格
set  list
set  listchars =tab:>-,trail:-

" tabs和空格
set softtabstop=4       " softtabstop 显示 TAB 为 4
set tabstop=4           " tabstop 实际 TAB 为 4
set shiftwidth=4        " shiftwidth TAB 移动为 4
set expandtab           " 把 TAB 转成 空格
set smarttab

" 代码补全 {{{2
"=============================================================================
" set completeopt=longest,menu
"set complete=.,w,b,u,t,i,s
set infercase   " 保留键入部分的大小写（在ignorecase设置了的前提下）

" thesaurus 补全
"set thesaurus+=~/vimfiles/mthesaur.txt "这个太大了，很慢很慢
"set thesaurus+=~/vimfiles/dictionary/mythesaurus.txt

" turn on Omni completion
"autocmd FileType c set ofu=ccomplete#Complete
"autocmd FileType php set ofu=phpcomplete#CompletePHP
"autocmd FileType python set omnifunc=pysmell#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set ofu=xmlcomplete#CompleteTags

" python {{{2
autocmd FileType python set nowrap nolazyredraw

" :make - 查看语法错误
" :cnext - 下一个错误
" F9 运行当前脚本
autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
autocmd BufRead *.py map! <F9> :w<CR> :!python %<CR>

"== 4. 键盘映射 == {{{1
"=============================================================================
set winaltkeys=no       " 不要让 ALT 键控制菜单，让 ALT 键可设置映射
if has("gui_running")
    set macmeta
endif
set clipboard=unnamed

"let mapleader='\'
"let g:mapleader="\"
let maplocalleader=","

map! <M-m> <Esc>
ino  <M-q> <Esc>:q<CR>
nno  <M-q>      :q<CR>

" files & buffers {{{2
"=============================================================================
" 浏览当前目录
"-----------------------------------------------------
nno <M-e> :Sex<CR>
ino <M-e> <Esc>:Sex<CR>

" 载入 _vimrc, 用 filet detect 是因为上面 all& 会置空 ft
"-----------------------------------------------------
" cno <Leader>ss :so ~/.vimrc<Bar>filet detect<CR>

" 打开编辑 .vimrc
"-----------------------------------------------------
" nno <Leader>vc :e ~/.vimrc<CR>
" nno <Leader>vt :e ~/vimtip<CR>

" 打开 Buffer
"-----------------------------------------------------
map <M-b> :buffers<CR>
map! <M-b> <Esc>:buffers<CR>

" 关闭 buffer, 如果是未命名的强制关掉
"-----------------------------------------------------
nno <silent><C-q> :if expand('%') == ''<Bar>bw!<Bar>else<Bar>bw<Bar>endif<CR>

" 在 buffer 之间移动
"-----------------------------------------------------
ino <C-TAB> <Esc>:bn<CR>
nno <C-TAB>      :bn<CR>
ino <S-TAB> <Esc>:bp<CR>
nno <S-TAB>      :bp<CR>

nno <M-j> :bn<CR>
nno <M-k> :bp<CR>

" function Maps {{{2
" ============================================================================
" Y 从当前复制到行尾
nno Y y$

" 在当前文件中快速查找光标下的单词
nmap <leader>sw :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>

" 切换高亮
" ----------------------------------------------------
" 如果设成 n/ 则和 n 有冲突, 所以 vim 会等待一会儿,
" 看是否有新的输入
" <Bar> 就是 | 但不能直接输入, 否则要输入 <CR>:
nno <Leader>/ :se hls!<Bar>se hls?<CR>
nno <Leader>\ :nohls<CR>

" FIXME 所有窗口都 nolist, diff 时有用
" ----------------------------------------------------
"nno <Leader>l :silent windo se list!<Bar>se list?<CR>

" FIXME 禁止触发 BufWrite 事件, 因为上面有保存时去掉行尾空格的设置
" ----------------------------------------------------
nno <Leader>bw :call BufWrite()<CR>

" 全选
"-----------------------------------------------------
ino <M-a> <Esc>ggVG
nno <M-a> ggVG

" 保存
"-----------------------------------------------------
nno <C-S> :up<CR>
ino <C-S> <Esc>:up<CR>
vno <C-S> <C-C>:up<CR>gv

" 插入72个 - " 和 =
"-----------------------------------------------------
ino <M--> <Esc>78a-<Esc>a
nno <M-->      78a-<Esc>a
ino <M-=> <Esc>78a=<Esc>a
nno <M-=>      78a=<Esc>a
ino <M-"> <Esc>78a"<Esc>a
nno <M-">      78a"<Esc>a

" 转化文件格式
"-----------------------------------------------------
" nmap <leader>fd :set ff=dos<CR>
nmap <leader>fu :set ff=unix<CR>

" 格式化文本快捷键 typeset
"-----------------------------------------------------
map! <M-t>  <Esc>gqapa
map  <M-t>       gqap
map! <M-t>a <Esc>gggqGa
map  <M-t>       gggqG

" 计算文本字数
"-----------------------------------------------------
map! <M-w> <Esc>g<C-G>a
map  <M-w>      g<C-G>

" 插入当前日期+时间
"--------------------------------------------------------------
nno <leader>d a<C-R>=strftime('%Y-%m-%d %H:%M:%S')<Esc><Esc>
"ino <leader>d  <C-R>=strftime('%Y-%m-%d %H:%M:%S')<CR>

" [insert] smartkey {{{2
"=============================================================================
ino <M-h> <LEFT>
ino <M-l> <RIGHT>
ino <M-j> <DOWN>
ino <M-k> <UP>

ino <M-d> <DELETE>
ino <M-w> <HOME>
ino <M-e> <END>

ino <M-g> <backspace>

ino <C-b> <LEFT>
ino <C-f> <RIGHT>
ino <C-h> <LEFT>
ino <C-l> <RIGHT>
ino <C-n> <DOWN>
ino <C-j> <DOWN>
ino <C-p> <UP>
ino <C-k> <UP>

ino <C-d> <DELETE>
ino <C-a> <HOME>
ino <C-e> <END>

ino <M-g> <backspace>
"nno <C-d> <DELETE>
"nno <C-a> <HOME>
"nno <C-e> <END>
"cno <C-D> <Del>

" tabs {{{2
"------------------------------------------------------
map <leader>tt  :tabnew<CR>
map <leader>ttt :tabnew %<CR>

map <leader>tc :tabclose<CR>

map <leader>tn :tabn<CR>
map <leader>tp :tabp<CR>

nno <M-h> :tabp<CR>
nno <M-l> :tabn<CR>
nno <M-n> :tabnew<CR>
nno <M-c> :tabclose<CR>

map <M-1> :tabfirst<CR>

map <leader>tf :tabfir<CR>
"map <leader>tl :tabl<CR>   "设给 taglist 了

map <leader>te :tabedit

" code {{{2
" ============================================================================
" 用 #if 0 ... #endif 注释掉 1 块代码
" vno <Leader>ci      mcO<Esc>O<Esc>S#if 0<Esc>`co<Esc>S#endif<Esc>gvO
" 用 // 注释掉列选的代码
" vno <Leader>c/      mcI// <Esc>gvO

" 和下一个单词交换位置
"     yiw 用来找单词开始位置, "_ 是 nul 寄存器
"     <C-O> 用来恢复开始位置, 否则位置是行首 ^
"     <C-L> 用来刷新屏幕下的提示信息
nno <Leader>xw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<CR><C-O>:nohls<CR><C-L>

" 和 buffer # 做 diff
nno <Leader>d# :vert diffs #<CR>

" duplicate line show, 高亮相同的 2 行
nno <Leader>ds /^\(.*\)\n\1\n<CR>

" duplicate line del, 删除相同的 2 行
nno <Leader>dd :g/^/ call DelDupLine()<CR>

" join blank line 多个 空行  合成一个
nno <Leader>jb GoZ<Esc>:g/^$/.,/./-j<CR>Gdd

" join space line 多个 空白行合成一个
nno <Leader>js GoZ<Esc>:g/^[ <Tab>]*$/.,/[^ <Tab>]/-j<CR>Gdd

" 按选中内容搜索, 按普通文本
"     注意: nno  用 <Leader>/ 来 :se nohls
vno <Leader>/ y<Esc>/\V<C-R>=substitute(escape(@",'/\'),"\n","\\\\n","g")<CR>/<CR>
" ---)---

" 在 preview tag 窗口显示定义, 不用 au CursorHold
"     原来 i_Ctrl-] 是自动补齐, 但不加空格
"     暂时用在这里
" ino  <C-]>    <left><left><C-O>:call PreviewWord()<CR><right><right>
" ino  <S-F9>               <C-O>:pc<CR>

" 缺省是 :redr!, 这个先清除, 再 redraw, 屏幕会晃一下
" ino     <C-L>      <Esc>:redr<CR>
" nno     <C-L>           :redr<CR>

" 选中的区域 可以无限的 < >, gv 是再次选中刚才的区域
"     注意按 > 后, 要 u 回来, 得先按 <Esc>, 取消选中的区域,
"     否则是选中区域小写
vno < <gv
vno > >gv

" 选中的区域按 <Leader>y 后, 仍然是选中的
"     <Leader>p 后, * 里仍然是要粘贴的内容
vno <Leader>y ygv
vno <Leader>p <Esc>:let @c=@*<CR>gvp:let @*=@c<CR>


" F2 ~ F10 {{{2
"=============================================================================
" F2 打开文件编辑
ino <F2> <Esc>:bro e<CR>
nno <F2>      :bro e<CR>

" F3 浏览目录, 在 vim 里
ino <F3> <Esc>:Explore<CR>
nno <F3> :Explore<CR>

" F4 打开控制台
if has('gui_win32')
    imap <F4> <Esc>:!start cmd.exe<CR>
    nmap <F4>      :!start cmd.exe<CR>
endif

" 按 F5, 因为 linebreak 和 list 有关联
" Lookupfiles 使用次 hotkey
"ino <F5> <Esc>:se wrap!<Bar>se wrap?<CR>
"nno <F5>      :se wrap!<Bar>se wrap?<CR>

" F6 清除 TAB 和 行尾的空格, 注意字符串内的 TAB 也被处理掉
ino <F6> <Esc>:%retab<Bar>%s/\s\+$//g<CR>``a
nno <F6>      :%retab<Bar>%s/\s\+$//g<CR>``

" 去掉行尾的 ^M 字符
ino <S-F6> <Esc>:%s/\r$//g<CR>``a
nno <S-F6>      :%s/\r$//g<CR>``

" 按 F7 插入日期
nno <F7>      a<C-R>=strftime('%Y-%m-%d %H:%M:%S')<Esc><Esc>
ino <F7>       <C-R>=strftime('%Y-%m-%d %H:%M:%S')<CR>

" F8 插入注释
ino <F8> <Esc>0i/*<CR><Esc>0C*/<Esc>O<Esc>0C<Esc>012a=<Esc>yypO
nno <F8> <Esc>0i/*<CR><Esc>0C*/<Esc>O<Esc>0C<Esc>012a=<Esc>yypO

" F9
" 运行 python
" F10

" F11 全屏窗口
if has('gui_win32')
    map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
endif

" 恢复默认颜色配置
imap <C-F12> <Esc>:hi clear<Bar>colo default<CR>
nmap <C-F12>      :hi clear<Bar>colo default<CR>

"== 5. 扩展插件 == {{{1
"=============================================================================
" UTL {{{2
nno <leader>u :Utl<CR>
" taglist {{{2
"-----------------------------------------------------
let Tlist_Ctags_Cmd = "D://programs/code/ctags58/ctags.exe"
let Tlist_Show_One_File     = 1     " 不同时现实多个文件的tag，只显示当前文件的tags
let Tlist_Exit_OnlyWindow   = 1     " 当 taglist 窗口为最后一个窗口时，退出 vim
let Tlist_Use_Right_Window  = 0     " 右侧窗口中显示 taglist

map <silent> <leader>tl :TlistToggle<CR>

" FuzzyFinder(fuf) ~ {{{2
" v4.2.2 2010-09-30
" Required: L9 Library
"-----------------------------------------------------
let g:fuf_modesDisable = []
let g:fuf_previewHeight = 0
let g:fuf_enumeratingLimit = 20
let g:fuf_bookmark_searchRange = 0      " Bookmark
let g:fuf_abbrevMap = {
      \   '^vr:' : map(filter(split(&runtimepath, ','), 'v:val !~ "after$"'), 'v:val . ''/**/'''),
      \   '^vi:' : [ '~/vimfiles/' ],
      \ }
let g:fuf_mrufile_maxItem = 20
let g:fuf_mrucmd_maxItem = 20

nno <leader>fe       :FufBuffer<CR>
nno <leader>ff       :FufFile<CR>
nno <leader>fv       :FufBookmarkFile<CR>
nno <leader>fba      :FufBookmarkFileAdd
nno <leader>fd      :FufBookmarkDir<CR>
nno <leader>fbda     :FufBookmarkDirAdd<CR>
nno <leader>fm       :FufMruFile<CR>
nno <leader>fc       :FufMruCmd<CR>
nno <leader>ft       :FufTag<CR>
nno <leader>ftf      :FufTaggedFile<CR>
nno <leader>fj       :FufJumpList<CR>
nno <leader>fq       :FufQuickfix<CR>
nno <leader>fl       :FufLine<CR>
nno <leader>fh       :FufHelp<CR>
nno <leader>fr       :FufRenewCache<CR>

" Tabular {{{2
" 对齐工具
"
nno <leader>c  :Tab /

" NERD_tree config {{{2
" v4.1.0 2009-12-01
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\.bak$', '\~$']
let NERDTreeShowBookmarks=1

" NERD_commenter {{{2
" v2.3.0 2010-12-07
let NERDSpaceDelims = 1
let NERDRemoveExtraSpaces = 1

" NeoComplCache {{{2
" 5.3 2010-12-10
" let g:acp_enableAtStartup = 0
" let g:neocomplcache_enable_at_starup = 1
" let g:neocomplcache_enable_smart_case = 1
" let g:neocomplcache_enable_auto_select = 1
" let g:neocomplcache_enable_camel_case_completion = 1
" let g:neocomplcache_enable_underbar_completion = 1

" " Set minimum syntax keyword length. 
" let g:neocomplcache_min_syntax_length = 3
" let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" " Set minimum keyword length. 
" let g:neocomplcache_min_keyword_length = 3

" SuperTab Continued{{{2
" 1.1 2010-09-27
" let g:SuperTabDefaultCompletionType = '<C-X><C-U> '

" pydiction {{{2
" 1.2 2009-07-25
" let g:pydiction_location = '~/vimfiles/ftplugin/pydiction/complete-dict'

" OVT(out line) {{{2
"-----------------------------------------------------
autocmd FileType otl set nowrap textwidth=0 fo=croql
let otl_install_menu=0
let no_otl_maps=0
let no_otl_insert_maps=0
let otl_bold_headers=1

" NERDTree {{{2
" 4.1.0 2009-12-01
"------------------------------------------------------
nno <leader>nt :NERDTree<CR>

" ShowFunc {{{2
" 1.5.8 2009-07-27
" map <C-f> <plug>ShowFunc
" map! <C-f> <plug>ShowFunc

" EasyMotion {{{2
" 1.3

" surround {{{2
" 1.90 2010-03-06
"
" matchit {{{2
" 1.13.2 2008-01-29

" vim-pathogen {{{2
call pathogen#infect()

" VimRoom {{{2
let g:vimroom_background="black"
let g:vimroom_width=120

" Indent Guides {{{2
" 1.5 2011-03-13
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1
let g:indent_guides_color_change_percent = 5
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

" vim-powerline {{{2
let g:Powerline_symbols = 'fancy'

" camelcasemotion
" 1.52 2011-11-12


" {{{1
" -- EOF --
