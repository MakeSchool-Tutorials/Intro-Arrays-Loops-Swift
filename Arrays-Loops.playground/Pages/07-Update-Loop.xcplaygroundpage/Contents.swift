class MySimulation: NeighborsSolutionSimulation {
/*:
 ![Make School Banner](./swift_banner.png)
 # ループをアップデートする

 ## 最後の仕上げ

 もうすぐ完成です！アップデートループという関数を書いて、グリッドが進化していくようにしましょう。
     
ライフゲームのルールのおさらい:

 - 周りの生きているセルの数を数える
 - もしセル自身が生きていたら:
    - 周りの生きているセルの数が2つ未満であれば、死ぬ（人口過疎）
    - 周りの生きているセルが2もしくは3であれば、生き続ける
    - 周りの生きているセルが3つより多ければ、死ぬ（人口過多）
 - もしセル自身が死んでいたら:
    - 周りに生きているセルがちょうど３つあれば、生き返る！

　前のページで、生きているセルを数える関数を書きました。この関数を使って、アップデートしていくグリッドを作って行きましょう。
     
　生きているセルには"👾"を入れましょう。`liveChar`に"👾"をセットして、毎回この絵文字を使わず`liveChar`を使うことにします。セルが死んでいるときは、`nil`をセットします。セルが生きていたら、`liveChar`をセットします。

*/

    let liveChar: Character = "👾"

/*:

 さて、下に`update`関数が用意されています。この関数は、各ステップで毎回呼び出される関数です。
 - すべての列と行を確認する。（`grid.count`と`grid[0].count`を使います）
 - 周りの生きているセルの数を数えるには`countNeighbors(grid: grid, column: x, row: y)`を使う。
 - `if`を使ってセル自身が生きているかどうかを確認して、生きているセルの数を数える
 - ルールを元に、セルを次のステップの状態に書き換える

     
 - note:（メモ）コードを書き換える度に、コードは自動的に実行されます。赤いセルは、どこかが間違っていることを示しています。
*/
/*:
 - callout(計画):
     繰り返し、配列の各値を確認しているときに、実際どういう処理をしているのかを考えながら書いてみましょう。

     - セルを書き換えながら進めていると、古い状態と新しい状態が混ざって数えられていませんか？
     - どうしたら解決できるでしょう？

*/

    override func update() {
        // コードをこの下に書いて生きましょう
        grid // これは2Dのグリッドを表す変数です。この中身を書き換えましょう。
    }

/*:

 - callout(ヒント): 新しい変数(`newGrid`)を作って、その変数に次のステップで表現される新しい状態を保存していきます。update関数の最後に、`grid` = `newGrid` を追加して、`grid`自体を書き換えます。

 ## うまく動きましたか？

 おめでとうございます！少し長いチュートリアルでしたが、Swiftの配列入門がこれで終わりです！ライフゲームも出来ましたね！

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
