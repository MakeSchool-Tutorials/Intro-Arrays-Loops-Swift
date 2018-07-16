/*:
 ![Make School Banner](./swift_banner.png)
 # ２次元配列

 次に、2次元のグリッドを作るにはどうしたらよいでしょう。ライフゲームを作るには必須ですね！

 配列を紹介した時、_どんな_タイプのリストも配列は表現できると言ったのを覚えていますか。もし、_配列_の配列を作ったとしたら、、？

*/

var grid: [[Character?]] = []

/*:

 二重のバケツの意味は、`Character`オプショナルの配列の配列ということです。これは、`Character`オプショナルの二次元のグリッドを意味します。これまで学んだ配列と同じで、このgridにも値を加えていくことができます。

 - callout(試してみよう):

        let column = [Character?](repeating: nil, count: 10)
        grid.append(column)
 */
/*:
 - メモ: このcolumnでは、コンストラクタという特別な方法を使って、手早く配列を作り出しています。

 
 これで空のセルの行ができました！
 */
/*:
 - callout(チャレンジ): for ループのロジックを使って、8 つの空の行を付け足して8x10のグリッドを作ってみましょう。

*/





/*:

 2次元グリッドからセルを呼び出す方法はシンプルです。添え字を２回使えばいいのです。まずは外側の配列を呼び出して、そのあと内側の配列を呼び出します。ここでは、xとyの値と考えることができます。

    grid[1][2] = "🐱"

 上のコードは、グリッドの_2番目_の行、_3番目_の列の値を"🐱"にセットしているという意味ですね。

 - 実験: このやり方を使って、`Character`を自由にグリッドに配置してみましょう。
 
 -
*/
/*:
 - 重要: grid[0][0]は左下のセルを表します。

*/












//: - 重要: 配列の位置番号は0から始まるのを忘れないようにしましょう。

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
