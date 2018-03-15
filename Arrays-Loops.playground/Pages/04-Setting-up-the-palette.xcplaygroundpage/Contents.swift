/*:
 ![Make School Banner](./swift_banner.png)
 # パレットをセッティングする

 ## Back to arrays 配列へ戻ろう

 `nil` is going to be handy in order to represent empty buckets in our palette of Characters, but first we need to modify our `palette` variable to be of the right type. Now instead of being an array of `Character`s, our palette is going to be an array of `Character` optionals:
 `nil`は空のバケツを表現するのに役立ちます。つまりパレットのセルを空のままにしたい時に使います。`nil`を使う前に`palette`を正しいデータ型に直します。`Character`の配列というデータタイプではなく、`Character`のオプショナルの配列というデータ型を使います。

 */

var palette: [Character?] = []

/*:

 - callout(Challenge): Using our newfound knowledge of for-loops and Optionals, set the palette to an array of size 8:
 - callout(チャレンジ): for ループとオプショナルを使い、大きさが８の配列を作ります。

    - Make the first 5 elements are set to "🐱"
    - 始めの5つの要素は"🐱"
    - Make the remaining 3 elements empty (`nil`).
    - 次の３つの要素は空（`nil`）

    The display on the right will tell you if your array is correct: if any of your cells light up red, that's an incorrect value! Refer back to the previous pages if you need a refresher on syntax.
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
