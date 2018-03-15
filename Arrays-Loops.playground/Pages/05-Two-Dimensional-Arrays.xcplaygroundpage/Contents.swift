/*:
 ![Make School Banner](./swift_banner.png)
 # Two dimensional Arrays　２次元配列

 You might have noticed we haven't shown you how build a 2D grid of cells. We'll need one for Game of Life so let's get started!
次に、2Dのグリッドを作るにはどうしたらよいでしょう。ライフゲームを作るには必須ですね！

 When we introduced arrays, we said that arrays can represent a list of _any_ type. What if... a variable was initialized to be an array of _arrays_?
 配列を紹介した時、_どんな_タイプのリストも配列は表現できると言ったのを覚えていますか。もし、_配列_の配列を作ったとしたら、、？

*/

var grid: [[Character?]] = []

/*:

 That's right. The double brackets mean that `grid` is a variable of type "`Array` of `Arrays` of `Character` optionals". This is just a convoluted way of saying a "2D grid of optional `Character`s". And just like in previous examples, we can append values to `grid`. The only difference is those values have to be of type `[Character?]`!
 二重のバケツの意味は、`Character`オプショナルの配列の配列ということです。これは、`Character`オプショナルの2Dのグリッドを作ったということです。これまで学んだ配列と同じで、このgridに値を加えていくことができます。

 - callout(試してみよう):

        let column = [Character?](repeating: nil, count: 10)
        grid.append(column)
 */
/*:
 - note: The initializer for column is a special _constructor_ syntax that lets you quickly set an array with a count of repeated values.
 - メモ: このcolumnでは、コンストラクタという特別な方法を使って、手早く配列を作り出しています。

 
 We now have a column of empty cells!
 これで空のセルの行ができました！
 */
/*:
 - callout(チャレンジ): Try utilizing some for-loop logic to append 8 of these empty columns to make a 8x10 grid.forループのロジックを使って、8つの空の行を付け足して8x10のグリッドを作ってみましょう。

*/





/*:

 Indexing from a 2D grid is simple: You simply use the subscript operator twice – once for the outer array, and then again for the array inside that indexed outer array. In this example, this translates to x and y coordinates of the grid.
 2Dグリッドからセルを呼び出す方法をシンプルです。添え字を２回使えばいいのです。まずは外側の配列を呼び出して、そのあと内側の配列を呼び出します。ここでは、xとyの値と考えることができます。

    grid[1][2] = "🐱"

 This would modify the cell at the _second column_ and _third row_ of the grid. 上のコードは、グリッドの_2番目_の行、_3番目_の列の値を"🐱"にセットしているという意味ですね。

 - experiment: Use this syntax to make yourself a nice pattern of `Character`s on your new 8x10, two dimensional grid!
 - 実験: このやり方を使って、`Character`を自由にグリッドに配置して見ましょう。
 
 -
*/
/*:
 - important: grid[0][0] represents the bottom-left corner.
 - 重要: grid[0][0]は左下のセルを表します。

*/












//: - 重要: Remember that `Array`s are zero-indexed in Swift. `[0]` represents the first value!　配列の位置番号は0から始まるのを忘れないようにしましょう。

//:
//: [Previous](@previous) | [Next](@next)




























/*:
Don't worry about this code. It handles the display.
*/
import PlaygroundSupport
import SpriteKit
let size = CGSize(width: 320, height: 568)
let sceneView = SKView(frame: CGRect(origin: CGPoint.zero, size: size))
sceneView.wantsLayer = true
let scene = SolutionOverlaySimulationScene(fileNamed: "SimulationScene")!
let palette: [Character?] = ["🐱", "🐱", "🐱", "🐱", "🐱", nil, nil, nil]
let sim = Simulation()
sim.grid = grid
scene.setup(simulation: sim, palette: palette)
scene.scaleMode = .aspectFill
sceneView.presentScene(scene)
PlaygroundPage.current.liveView = sceneView
