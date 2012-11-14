" Vim color file
" FileName:  Olivia
" Maintainer:  JK
" Reference: desert,desertEx,twilight,vividchalk
" LastChange: 2011-03-31 15:19:11
"====================================================================
"
set background=dark

hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name="Olivia"

let s:darkgrey = '#1a1a1a'

"hi Normal guifg=#fffedc guibg=#1a1a1a gui=NONE
" hi Normal guifg=#d3daed guibg=#1a1a1a gui=NONE

hi Normal guifg=#dcdccc guibg=grey17 gui=none

" 7.0以上版本才有的功能（光标所在行，Tab，自动补全）
if v:version >= 700
  hi CursorLine     gui=NONE  guibg=#3e3e3e  guifg=NONE
  hi CursorColumn   gui=NONE  guibg=#3e3e3e  guifg=NONE
  hi MatchParen     gui=bold  guibg=#80a090  guifg=white

  "Tabpages
  hi TabLine        gui=underline  guibg=#202020  guifg=#a09998
  hi TabLineFill    gui=underline  guibg=#202020  guifg=#a09998
  hi TabLineSel     gui=underline  guibg=#404850  guifg=#a09998

  "P-Menu (auto-completion)
  hi Pmenu          gui=NONE  guibg=#303030  guifg=gold
  hi PmenuSel       gui=bold  guibg=#2261a1  guifg=white
  hi PmenuSbar      gui=NONE  guibg=gray30   guifg=NONE
  hi PmenuThumb     gui=NONE  guibg=gold     guifg=NONE
endif

" highlight groups
hi Cursor       cterm=NONE          ctermbg=White     ctermfg=Black           gui=bold,reverse      guibg=NONE        guifg=yellow
hi ErrorMsg     cterm=bold          ctermbg=1         ctermfg=7               gui=NONE      guibg=red           guifg=white
hi VertSplit    cterm=reverse       ctermbg=NONE      ctermfg=NONE            gui=NONE      guibg=gray40        guifg=gray40
hi Folded       cterm=NONE          ctermbg=NONE      ctermfg=yellow          gui=italic    guibg=#1a1a1a       guifg=#cc852e
hi FoldColumn   cterm=NONE          ctermbg=NONE      ctermfg=darkgrey        gui=NONE      guibg=#1a1a1a       guifg=orange
hi IncSearch    cterm=NONE          ctermbg=green     ctermfg=yellow          gui=NONE      guibg=#2050d0       guifg=#b0ffff
hi LineNr       cterm=NONE          ctermbg=NONE      ctermfg=3               gui=NONE      guibg=black         guifg=burlywood3
hi ModeMsg      cterm=NONE          ctermbg=NONE      ctermfg=brown           gui=NONE      guibg=NONE          guifg=SkyBlue
hi MoreMsg      cterm=NONE          ctermbg=NONE      ctermfg=darkgreen       gui=NONE      guibg=NONE          guifg=SeaGreen
hi NonText      cterm=bold          ctermbg=NONE      ctermfg=darkblue        gui=NONE      guibg=grey17        guifg=#605958
hi Question     cterm=NONE          ctermbg=NONE      ctermfg=green           gui=NONE      guibg=NONE          guifg=springgreen
hi Search       cterm=NONE          ctermbg=blue      ctermfg=grey            gui=bold      guibg=#71d3b4       guifg=#233323
hi SpecialKey   cterm=NONE          ctermbg=NONE      ctermfg=darkgreen       gui=bold      guibg=NONE          guifg=cyan
hi StatusLine   cterm=bold,reverse  ctermbg=NONE      ctermfg=NONE            gui=bold      guibg=#C2BFA5       guifg=black
hi StatusLineNC cterm=reverse       ctermbg=NONE      ctermfg=NONE            gui=NONE      guibg=gray40        guifg=grey
hi Title        cterm=NONE          ctermbg=NONE      ctermfg=5               gui=NONE      guibg=NONE          guifg=indianred
hi Visual       guifg=NONE guibg=NONE gui=reverse
hi VisualNOS    guifg=NONE guibg=#0066ff gui=reverse
hi WarningMsg   cterm=NONE          ctermbg=NONE      ctermfg=1               gui=NONE      guibg=NONE          guifg=salmon
hi WildMenu     cterm=NONE          ctermbg=3         ctermfg=0               gui=NONE      guibg=gray17        guifg=gray
hi MatchParen   cterm=NONE          ctermbg=NONE      ctermfg=NONE            gui=bold      guibg=NONE          guifg=cyan
hi DiffAdd      cterm=NONE          ctermbg=4         ctermfg=NONE            gui=NONE      guibg=wheat1        guifg=black
hi DiffChange   cterm=NONE          ctermbg=5         ctermfg=NONE            gui=NONE      guibg=skyblue1      guifg=black
hi DiffText     cterm=bold          ctermbg=NONE      ctermfg=4               gui=NONE      guibg=hotpink1      guifg=black
hi DiffDelete   cterm=bold          ctermbg=6         ctermbg=1               gui=NONE      guibg=gray45        guifg=black
hi Directory    ctermfg=darkcyan    ctermbg=NONE      ctermfg=6               gui=NONE      guibg=NONE          guifg=Skyblue
hi Regexp       cterm=NONE          ctermbg=NONE      ctermfg=DarkCyan        gui=NONE      guibg=NONE          guifg=#44B4CC

" syntax highlighting groups
hi Comment      cterm=NONE           ctermbg=NONE      ctermfg=darkcyan        gui=italic    guibg=NONE          guifg=#676e70
hi Constant     cterm=NONE          ctermbg=NONE      ctermfg=brown           gui=NONE      guibg=NONE          guifg=#d2ff00
hi Identifier   cterm=NONE          ctermbg=NONE      ctermfg=6               gui=bold      guibg=NONE          guifg=#70d080
hi Function     cterm=NONE          ctermbg=NONE      ctermfg=NONE            gui=bold      guibg=NONE          guifg=Skyblue
hi Statement    cterm=NONE          ctermbg=NONE      ctermfg=3               gui=bold      guibg=NONE          guifg=#FF6600
hi String       cterm=NONE          ctermbg=NONE      ctermfg=LightGreen      gui=italic      guibg=NONE          guifg=indianred
hi PreProc      cterm=NONE          ctermbg=NONE      ctermfg=5               gui=NONE      guibg=NONE          guifg=PaleVioletRed2
hi Type         cterm=NONE          ctermbg=NONE      ctermfg=2               gui=NONE      guibg=NONE          guifg=#8CD0D3
hi Special      cterm=NONE          ctermbg=NONE      ctermfg=5               gui=NONE      guibg=NONE          guifg=#ECAD2B
hi Ignore       cterm=NONE          ctermbg=NONE      ctermfg=darkgrey        gui=NONE      guibg=NONE          guifg=grey40
hi Underlined   cterm=underline     ctermbg=NONE      ctermfg=5               gui=NONE      guibg=NONE          guifg=NONE
hi Error        cterm=bold          ctermbg=1         ctermfg=7               gui=NONE      guibg=NONE          guifg=red
hi Boolean         guifg=#dca3a3
hi Character       guifg=#dca3a3 gui=bold
hi Conditional     guifg=#ffae42 gui=bold
hi Tag             guifg=#e89393 gui=bold
hi Structure       guifg=#efefaf gui=bold
hi SpecialChar     guifg=#dca3a3 gui=bold
hi Repeat          guifg=#ffd7a7 gui=bold
hi SpecialComment  guifg=#82a282 gui=bold
hi PreCondit       guifg=#dfaf8f gui=bold
hi Operator        guifg=#f03ed0
hi Number          guifg=#8cd0d3 gui=italic
hi Macro           guifg=#ffcfaf gui=bold
hi Label           guifg=#dfcfaf gui=underline

hi Define          guifg=#ffcfaf gui=bold
hi Delimiter       guifg=#8f8f8f
hi Debug           guifg=#bca3a3 gui=bold

hi Todo         cterm=NONE          ctermbg=NONE      ctermfg=NONE            gui=bold      guibg=yellow2       guifg=orangered
