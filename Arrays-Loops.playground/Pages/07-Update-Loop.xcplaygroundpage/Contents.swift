class MySimulation: NeighborsSolutionSimulation {
/*:
 ![Make School Banner](./swift_banner.png)
 # The Update Loopループをアップデートする

 ## The final touch　最後の仕上げ

 We're almost there! Now it's time to write the update loop for Game of Life, so that the cells evolve according to the rules. To recap, the rules of Conway's Game of Life are:
     もうすぐ完成です！アップデートループというのを書いて、グリッドが進化していくようにしましょう。
     ライフゲームのルールのおさらい:

 - Count the alive neighbors the cell has (diagonals included).　周りの生きているセルの数を数える
 - If the cell is alive もしセル自身が生きていたら:
    - It dies of underpopulation if it has _less than_ 2 neighbors生きているセルの数が2つ未満のであれば、セルは死ぬ（人口過疎）
    - It stays alive if it has 2 or 3 neighbors　生きているセルが2もしくは3だったら、セルは生き続ける
    - It dies of overpopulation if it has more than 3 neighbors　もし生きているセルが3つ以上であれば、セルは死ぬ（人口過多）
 - If the cell is deadもしセル自身が死んでいたら:
    - If the dead cell has _exactly_ 3 neighbors, it becomes a live cell, via reproduction!セルの周りに生きているセルがちょうど３つあれば、セルは生き返る！

 Since we've already written the code that counts the neighbors of each cell, we can use our accumulated knowledge to iterate through each cell in the grid, and update the value accordingly!
     前のページで、生きているセルの数を数える関数を書きました。この関数を使って、アップデートしていくグリッドを作って行きましょう。

 We'll use this Character "👾" in order to denote alive cells. This is stored into a variable entitled `liveChar` for your convenience. If cells are dead, they are set to `nil`. If they are alive, they are set to `liveChar`.
     生きているセルには"👾"を入れます。`liveChar`に"👾"をセットして、毎回この絵文字を使わず`liveChar`を使うことにします。セルが死んでいるときは、`nil`をセットします。セルが生きていたら、`liveChar`をセットします。

*/

    let liveChar: Character = "👾"

/*:

 This is the `update` function that will get called on each step of the simulation. Here, you're responsible for accessing `grid`, and updating its values.
下に`update`関数が用意されています。この関数は、各ステップで毎回呼び出される関数です。
 - Iterate through each row and column using bounds `grid.count` and `grid[0].count`
 - すべての列と行を確認する。（`grid.count`と`grid[0].count`を使います）
 - Get the neighbor count for each, using `countNeighbors(grid: grid, column: x, row: y)`
- 全てのセルの周りの生きているセルの数を数えるには`countNeighbors(grid: grid, column: x, row: y)`を使う。
 - Use `if` statements to check if cells are alive and count the living neighbors
 - `if`を使ってセル自身が生きているかどうかを確認して、生きているセルの数を数える
 - Set the cell to its new state using the rules above!
 - ルールを元に、セルを次のステップの状態に書き換える

     
 - メモ: Every time you make a change, your code will automatically run. A red overlay on some cells means that that cell value is incorrect.　コードを書き換える度に、コードは自動的に実行されます。赤いセルは、どこかが間違っていることを示しています。
*/
/*:
 - callout(計画): Think carefully about what you're doing when you set array elements as you iterate through them.
     繰り返し、配列の各値を確認しているときに、実際どういう処理をしているのかを考えながら書いてみましょう。

     - Is there a chance that some neighbors get counted using their "new" cell values instead of the old ones?
     - セルを書き換えながら進めていると、古い状態と新しい状態が混ざって数えられていませんか？
     - How could you fix this?
     - どうしたら解決できるでしょう？

*/

    override func update() {
        // コードをこの下に書いて生きましょう
        grid // これは2Dのグリッドを表す変数です。この中身を書き換えましょう。
    }

/*:

 - callout(ヒント): If you're having trouble, create a second grid to hold the next step's values. At the end of the update function, set `grid` = `newGrid`. Plan out your approach with a neighbor if you need to. This simple game is challenging to implement right on your first shot!　新しい変数(`newGrid`)を作って、その変数に次のステップで表現される新しい状態を保存して行きます。update関数の最後に、`grid` = `newGrid` を追加して、`grid`自体を書き換えます。

 ## Got it working?　うまく動きましたか？

 Congratulations! You've now completed this lengthy introduction to Arrays in Swift, _and_ you've created your very own implementation of Conway's Game of Life!　おめでとうございます！少し長いチュートリアルでしたが、Swiftの配列入門がこれで終わりです！ライフゲームも出来ましたね！

*/

//: [Previous](@previous)





























/*:
Don't worry about this code. It handles the display.
*/
}
import PlaygroundSupport
import SpriteKit
let size = CGSize(width: 320, height: 568)
let sceneView = SKView(frame: CGRect(origin: CGPoint.zero, size: size))
sceneView.wantsLayer = true
let scene = SolutionOverlaySimulationScene(fileNamed: "SimulationScene")!
let path = Bundle.main.path(forResource: "map01", ofType: "txt")!
let sim = MySimulation(file: path)!
let comparisonSim = GOLSolutionSimulation(other: sim)
scene.setup(simulation: sim, palette: defaultPalette())
scene.scaleMode = .aspectFill
sceneView.presentScene(scene)
scene.setup(solutionSim: comparisonSim, solutionPalette: defaultPalette(), needsButtons: true)
PlaygroundPage.current.liveView = sceneView
let delayTime = DispatchTime.now() + Double(Int64(1 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
DispatchQueue.main.asyncAfter(deadline: delayTime) {
    scene.toggleButton()
}
