## TIPS
### 別なキー操作を探る
同じキーや同じ操作を 5 回以上繰り返していると感じたら別のアプローチを探してみる。

### ドットの公式
Vim でトップクラスに重要なコマンド . を効率的に扱えるようにするための公式。
`一回のキーストロークをカーソル移動に、もう一回のキーストロークを何か実行するのに使う`
この形に落とし込めれば、同じ操作をドット一回で再現できる。

### CapsLock キー
別なキーにマッピングしてしまおう。システムレベルでやってしまうのがオススメ。

### Expression レジスタ
もしテキストを書きながら電卓を使いたくなった時に、`Win+r` -> `calc` なんてやってないですよね？
挿入モードで `<C-r>=` で Expression レジスタモードに突入して、式入力 -> `<CR>` で 計算結果を挿入できます。

### コマンドラインモードに貼り付けを行うには？
`"uy{motion}` でレジスタ u (なんでもよい) にヤンクする。
その後、コマンドラインモードで `<C-r>u` で貼り付ける。

### 検索でヒットした数がいくつかを確認する方法
1. `/Takano<CR>` など数を確認したい単語で検索をする
2. `:%s///gn` を実行する (省略してるので前回のパターンがマッチに使われ、最後の n フラグで置換をキャンセルしている)

### ビジュアルモードで選択した範囲を `[range]` に使いたいとき
1. ビジュアルモードで適当な範囲を選択する
2. `:` をおす

## ノーマルモードでのコマンド
| コマンド                                          | 動作                                                                             | 備考                                                            |
| ------------------------------------------------- | -------------------------------------------------------------------------------- | --------------------------------------------------------------- |
| `>G`                                              | 現在の行からファイル末尾までを 1 段インデントする                                |                                                                 |
| `.`                                               | 前回の操作をもう一度実行する                                                     | 超重要！                                                        |
| `f{char}`                                         | 指定した文字を前方検索して、マッチしたらそこまで移動                             | w を連打していると感じたら検討すべし                            |
| `;`                                               | 前回の f{char} コマンドを再実行                                                  |                                                                 |
| `,`                                               | 直前の f{char} コマンドを逆方向に繰り返す                                        | `;` で戻りすぎた際に                                            |
| `*`                                               | カーソル位置にある単語を検索する                                                 | `/{カーソル位置の単語}` のエイリアス                            |
| `zz`                                              | カーソル行が中央にくるように画面を再描画（スクロール）する                       | 挿入ノーマルモードとの併用がオススメ                            |
| `r{char}`                                         | 一文字置換                                                                       |                                                                 |
| `gr{char}`                                        | 仮装置換モードで一文字置換                                                       |                                                                 |
| `R`                                               | 置換モードで挿入モードに入る                                                     | 単に挿入モードに入った後に Ins キーを押すのと同じ               |
| `gR`                                              | R の仮装置換モード                                                               |                                                                 |
| `v`                                               | 文字志向のビジュアルモードへ入る                                                 |                                                                 |
| `V`                                               | 行志向のビジュアルモードへ入る                                                   |                                                                 |
| `<C-v>`                                           | 短形志向のビジュアルモードへ入る                                                 |                                                                 |
| `gv`                                              | ビジュアルモードで直前に選択した範囲を再度選択しつつビジュアルモードへ入る       | とても便利                                                      |
| `J`                                               | 行末の改行を削除する                                                             |                                                                 |
| `<C-z> と fg`                                     | Vim を一時中断 & Vim に戻る                                                      | bash の場合                                                     |
| `:`                                               | コマンドラインモードに入る                                                       |                                                                 |
| `q:`                                              | コマンドラインウィンドウモードに入る                                             |                                                                 |
| `!{motion}`                                       | `{motion}` で指定した範囲を `[range]` に指定しつつコマンドラインモードに入る + ! | `!G` と入力すれば `:.,$!` と入力されコマンドラインに入る        |
| `<C-w>s`                                          | 横方向に分割                                                                     | :sp と同じ                                                      |
| `<C-w>v`                                          | 縦方向に分割                                                                     | :vsp と同じ                                                     |
| `<C-w><C-w>`                                      | ウィンドウを順次切り替える                                                       |                                                                 |
| `<C-w>h,j,k,j,l`                                  | ウィンドウを移動する                                                             |                                                                 |
| `<C-w>c`                                          | ウィンドウを閉じる                                                               | `:clo[se]` と同じ                                               |
| `<C-w>o`                                          | アクティブなウィンドウ以外を閉じる                                               | `:on[ly]` と同じ                                                |
| `<C-w>=`                                          | 全てのウィンドウの幅と高さを同じにする                                           |                                                                 |
| `<C-w>_`                                          | アクティブウィンドウの高さを最大化する                                           |                                                                 |
| `<C-w>\|`                                         | アクティブウィンドウの幅を最大化する                                             | レイアウトが崩れるのでパイプの前に `\` おいてるけど無視すること |
| `[N]<C-w>_`                                       | アクティブウィンドウの高さを `[N]` 行分にする                                    |                                                                 |
| `[N]<C-w>\|`                                      | アクティブウィンドウの幅を `[N]` 行分にする                                      | レイアウトが崩れるのでパイプの前に `\` おいてるけど無視すること |
| `<C-w>T`                                          | アクティブウィンドウを独立したタブに移動する                                     | めっちゃ便利そう                                                |
| `:tabe[dit] {filename}`                           | `{filename}` を新しいタブでオープンする                                          |                                                                 |
| `:tabc[lose]`                                     | 現在のタブと、そこに格納されている全てのウィンドウを閉じる                       |                                                                 |
| `:tabo[nly]`                                      | アクティブなタブ以外のタブを全て閉じる                                           |                                                                 |
| `:tabn`                                           | 次のタブに切り替える                                                             | `gt` でオッケー                                                 |
| `:tabp`                                           | 前のタブに切り替える                                                             | `gT` でオッケー                                                 |
| `:tab ba`                                         | 今あるバッファをすべてタブ化する                                                 | `bufdo tab split` でもオッケー                                  |
| `:tabmove [N]`                                    | タブの位置を変更する                                                             | 0 だと先頭、省略すると末尾へ移動                                |
| `<C-ˆ>`                                           | ファイルエクスプローラモードから直前のバッファに戻る                             |                                                                 |
| `/{pattern}<CR>`                                  | 前方検索を開始する                                                               |                                                                 |
| `?{pattern}<CR>`                                  | 後方検索を開始する                                                               |                                                                 |
| 検索パターンの中で `/e<CR>`                       | 検索結果に移動する際にカーソルを結果の末尾に移動させる                           |                                                                 |
| 検索パターンの中で `\C<CR>`                       | 検索で大文字と小文字の区別を強制する                                             |                                                                 |
| `q`                                               | マクロの記録開始と終了                                                           |                                                                 |
| `q{register}`                                     | 指定したレジスタにマクロを保存                                                   |                                                                 |
| `:reg {register}`                                 | 指定したマクロの内容を表示する                                                   |                                                                 |
| `@{register}`                                     | 指定したマクロを実行する                                                         |                                                                 |
| `@@`                                              | 直前に実行したマクロを繰り返す                                                   |                                                                 |
| `:normal @{register}`                             | 選択範囲の各行に対してマクロを実行する                                           |                                                                 |
| `*`                                               | カーソルがある単語を検索する                                                     |                                                                 |
| `:[range]s[ubstitute]/{pattern}/{string}/[flags]` | 置換                                                                             |                                                                 |
|                                                   |                                                                                  |                                                                 |

### オペレータコマンド
後続に {motion} を取り、それにより動作範囲が変わるコマンド。
オペレータコマンドを連続して入力すると、その行に適用される動作となる。 (yy ならその行をヤンク、 >> ならその行のインデントを一つ深くする)

| コマンド    | 動作                                                | 備考                                                                                   |
| ----------- | --------------------------------------------------- | -------------------------------------------------------------------------------------- |
| `c{motion}` | 変更                                                | `cw` なら単語の末尾まで削除して挿入モードに入る                                        |
| `d{motion}` | 削除                                                | `db` でカーソルの直前からその単語の先頭文字までを削除。 `daw` でカーソル状の単語を削除 |
| `y`         | レジスタにヤンク                                    |                                                                                        |
| `p`         | レジスタの内容を貼り付ける                          |                                                                                        |
| `g˜`        | 大文字小文字を入れ替え                              |                                                                                        |
| `gu`        | 小文字化                                            |                                                                                        |
| `gU`        | 大文字化                                            |                                                                                        |
| `>`         | インデントを深くする                                |                                                                                        |
| `<`         | インデントを浅くする                                |                                                                                        |
| `=`         | 自動インデント                                      |                                                                                        |
| `!`         | `{motion}` で指定される行を外部プログラムでフィルタ |                                                                                        |
|             |                                                     |                                                                                        |
|             |                                                     |                                                                                        |
|             |                                                     |                                                                                        |

## モーション集
| コマンド      | 動作                                   | 備考                                                         |
| ------------- | -------------------------------------- | ------------------------------------------------------------ |
| `ˆ`           | 空白以外の先頭文字へ移動               |                                                              |
| `w`           | 次の単語の先頭に移動                   |                                                              |
| `b`           | 前の単語の先頭に移動                   |                                                              |
| `e`           | 現在の単語もしくは次の単語の末尾に移動 | `ea` で編集に入る場面が多い                                  |
| `ge`          | 前の単語の末尾に移動                   |                                                              |
| `W, B, E, gE` | WORD 単位で移動する                    | 途中の記号などは無視してくれるため高速でカーソルを動かせる。 |
| `f{char}`     | 次の `{char}` まで移動する             |                                                              |
| `F{char}`     | 前の `{char}` まで移動する             |                                                              |
| `t{char}`     | 次の `{char}` の直前の文字まで移動する |                                                              |
| `T{char}`     | 前の `{char}` の直前の文字まで移動する |                                                              |
| `;`           | 直前の検索を繰り返す                   |                                                              |
| `,`           | 直前の検索を逆方向に                   |                                                              |

## テキストオブジェクト集
テキストの範囲を構造で定義するもの。
必ず i (inside) または a (around) で始まる二文字である。
モーションそのものではないが、 `{motion}` が使える部分にはそのまま適用できる！ ( `ci"` だったり `cit` だったり `yit` だったり `dit` だったり)

| コマンド | 動作                                   | 備考 |
| -------- | -------------------------------------- | ---- |
| `a), ab` | `)` で囲まれた範囲                     |      |
| `i), ib` | `)` の内側の範囲                       |      |
| `a}, aB` |                                        |      |
| `i}, iB` |                                        |      |
| `a]`     |                                        |      |
| `i]`     |                                        |      |
| `a>`     |                                        |      |
| `i>`     |                                        |      |
| `a'`     |                                        |      |
| `i'`     |                                        |      |
| `a"`     |                                        |      |
| `i"`     |                                        |      |
| `` a` `` |                                        |      |
| `` i` `` |                                        |      |
| `at`     | タグで囲まれた範囲                     |      |
| `it`     | タグの内側の範囲                       |      |
| `iw`     | 現在の単語                             |      |
| `aw`     | 現在の単語 + 前後どちらかの空白        |      |
| `iW`     | 現在の単語 (WORD)                      |      |
| `aW`     | 現在の単語 (WORD) + 前後どちらかの空白 |      |
| `is`     | 現在の文                               |      |
| `as`     | 現在の文 + 前後どちらかの空白          |      |
| `ip`     | 現在の段落                             |      |
| `ap`     | 現在の段落 + 前後どちらかの空白        |      |
|          |                                        |      |
|          |                                        |      |
|          |                                        |      |

## マークとジャンプ関して
| コマンド      | 動作                                                 | 備考                               |
| ------------- | ---------------------------------------------------- | ---------------------------------- |
| `m{a-zA-Z}`   | 現在のカーソル位置に指定された文字でマークする       | 大文字だとグローバルマークとなる。 |
| `` `{mark} `` | 指定されたマークに移動する                           |                                    |
| `'{mark}`     | 指定されたマークがある行の最初の非空白文字に移動する |                                    |


### 以下 Vim が自動的にマークするもの

| コマンド | 動作                                         | 備考                         |
| -------- | -------------------------------------------- | ---------------------------- |
| `` ` ``  | 直前に行われたジャンプ以前にいた場所に移動   |                              |
| `.`      | 直前に変更された場所に移動                   | 絶対使うのにあんま使ってない |
| `ˆ`      | 直前に挿入があった場所に移動                 |                              |
| `[`      | 直前に変更もしくはヤンクが行われた先頭に移動 |                              |
| `]`      | 直前に変更若しくはヤンクが行われた末尾に移動 |                              |
| `<`      | 直前のビジュアルな選択範囲の先頭に移動       |                              |
| `>`      | 直前のビジュアルな選択範囲の末尾に移動       |                              |
|          |                                              |                              |

### その他のジャンプ

| コマンド                       | 動作                                                       | 備考                                                            |
| ------------------------------ | ---------------------------------------------------------- | --------------------------------------------------------------- |
| `%`                            | 開きかっこと閉じかっこ間で移動                             | matchit プラグインで % の動きを拡張できる。デフォルトではオフ。 |
| `[N]G`                         | 指定した行番号にジャンプ                                   | :[N] でも同じ                                                   |
| `(` または `)`                 | 前の文または次の文の先頭にジャンプ                         |                                                                 |
| `{` または `}`                 | 前の段落または次の段落の先頭にジャンプ                     |                                                                 |
| `H` または `M` または `L`      | 画面の先頭, 真ん中, 末尾にジャンプ                         |                                                                 |
| `gf`                           | カーソル位置のファイル名にジャンプ                         | ファイルを跨いでも `<C-o>` や `<C-i>` で行き来できる            |
| `<C-]>`                        | カーソル位置に記述されているキーワードの定義位置にジャンプ |                                                                 |
| `` `{mark} `` または `'{mark}` | マークにジャンプ                                           |                                                                 |
|                                |                                                            |                                                                 |

## レジスタに関して
削除、ヤンク、プットはすべて Vim の提供するいずれかのレジスタを対象としている。
各コマンドに `"{register}` を前置すると、使うレジスタを指定できる。

| 例      | 動作                                        |
| ------- | ------------------------------------------- |
| `"ayiw` | レジスタ a にカーソル位置の単語をヤンクする |
| `"bdd`  | カーソル行をカットしてレジスタ b に入れる   |
| `"ap`   | レジスタ a の単語を貼り付ける               |

### いろいろなレジスタ
| レジスタ | 意味                                                                   | 備考                                      |
| -------- | ---------------------------------------------------------------------- | ----------------------------------------- |
| `"_`     | ブラックホールレジスタ                                                 | このレジスタに保存したものは消える        |
| `""`     | 無名レジスタ。ヤンクなどの際にレジスタを指定しなかった場合ここに入る。 |                                           |
| `"0`     | ヤンクレジスタ。ヤンクしたものが入るレジスタ                           |                                           |
| `"+`     | クリップボードレジスタ                                                 |                                           |
| `"*`     | 範囲選択レジスタ                                                       | Visual モードの選択ではなく、X11 での選択 |
| `"%`     | 現在のファイルのファイル名                                             |                                           |
| `"#`     | 代替ファイルのファイル名                                               |                                           |
| `".`     | 直前に挿入されたテキスト                                               |                                           |
| `":`     | 直前に実行された Ex コマンド                                           |                                           |
| `"/`     | 直前に使用された検索パターン                                           |                                           |



## マクロに関して
q キーで Record の開始と終了ができる。
q{register} でマクロ保存先のレジスタを指定できる。

マクロを上手に扱うためのポイントとして以下の二つを抑えておきたい。
1. マクロを記録する際には、すべてのコマンドを必ず繰り返し可能であるようにすること
2. マクロの最初 or 最後で、ファイル先頭、最後尾、行頭、行末などに移動し、カーソル位置の正規化をしておくことで再実行性を高める

| コマンド      | 動作                   | 補足                               |
| ------------- | ---------------------- | ---------------------------------- |
| `q{register}` | マクロの記録開始       |                                    |
| `q`           | マクロの記録終了       | マクロの記録中                     |
| `@{register}` | マクロの実行           | そのレジスタに保存済みである場合   |
| `@@`          | 前回と同じマクロを実行 | もちろん `10@@` などで回数指定可能 |


## ｺﾚｶﾞﾜｶﾗﾅｲ
オペレータコマンドは全てビジュアルモードで選択した範囲に対して実行できる気がする。
その場合 `g` が意味しているのはなんなのか。ビジュアルオペレータという名前で、オペレータコマンドとはまた別物なのかもしれない。

## ビジュアルモードに関するコマンド
| コマンド | 動作                                                                       | 備考       |
| -------- | -------------------------------------------------------------------------- | ---------- |
| `v`      | 文字志向のビジュアルモードへ入る                                           |            |
| `V`      | 行志向のビジュアルモードへ入る                                             |            |
| `<C-v>`  | 短形志向のビジュアルモードへ入る                                           |            |
| `gv`     | ビジュアルモードで直前に選択した範囲を再度選択しつつビジュアルモードへ入る | とても便利 |
| `o`      | ビジュアルモード中に選択範囲の始点と終点を入れ替える                       | 便利そう   |
| `U`      | 選択範囲を大文字にする                                                     |            |
| `it`     | vit でタグ内部を選択できる                                                 |            |


## コマンドラインモードについて
ノーマルモードで : を押して突入するモードのこと。

## コマンドラインウィンドウモードについて
ノーマルモードで `q:` を押して突入するモードのこと。
Vim のバッファと似ていて、各行には履歴に含まれる各要素が表示され、 `<CR>` を押せば、その行にあるコマンドが実行できる。
コマンドラインモードから `<C-f>` で移行することもできる。

## Ex コマンドについて
コマンドラインモードまたはコマンドラインウィンドウモードで実行するするコマンドのこと。

### コマンドライン編集中の特殊コマンド
| コマンド           | 動作                             | 備考                                                   |
| ------------------ | -------------------------------- | ------------------------------------------------------ |
| `Tab`              | コマンドを補完する               |                                                        |
| `<C-r><C-w>`       | カーソルがある単語をペーストする |                                                        |
| `<Up>` or `<Down>` | 履歴を辿れる                     | キーコンフィグ推奨。デフォルトは 20 個記憶。変更可能。 |


### テキスト編集に使える Ex コマンド

| コマンド                                        | 動作                                         | 備考                                                                                                                      |
| ----------------------------------------------- | -------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `:[range]print`                                 | [range] の範囲を echo するだけ               |                                                                                                                           |
| `:[range]delete [x]`                            |                                              |                                                                                                                           |
| `:[range]yank [x]`                              |                                              |                                                                                                                           |
| `:[range]put [x]`                               |                                              |                                                                                                                           |
| `:[range]copy {address}`                        | {range} の内容を {address} の一行下にコピー  | :co と :t も同じ動作。                                                                                                    |
| `:[range]move {address}`                        | {range} の内容を {address} の一行下に移動    |                                                                                                                           |
| `:[range]join`                                  |                                              |                                                                                                                           |
| `:[range]normal {commands}`                     | [range] に対してノーマルコマンドを実行できる | ドットコマンドを複数行に渡って適用できるので最強。他には :%normal A; でファイルの全ての行の末尾にセミコロンを追加、など。 |
| `:[range]substitute/{pattern}/{string}/[flags]` |                                              |                                                                                                                           |
| `:[range]global/{pattern}/[cmd]`                |                                              |                                                                                                                           |
|                                                 |                                              |                                                                                                                           |

#### [range] の記載方法
`p` (print) コマンドを例にとる。

| コマンド                 | 動作                                                                        | 備考                                                    |
| ------------------------ | --------------------------------------------------------------------------- | ------------------------------------------------------- |
| `:3p`                    | 3 行目を出力                                                                |                                                         |
| `:2,5p`                  | 2-5 行目を出力                                                              |                                                         |
| `:.p`                    | 現在行を出力                                                                |                                                         |
| `:%p`                    | ファイル全体を出力                                                          |                                                         |
| `:'<,'>p`                | 選択範囲の始点から終点までを出力                                            | ビジュアルモードから : でこの状態に移行できる           |
| `:3+5,10p`               | 8-10 行目を出力                                                             | .+3 のようにも使える                                    |
| `:{pattern1},{pattern2}` | {pattern1} にマッチする部分から {pattern2} にマッチする部分までの範囲を出力 | オフセットと一緒に使う機会が多そう                      |
| `:$p`                    | 最終行を出力                                                                |                                                         |
| `:0p`                    | 仮想的な先頭行を表す                                                        | copy や move 先としてファイルの先頭に書きたい場合に使う |
| `:'mp`                   | マーク m がつけられた行を出力                                               |                                                         |
|                          |                                                                             |                                                         |

### その他の Ex コマンド
| コマンド               | 動作                                                            | 備考                                                                   |
| ---------------------- | --------------------------------------------------------------- | ---------------------------------------------------------------------- |
| `@:`                   | 直前の Ex コマンドを実行する                                    | 繰り返す系は重要コマンド！                                             |
| `:e {path}`            | ファイル or ディレクトリを開く                                  | 絶対パス相対パスどちらも指定可能                                       |
| `:find`                | ファイルを開く                                                  | path に登録されているファイルを開く。登録されていれば異なる階層でも OK | `:set path+=app**` でパスに追加できる |
| `:w`                   |                                                                 |                                                                        |
| `:[range]write !{cmd}` | {cmd} に現在のバッファの内容を渡す                              |                                                                        |
| `:read !{cmd}`         | {cmd} の出力結果を現在のバッファに挿入する                      |                                                                        |
| `:[range]!{filter}`    | 外部プログラム {filter} で指定した [range] をフィルタリングする |                                                                        |
| `:tabnew`              |                                                                 |                                                                        |
| `:split`               | 画面を横方向に分割する                                          | `<C-w>h,j,k,l` で移動できる                                            |
| `:prev`                |                                                                 |                                                                        |
| `:next`                |                                                                 |                                                                        |
| `:bprev, :bp`          |                                                                 |                                                                        |
| `:bnext, :bn`          |                                                                 |                                                                        |
| `:!`                   | シェルで外部プログラムを実行する                                |                                                                        |                                       |
| `:shell`               | インタラクティブに外部コマンドを実行する                        | `exit` で脱出                                                          |
|                        |                                                                 |                                                                        |


## 挿入モードで使えるコマンド
| コマンド | 動作                                     | 備考                                                                                                                                     |
| -------- | ---------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `<C-w>`  | 直前の 1 単語を削除                      | bash でも使える。                                                                                                                        |
| `<C-u>`  | 行頭まで削除                             | bash でも使える。                                                                                                                        |
| `<C-o>`  | 挿入ノーマルモードに切り替える。         | 一度だけコマンドを実行し、その後自動で挿入モードに戻る特殊なモード。編集しつつ途中で zz でいい感じにスクロールしたい場合などにオススメ。 |
| `<C-r>0` | 直前に設定したレジスタの内容を貼り付ける |                                                                                                                                          |
| `<C-r>=` | Expressionレジスタモードに突入           | `<C-r>=` の後 `1+1<CR>` で 2 を挿入できる。電卓要らず！                                                                                  |
|          |                                          |                                                                                                                                          |
|          |                                          |                                                                                                                                          |
|          |                                          |                                                                                                                                          |


## 紹介されていたオススメのコンフィグ
| コマンド                | 動作                                                             | 備考                                     |
| ----------------------- | ---------------------------------------------------------------- | ---------------------------------------- |
| `conremap <C-p> <Up>`   | コマンドラインの履歴を辿る                                       | デフォルトでも辿れるがフィルタがされない |
| `conremap <C-n> <Down>` | コマンドラインの履歴を辿る                                       | デフォルトでも辿れるがフィルタがされない |
| `incsearch`             | 検索する際に `<CR>` 押下前からマッチワードに画面が移動してくれる |                                          |
|                         |                                                                  |                                          |

## 紹介されていたプラグイン
| コマンド        | 動作                                                     | 備考                                                                      |
| --------------- | -------------------------------------------------------- | ------------------------------------------------------------------------- |
| `textobjentire` | ファイル全体を表すテキストオブジェクトなどを追加できる。 |                                                                           |
| `matchit`       | `%` のジャンプ移動を拡張できる                           | html のタグや class 定義など                                              |
| `surround.vim`  | 選択範囲をデリミタで囲める                               | `S"` で選択範囲を囲んだり、 `cs}]` で選択範囲のかっこの変更などができる。 |
| `Abolish`       | 置換の動作を拡張できる                                   | `:%S/{man,dog}/{dog,man}/g` で man と dog を入れ替えられる                |
|                 |                                                          |                                                                           |
|                 |                                                          |                                                                           |
|                 |                                                          |                                                                           |

## バッファの操作方法に関して
今はスキップ。。。


## Vim の正規表現
デフォルトだと POSIX というスタイルに近いらしく使い辛い。
very magic パターンスイッチを使えば馴染みのある形式で正規表現をつかえるようになる。

### 正規表現に関する文字クラス

| 文字クラス         | 意味                                                           | 補足                                                                   |
| ------------------ | -------------------------------------------------------------- | ---------------------------------------------------------------------- |
| `\v`               | very much パターンに入る                                       | パターンの先頭につける。 `/\v[0-9]`                                    |
| `\x`               | `[0-9a-fA-F]` のエイリアス                                     | 文字集合を表す                                                         |
| `\V`               | パターンのそれ以降の部分ではバックスラッシュのみメタ文字にする |                                                                        |
| `()`               | かっこ内のパターンにヒットした文字をキャプチャ                 |                                                                        |
| `\{N}`             | キャプチャした文字の参照                                       | `\1`, `\2` のように                                                    |
| `<` `>`            | 単語境界を表す                                                 | `<the>` とした場合に the はヒットして they や their はヒットしなくなる |
| `\_s`              | 空白文字 or 改行文字にマッチする                               |                                                                        |
| `/\v<(\w+)\_s+\1>` | 重複した単語に HIT                                             | 合わせ技                                                               |
| `\w`               | 単語を構成する文字にマッチする                                 | 文字や数字や `_` など                                                  |
| `\W`               | 単語を構成する文字以外のすべてにマッチする                     | 空白や記号など。悲しいことに日本語は全部拾われる                       |
| `%()`              | `()` の中をキャプチャしないようにする                          |                                                                        |
| `\zs` `\ze`        | マッチの一部を切り出してパターンのサブセットにできる           | 別途説明                                                               |
|                    |                                                                |                                                                        |


Andrew Neil や Drew Neil を
Neil Andrew や Neil Drew に置換する。

```
/v(%(And|D)rew) (Neil)
:%s//\2 \1/g
```

### `\zs` と `\ze` を詳しく
```
aaa "bbb" ccc
```
`/\v"[^"]+"` だと、クォートを含むクォートされた文字列にマッチするが、
`/\v"\zs[^"]+\ze"` だとクォートされた文字列の中身の部分にだけマッチする。

### クォートをダブルクォートにする置換
`:%s/\v'(([^']|'\w)+)'/"\1"/gc`

## グローバルコマンドとは
特定のパターンにマッチした各行に、Ex コマンドを実行できる。
`:[range] grobal[!] /{pattern*/ [cmd]`
デフォルトは % (ファイル全体)。
パターンにマッチした行を削除、などに使える。
