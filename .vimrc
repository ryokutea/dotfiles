" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
" set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk


" Tab系
" 不可視文字を可視化
set list listchars=tab:>-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅 (SmartIndent での幅)
set shiftwidth=4


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" キーコンフィグ系
" Esc キーは遠いので Ctrl + j に変更する
inoremap <silent> jj <Esc>

" 保存時のアクション
function! s:remove_dust()
    let cursor = getpos(".")
    " 空白のみの行の空白を削除
    %s/^\s\+$//ge
    " 行末の空白を削除
    %s/\s\+$//ge
    " 保存時に tab を 4 スペースに変換する
    %s/\t/    /ge
    call setpos(".", cursor)
    unlet cursor
endfunction
autocmd BufWritePre * call <SID>remove_dust()

" クリップボード共有
set clipboard=unnamedplus

" tmux からの Vim を起動した際の色表示を正常にする
set background=dark
set t_Co=256

" dein Scripts (see: https://qiita.com/delphinus/items/00ff2c0ba972c6e41542)
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
" End dein Scripts-------------------------

" PHP Settings
" $VIMRUNTIME/syntax/php.vim
let g:php_baselib       = 1
let g:php_htmlInStrings = 1
let g:php_noShortTags   = 1
let g:php_sql_query     = 1

" $VIMRUNTIME/syntax/sql.vim
let g:sql_type_default = 'mysql'

" asyncomplete-neosnippet.vim
" neosnippet-snippets
" neosnippet.vim
" asyncomplete-file.vim
" asyncomplete-lsp.vim
" vim-lsp
" asyncomplete.vim
let g:lsp_preview_keep_focus = 0
nmap <silent> <Subleader>N <Plug>(lsp-previous-error)
nmap <silent> <Subleader>n <Plug>(lsp-next-error)
nmap <silent> <Subleader>b <Plug>(lsp-document-diagnostics)
nmap <silent> K <Plug>(lsp-hover)
augroup MyAsyncomplete
    autocmd!
    autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#neosnippet#get_source_options({
    \   'name': 'neosnippet',
    \   'completor': function('asyncomplete#sources#neosnippet#completor'),
    \   'whitelist': ['*'],
    \ }))

    autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \   'name': 'file',
    \   'completor': function('asyncomplete#sources#file#completor'),
    \   'priority': 10,
    \   'whitelist': ['*'],
    \ }))

    autocmd User lsp_setup call lsp#register_server({
    \ 'name': 'php',
    \ 'cmd': {server_info->['node', expand('/usr/local/lib/node_modules/intelephense/lib/intelephense.js'), '--stdio']},
    \ 'initialization_options': {'storagePath': '~/.cache/intelephense'},
    \ 'whitelist': ['php'],
    \ })
augroup END

" vim-quickrun
nnoremap <Leader>run  :<C-u>QuickRun<CR>
nnoremap <Leader>phpf :<C-u>QuickRun<Space>phpfixer<CR>
nnoremap <Leader>phpi :<C-u>QuickRun<Space>phpinfo<CR>
nnoremap <Leader>phpt :<C-u>QuickRun<Space>phpunit<CR>
let g:quickrun_config = {
\    '_': {
\        'hook/close_buffer/enable_empty_data': 0,
\        'hook/close_buffer/enable_failure':    0,
\        'outputter':                           'multi:buffer:quickfix',
\        'outputter/buffer/close_on_empty':     1,
\        'outputter/buffer/split':              ':botright',
\        'runner':                              'job'
\    },
\    'php': {
\        'command':                             'php',
\        'exec':                                '%c %s',
\        'hook/close_buffer/enable_empty_data': 0,
\        'hook/close_buffer/enable_failure':    0,
\        'outputter':                           'buffer',
\        'outputter/buffer/close_on_empty':     0,
\        'outputter/buffer/into':               0,
\        'outputter/buffer/split':              ':botright 7sp'
\    },
\    'phpfixer': {
\        'command':                'php-cs-fixer',
\        'cmdopt':                 'fix',
\        'exec':                   '%c %o %s:p',
\        'outputter':              'buffer',
\        'outputter/buffer/into':  1,
\        'outputter/buffer/split': ':botright 7sp',
\        'runner':                 'system'
\    },
\    'phpinfo': {
\        'command':   'php',
\        'cmdopt':    '-info',
\        'exec':      '%c %o',
\        'outputter': 'buffer'
\    },
\    'phpunit': {
\        'command':   'phpunit',
\        'exec':      '%c %s',
\        'outputter': 'buffer'
\    },
\}

