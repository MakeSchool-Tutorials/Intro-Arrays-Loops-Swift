class MySimulation: NeighborsSimulation {
/*:
 ![Make School Banner](./swift_banner.png)
 # 周りのセルを数える
     
　2次元のグリッドを作る方法が分かりましたね。ここからはコンウェイのライフゲームのロジックを実際にコードで書いていきます。ここでは、`グライダー`パターンですでに埋められたグリッドを使います。まずはそれぞれのセルの周りにいくつの埋まったセルがあるかを数えます。

　右の画面に、グリッドの上に数字が重なって表示されているのが見えるでしょう。今の時点では、すべてのセルの上に1が表示されていますが、間違っていますね。これを正しい形に表示させるのがミッションです。

 ## セルは生きているか？

　生きている（埋まっている）セルを数えるために、まずヘルパー関数（後から書くメインの関数を手助けしてくれる関数）を作ります。

 - callout(チャレンジ): `getAlive`関数が下に用意されています。この関数は`[[Character?]]`の`grid`と、`x`と`y`の値を引数として受け取ります。`x`と`y`は確かめたいセルの位置です。

     これらの引数を使って、下のミッションを完成させます。
     - `x` と`y`の値が、`grid`の中に収まる正しい値かどうかを確認して、もし違ったら、0を返す。
     - `x` と`y`を使って、そのセルの値(`Character?`)をグリッドから取り出す。もしその値が`nil`だったら、0を返す。
     - まだこの時点で0を返していなかったら、1を返す。
 */
/*:
 - callout(ヒント): 行数を知るためには、`grid.count`を使います。列数を使うためには、`grid[0].count`を使います。

さあ、下の関数の中にコードを加えて行きましょう。
*/

    func getAlive(grid: [[Character?]], column x: Int, row y: Int) -> Int {




        return 1
    }

/*:

 ## 周りの生きたセルを数える

 よし！ここまで上手く書けましたか？続いて、`countNeighbors`関数を作っていきます。この関数は周りの生きたセルの数を数えてその数を返す関数です。

　周りのセルの全てに`getAlive`を使えば、生きているセルを確かめることができますね。

 `getAlive`関数の使い方:
    let alive = getAlive(grid: grid, column: x - 1, row: y)

*/
/*:
     さあ、下の関数を埋めてみましょう。
 - callout(ヒント): `生きているかどうか`というのはここでは 0 か 1 で表現されます。上のコードは、確かめたいセル(x, y)の左側(x-1, y)が生きているかを確かめています。それ以外の周りのセルに対しても、同じコードを書いて、その結果を全て足し合わせると（x, y）のセルの周りの生きているセルの合計数になりますね！
     
     赤い数字が表示されたら、どこかが間違っているという証拠です。よくコードを見てみましょう。

*/


    override func countNeighbors(grid: [[Character?]], column x: Int, row y: Int) -> Int {




        return 1
    }



//: [Previous](@previous) | [Next](@next)




















}
/*:
Don't worry about this code. It handles the display.
*/

import PlaygroundSupport
import SpriteKit
let size = CGSize(width: 320, height: 568)
let sceneView = SKView(frame: CGRect(origin: CGPoint.zero, size: size))
sceneView.wantsLayer = true
let scene = NeighborsOverlaySimulationScene(fileNamed: "SimulationScene")!
let path = Bundle.main.path(forResource: "map01", ofType: "txt")!
scene.setup(neighborsSim: MySimulation(file: path)!, palette: defaultPalette())
scene.scaleMode = .aspectFill
sceneView.presentScene(scene)
scene.checkNeighbors()
PlaygroundPage.current.liveView = sceneView
