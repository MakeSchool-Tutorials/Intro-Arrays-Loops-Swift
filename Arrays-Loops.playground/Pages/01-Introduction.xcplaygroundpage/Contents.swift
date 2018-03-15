/*:
 ![Make School Banner](./swift_banner.png)
 # 配列入門

 Arrays are your first foray into dealing with _collections_ of data. So far, you know how to store single values into variables and constants, using `let` and `var`. But what if you wanted to store lots of data, without declaring a variable or constant for each piece?
配列はデータの集まりを操作するために必要なものです。これまで、一つ一つの値を変数や定数と呼ばれるものに保存することは学びましたね。（'let'や'var'を使いました。）では、もしたくさんのデータを保存したかったら、どうすれば良いでしょうか。一つ一つに変数や定数を定義していたら大変ですね。

 Arrays help you solve this problem, by providing you with an _ordered list_ of elements. You can picture arrays as a line of buckets available for you to store your data.
 配列というのは、一つ一つの要素をリストにいれて保存してくれることで、この問題を解決してくれるのです。バケツが一列に並んでいて、その一つ一つにデータを保存できるようなイメージです。

 ![](array.jpg)

 In this tutorial, you'll learn how to set up your own arrays, and _iterate_ through each of the elements using _for-loops_. Also in the process, you'll code a famous game called __Conway's Game of Life__!
 このチュートリアルでは、どうやってオリジナルの配列を作ったり、その中のデータを"for-loops"というものを使って操作する方法を学びます。その知識を使って、「ゲームライフ」と呼ばれる有名なゲームを学びます！

 # ゲームライフ（Conway's Game of Life）

 ![](not-game-of-life.png)

いや、これではないですよ！

 ![](gol.png)

 Conway's Game of Life not quite a game. It's [_cellular automaton_](https://en.wikipedia.org/wiki/Cellular_automaton) –- one that depicts the life and death of cells on a two-dimensional grid. Each cell can be turned either on or off. The cells multiply and die off according to the state of their neighbors, a lot like spreading bacteria or microorganisms.
 ゲームライフ（Conway's Game of Life）は実はいわゆるゲームとは少し違います。これは[_セル・オートマトン_](https://ja.wikipedia.org/wiki/%E3%82%BB%E3%83%AB%E3%83%BB%E3%82%AA%E3%83%BC%E3%83%88%E3%83%9E%E3%83%88%E3%83%B3)と呼ばれる、２次元のグリッドにセルの誕生や進化、淘汰を表現するものなのです。セルが塗りつぶされたり、白に戻ったりします。まるで微生物やバクテリアが広がるように、条件によって黒のセルが増えたり、減ったりします。

 The grid of cells starts out in a configuration of alive and dead cells. On each step or _generation_, the cells are updated according to the following rules:
まず初めに、生きたセルと死んだセルの配置を決めるところからスタートします。そして各ステップで、下のルールに従って各セルは更新されます。
 
 - Count the alive neighbors surrounding the cell　セルの周りで生きているセルがいくつあるかを数える
 - For living cells:　生きているセルのルール
    - If the cell has _less than_ 2 neighbors, it dies of underpopulation　もしそのセルの周りの生きているセルが1つ以下であれば、そのセルは過疎により死滅する。
    - If the cell has 2 or 3 neighbors, continues living　もしそのセルの周りに２つもしくは３つの生きたセルがあれば、そのセルは生き続ける
    - If the cell has more than 3 neighbors, it dies of overpopulation　もしそのセルの周りに４つ以上の生きたセルがあれば、過密により死滅する。
 - For dead cells　死んだセルのルール
    - If the dead cell has _exactly_ 3 neighbors, it becomes living via reproduction!　もしその死んでいるセルの周りにちょうど３つの生きたセルがあれば、次の世代が誕生する！（セルが生き返る）

 While these rules seem pretty basic, they lead to some amazing emergent behaviors. Lo and behold, some of the phenomena found in Conway's Game of Life:
上のものはきほんのルールに見えますが、実は生命の誕生・淘汰などの出現をとても上手に表します。例えば、下のような現象がゲームライフで見つかるでしょう！
 
 - callout(パルサー): ![](Game_of_life_pulsar.gif)
 */
/*:
 - callout(グライダー): ![](Game_of_life_animated_glider.gif)
 */
/*:
 - callout(グライダー銃): ![](Gospers_glider_gun.gif)

 Click the Next button, and we'll be on our way to creating Conway's Game of Life!
 "Next"ボタンを押して早速ゲームライフを作ってみましょう！

*/
//: [Next](@next)
