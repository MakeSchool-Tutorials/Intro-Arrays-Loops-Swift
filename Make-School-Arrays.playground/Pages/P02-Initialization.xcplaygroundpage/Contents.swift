//: [Previous](@previous)


var palette: [Character?] = []

for i in 0..<10 {
    palette.append("♡")
}


class MySimulation: Simulation {
    override func setup() {
        map = [[Character?]].init(count: 10, repeatedValue: [Character?].init(count: 10, repeatedValue: "♡"))
    }
}



//: [Next](@next)












/*:
Don't worry about this code. This takes the scene and deck information and displays it.
*/
import XCPlayground
import SpriteKit
let size = CGSize(width: 320, height: 576)
let comparisonSim = simFilledWith("♡", size: 10)
let comparisonPalette = paletteFilledWith("♡", size: 10)
let scene = SolutionOverlaySimulationScene(sim: MySimulation(), palette: palette, solutionSim: comparisonSim, solutionPalette: comparisonPalette, size: size)
let sceneView = SKView(frame: CGRect(origin: CGPointZero, size: size))
sceneView.presentScene(scene)
XCPlaygroundPage.currentPage.liveView = sceneView
