
" 矢野さんの設定、文字コード設定をいったんコメントアウト
set encoding=utf-8
set fileencoding=utf-8



""----------------------------------------------------
"" 文字コード
""----------------------------------------------------
"" 文字コードの自動認識
"if &encoding !=# 'utf-8'
"  set encoding=japan
"  set fileencoding=japan
"endif
"if has('iconv')
"  let s:enc_euc = 'euc-jp'
"  let s:enc_jis = 'iso-2022-jp'
"  " iconvがeucJP-msに対応しているかをチェック
"  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
"    let s:enc_euc = 'eucjp-ms'
"    let s:enc_jis = 'iso-2022-jp-3'
"  " iconvがJISX0213に対応しているかをチェック
"  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
"    let s:enc_euc = 'euc-jisx0213'
"    let s:enc_jis = 'iso-2022-jp-3'
"  endif
"  " fileencodingsを構築
"  if &encoding ==# 'utf-8'
"    let s:fileencodings_default = &fileencodings
"    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
"    let &fileencodings = &fileencodings .','. s:fileencodings_default
"    unlet s:fileencodings_default
"  else
"    let &fileencodings = &fileencodings .','. s:enc_jis
"    set fileencodings+=utf-8,ucs-2le,ucs-2
"    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
"      set fileencodings+=cp932
"      set fileencodings-=euc-jp
"      set fileencodings-=euc-jisx0213
"      set fileencodings-=eucjp-ms
"      let &encoding = s:enc_euc
"      let &fileencoding = s:enc_euc
"    else
"      let &fileencodings = &fileencodings .','. s:enc_euc
"    endif
"  endif
"  " 定数を処分
"  unlet s:enc_euc
"  unlet s:enc_jis
"endif
"" 日本語を含まない場合は fileencoding に encoding を使うようにする
"if has('autocmd')
"  function! AU_ReCheck_FENC()
"    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
"      let &fileencoding=&encoding
"    endif
"  endfunction
"  autocmd BufReadPost * call AU_ReCheck_FENC()
"endif
" 改行コードの自動認識
"set fileformats=unix,dos,mac
"" □とか○の文字があってもカーソル位置がずれないようにする
"if exists('&ambiwidth')
"  set ambiwidth=double
"endif
"----------------------------------------------------
" 基本的な設定
"----------------------------------------------------
" viとの互換性をとらない(vimの独自拡張機能を使う為)
set nocompatible
" 改行コードの自動認識
set fileformats=unix,dos,mac
" ビープ音を鳴らさない
set vb t_vb=
" バックスペースキーで削除できるものを指定
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

"----------------------------------------------------
" バックアップ関係
"----------------------------------------------------
" バックアップをとらない
set nobackup
" ファイルの上書きの前にバックアップを作る
" (ただし、backup がオンでない限り、バックアップは上書きに成功した後削除される)
set writebackup
" バックアップをとる場合
"set backup
" バックアップファイルを作るディレクトリ
"set backupdir=~/backup
" スワップファイルを作るディレクトリ
"set directory=~/swap

"----------------------------------------------------
" 検索関係
"----------------------------------------------------
" コマンド、検索パターンを100個まで履歴に残す
set history=100
" 検索の時に大文字小文字を区別しない
set ignorecase
" 検索の時に大文字が含まれている場合は区別して検索する
"set smartcase
" 最後まで検索したら先頭に戻る
set wrapscan
" インクリメンタルサーチを使わない
set noincsearch

"----------------------------------------------------
" 表示関係
"----------------------------------------------------
" タイトルをウインドウ枠に表示する
" set title
" 行番号を表示
set number
" ルーラーを表示
set ruler
" タブ文字を CTRL-I で表示し、行末に $ で表示する
"set list
" 入力中のコマンドをステータスに表示する
set showcmd
" ステータスラインを常に表示
set laststatus=2
" 括弧入力時の対応する括弧を表示
set showmatch
" 対応する括弧の表示時間を2にする
" set matchtime=2
" シンタックスハイライトを有効にする
syntax on
" 検索結果文字列のハイライトを有効にする
set hlsearch
" コメント文の色を変更
highlight Comment ctermfg=DarkCyan
" コマンドライン補完を拡張モードにする
set wildmenu

" 入力されているテキストの最大幅
" (行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=0
" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray

" Errorが出るのでコメントアウト
"match ZenkakuSpace /　/

" ステータスラインに表示する情報の指定
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=<%l/%L:%p%%>
" ステータスラインの色
highlight StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white

"----------------------------------------------------
" インデント
"----------------------------------------------------
" オートインデントを無効にする
"set noautoindent
" タブが対応する空白の数
set tabstop=4
" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
set softtabstop=4
" インデントの各段階に使われる空白の数
set shiftwidth=4
" タブを挿入するとき、代わりに空白を使わない
set noexpandtab

"----------------------------------------------------
" オートコマンド
"----------------------------------------------------
"if has("autocmd")
    " ファイルタイプ別インデント、プラグインを有効にする
"    filetype plugin indent on
    " カーソル位置を記憶する
"    autocmd BufReadPost *
"        \ if line("'\"") > 0 && line("'\"") <= line("$") |
"        \   exe "normal g`\"" |
"        \ endif
"endif

"----------------------------------------------------
" その他
"----------------------------------------------------
" バッファを切替えてもundoの効力を失わない
set hidden
" 起動時のメッセージを表示しない
set shortmess+=I
" 横線の表示
""set cursorline
" 縦線の表示
"set cursorcolumn




"***** MATO Setting *****"


" タブ分割した際の色
hi TabLineSel  term=bold cterm=bold,underline ctermfg=LightGray ctermbg=DarkBlue gui=bold,underline guifg=LightGray guibg=DarkBlue
hi TabLine term=reverse cterm=underline ctermfg=Black ctermfg=Gray ctermbg=black gui=underline guifg=Black guibg=gray
hi TabLineFill term=reverse cterm=reverse,bold ctermfg=LightGray ctermbg=black gui=reverse,bold guifg=LightGray guibg=black

" 辞書機能 -> 変な動きする……
"inoremap <C-m> <Nop>
"inoremap <C-m> <C-x><C-k>
"au FileType php :set dictionary=~/.vim/dict/php.dict
set dictionary=~/.vim/dict/php.dict

" 現在行の番号を分かりやすく
set cursorline
hi clear CursorLine
hi CursorLineNr term=bold cterm=NONE ctermfg=darkgreen ctermbg=NONE

" CURSOL
let &t_SI .= "\e[3 q"
let &t_EI .= "\e[1 q"

" オートインデントを有効にする
set autoindent
set smartindent " これやらないと効かなかった！

" 記録するコマンド数
set history=200

" ファイルを開く時にリスト表示
set wildmenu wildmode=list:full

" Comment color
""hi Comment ctermfg=darkgray

" Windowsだと上手く動かない
""colorscheme railscasts

" カッコの自動補完
inoremap { {}<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap < <><Left>
inoremap ' ''<Left>
inoremap " ""<Left>
" 試行錯誤した結果のカッコ内改行 (<CR> だけなぜか1文字ずれる
" 環境変わるたびに微調整しないとダメかも
inoremap {<CR> {<CR>}<Esc><S-o><Backspace><TAB>
inoremap (<CR> (<CR>)<Esc><S-o><Backspace><TAB><TAB>
inoremap [<CR> [<CR>]<Esc><S-o><Backspace><TAB>
inoremap <<CR> <<CR>><Esc><S-o><Backspace><TAB>

" 中に文字がいらない時
inoremap "" ""
inoremap '' ''
inoremap () ()
inoremap [] []
inoremap <> <>

" PHPのアロー演算子
inoremap -^ ->
inoremap =~ =>

"HTML&CSSのコメント
inoremap <!- <!--  --><Left><Left><Left><Left>
inoremap <!! <!--  --><Left><Left><Left><Left>
inoremap /* /*  */<Left><Left><Left>
inoremap /*<CR> /*<CR><CR><Esc>i */<Esc><Up>i<TAB>



" undo & redo,　Ctrl+r じゃなくてただのrでredoする
nnoremap r <C-r>

" daw : delete a word カーソル位置の単語を削除（神）
nnoremap da daw
nnoremap ca caw

" カーソル位置の「単語」を大文字小文字を逆に
nnoremap gau g~aw
" カーソル位置の「文字」を大文字小文字を逆に(giは使われてた)
""nnoremap giu ~

" 行内での先頭、末尾までの削除
nnoremap dh d0
nnoremap dl d$

" <br>を多用するので登録してみる
" (インデント修正アリナシどっちがいいのか分かんない)
nnoremap <B A<br><Esc>==

" TAB分割
" sなんとかだと操作しやすいらしいので、sだけを無効化->登録
nnoremap s <Nop>
" 新しいTAB、次TAB、前TAB
nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sp gT

" 画面内移動するのに覚えやすいように登録
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>
nnoremap <S-j> <C-f>
nnoremap <S-k> <C-b>
nnoremap <C-h> ^
nnoremap <C-l> $

" 検索した後のハイライトを消すやつ
nnoremap <Esc><Esc> :nohlsearch<CR>

" xでの削除でヤンクが上書きされないように
noremap PP "0p
noremap x "_x


" 閉じタグ補完
augroup MyXML
	autocmd Filetype xml inoremap <buffer> </ </<C+x><C-o>
	autocmd Filetype xml inoremap <buffer> << </<C+x><C-o>
	autocmd Filetype html inoremap <buffer> </ </<C+x><C-o>
	autocmd Filetype html inoremap <buffer> << </<C+x><C-o>
	autocmd Filetype ctp inoremap <buffer> </ </<C+x><C-o>
	autocmd Filetype ctp inoremap <buffer> << </<C+x><C-o>
augroup END

" カッコ内のインデント
""function! IndentBraces()
""	let nowletter = getline(".")[col(".")-1]
""	let beforeletter = getline(".")[col(".")-2]
""
""	if nowletter == "}" && beforeletter == "{}"
""		return "\n\t\n<UP>\<RIGHT>"
""	else
""		return "\n"
""	endif
""endfunction
""inoremap <silent> <expr> <CR> IndentBraces()


" コピペする際に多用するので短く
command SP :set paste
command SNP :set nopaste


" Plugin

" NeoBundle
set nocompatible
filetype plugin indent off

if has('vim_starting')
	if &compatible
		set nocompatible
	endif

	set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))
	NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()

" Unite
call neobundle#begin(expand('~/.vim/bundle/'))
	NeoBundle 'Shougo/unite.vim'
	NeoBundle 'Shougo/neomru.vim'
call neobundle#end()
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_source_file_mru_limit=200
nnoremap ,uf :Unite file<CR>
nnoremap ,ub :Unite buffer<CR>
nnoremap ,um :Unite file_mru<CR>
nnoremap ,uu :Unite buffer file_mru<CR>

" Uniteから抜ける
au FileType unite nnoremap <silent> <buffer> <Esc><Esc>q
au FileType unite inoremap <silent> <buffer> <Esc><Esc> <Esc>q

" 謎の修正
syntax on
hi Comment ctermfg=darkcyan
