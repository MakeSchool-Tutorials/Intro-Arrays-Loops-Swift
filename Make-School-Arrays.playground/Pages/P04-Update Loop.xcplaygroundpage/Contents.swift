//: [Previous](@previous)





//: [Next](@next)

class MySimulation: Simulation {
    override func update() {
        
    }
}










/*:
Don't worry about this code. This takes the scene and deck information and displays it.
*/
import XCPlayground
import SpriteKit
let size = CGSize(width: 320, height: 576)
let path = NSBundle.mainBundle().pathForResource("map01", ofType: "txt")!
let sim = MySimulation(file: path)!
let comparisonSim = GOLSolutionSimulation(other: sim)
let scene = SolutionOverlaySimulationScene(sim: sim, palette: defaultPalette(), solutionSim: comparisonSim, solutionPalette: defaultPalette(), size: size)
let sceneView = SKView(frame: CGRect(origin: CGPointZero, size: size))
sceneView.presentScene(scene)
XCPlaygroundPage.currentPage.liveView = sceneView
scene.play()