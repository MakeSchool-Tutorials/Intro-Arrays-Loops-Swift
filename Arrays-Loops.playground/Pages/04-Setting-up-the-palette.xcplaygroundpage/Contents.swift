/*:
 ![Make School Banner](./swift_banner.png)
 # パレットをセッティングする

 ## 配列へ戻ろう

 `nil`は空のバケツを表現するのに役立ちます。つまりパレットのセルを空のままにしたい時に使います。でも`nil`を使う前に、`palette`を正しいデータ型にする必要があります。`Character`の配列というデータタイプではなく、`Character`のオプショナルの配列というデータ型を使います。

 */

var palette: [Character?] = []

/*:

 - callout(チャレンジ): for ループとオプショナルを使い、大きさが 8 の配列を作ります。

    - 始めの5つの要素は"🐱"
    - 次の３つの要素は空（`nil`）

    右の画面で、コードが正しいか確認しましょう。もし一つでもセルが赤くなっていたら、どこかが間違っている証拠です！

 */




























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
scene.setup(simulation: EmptySimulation(), palette: palette)
scene.scaleMode = .aspectFill
sceneView.presentScene(scene)
scene.setup(solutionSim: EmptySimulation(), solutionPalette: solutionArray())
PlaygroundPage.current.liveView = sceneView
