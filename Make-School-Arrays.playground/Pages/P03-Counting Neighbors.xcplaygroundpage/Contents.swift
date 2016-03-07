//: [Previous](@previous)





//: [Next](@next)

class MySimulation: NeighborsSimulation {
    override func countNeighbors(map: [[Character?]], x: Int, y: Int) -> Int {
        return 0
    }
}










/*:
Don't worry about this code. This takes the scene and deck information and displays it.
*/
import XCPlayground
import SpriteKit
let size = CGSize(width: 320, height: 576)
let path = NSBundle.mainBundle().pathForResource("map01", ofType: "txt")!
let scene = NeighborsOverlaySimulationScene(sim: MySimulation(file: path)!, palette: defaultPalette(), size: size)
let sceneView = SKView(frame: CGRect(origin: CGPointZero, size: size))
sceneView.presentScene(scene)
XCPlaygroundPage.currentPage.liveView = sceneView
