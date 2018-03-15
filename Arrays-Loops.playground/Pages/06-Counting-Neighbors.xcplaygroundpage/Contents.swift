class MySimulation: NeighborsSimulation {
/*:
 ![Make School Banner](./swift_banner.png)
 # Counting Neighbor Cells 周りのセルを数える

 Now that we know how to instantiate a 2D grid, it's time to start implementing the logic of Game of Life. Here, we've provided you with a prefilled grid with a `Glider` pattern. Our first task is to count correctly how many neighbors each cell has!
     2次元のグリッドを作る方法が分かりましたね。ここからはライフゲームのロジックを実際にコードで書いていきます。ここでは、`グライダー`パターンですでに埋められたグリッドを使います。まずはそれぞれのセルの周りにいくつの埋まったセルがあるかを数えます。

 In the display to the right, you'll see that we've provided an overlay of the number of neighbors that your code will count. As you can see, all of the cells currently return 1, which is obviously incorrect. We'll fix this soon, so that all of the numbers will show the correct numbers and light up green!
     右の画面に、グリッドの上に数字が重なって表示されているのが見えるでしょう。今の時点では、すべてのセルの上に1が表示されていますが、間違っていますね。これを正しい形に表示させるのがミッションです。

 ## Is the cell living?　セルは生きているか？

 Before we do our neighbor counting logic, let's instead prepare for ourselves a helper function -– something that will help us simplify our logic when we write a `countNeighbors` function later on.
     生きている（埋まっている）セルを数えるために、まずヘルパー関数（後から書くメインの関数を手助けしてくれる関数）を作ります。

 - callout(チャレンジ): Here, we have a `getAlive` function, which takes a `grid` of `[[Character?]]`, and `x` and `y` coordinates for the cell in question.`getAlive`関数が下に用意されています。この関数は`[[Character?]]`の`grid`と、`x`と`y`の値を引数として受け取ります。`x`と`y`は確かめたいセルの位置です。

     Given these parameters, you should:
     これらの引数を使って、下のミッションを完成させます。
     - Check if the coordinates `x` and `y` are _in bounds_ of `grid`. If not, return 0.
     -`x` と`y`の値が、`grid`の中に収まる正しい値かどうかを確認して、もし違ったら、0を返す。
     - Get the `Character?` (_character optional_) value from grid. Is it `nil`? If so, return 0.
     -`x` と`y`を使って、そのセルの値(`Character?`)をグリッドから取り出す。もしその値が`nil`だったら、0を返す。
     - If you haven't returned 0 yet, then return 1.
     - まだこの時点で0を返していなかったら、1を返す。
 */
/*:
 - callout(ヒント): To get the number of columns in grid, you can use `grid.count`. To get the number of rows, you can get the size of the first column: `grid[0].count` 行数を知るためには、`grid.count`を使います。列数を使うためには、`grid[0].count`を使います。

 Write your code inside the following function:
さあ、下の関数の中にコードを加えて行きましょう。
*/

    func getAlive(grid: [[Character?]], column x: Int, row y: Int) -> Int {




        return 1
    }

/*:

 ## Counting the neighboring cells　周りの生きたセルを数える

 Great! Now, we have to fill in the `countNeighbors` function. It should return an `Int` containing the number of neighboring cells a specific cell has. It is passed a `grid` of `[[Character?]]`, and `x` and `y` coordinates.
     よし！ここまで上手く行きましたか？続いて、`countNeighbors`関数をを作っていきます。この関数はある特定のセルの周りの行きたセルの数を数えてその数を返してくれます。例えば、左から3番目、下から2番目のセルを見て、その周りのセルにいくつ生きているセルがあるかを数えて、２つ生きているセルがあれば、２を返してくれます。

 To do this, we'll call our `getAlive` function on all the neighboring `x` & `y`. If it returns 0, that means that the cell is empty or that those are invalid coordinates – no error-checking necessary assuming you wrote `getAlive` correctly!
     つまり、周りのセルの全てに`getAlive`を使って、生きているセルを確かめます。

 To call `getAlive`, you can use a syntax like this:
     `getAlive`関数を使い方:
    let alive = getAlive(grid: grid, column: x - 1, row: y)

*/
/*:
     さあ、下の関数を埋めて見ましょう。
 - callout(ヒント): `alive` will then contain a 1 or 0 indicating status of the cell to the _left_ of the coordinate! Now all you have to do is call the function 8 times, in each of the directions (including diagonals) and add all of them up.　`生きているかどうか`というのはここでは0か1で表現されます。上のコードは、確かめたいセル(x, y)の左側(x-1, y)が生きているかを確かめています。それ以外の周りのセルに対しても、同じコードを書いて、その結果を全て足し合わせると（x, y）のセルの周りの生きているセルの合計数になりますね！
     

     If you get red numbers in the overlay, check your logic again (including `getAlive`) – look at which numbers are wrong to you pinpoint any bugs in your code. Grab a pen and some paper if you need to.
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
