//: [Previous](@previous)
/*:
# The Update Loop

We're almost there! Now it's time to write the update loop for Game Of Life, so that the cells evolve according to the rules. To recap, the rules are:

- Count how many alive neighbors the cell has (diagonals included).
- If the cell is alive:
    - If the cell has _less than_ 2 neighbors, it dies of underpopulation.
    - If the cell has 2 or 3 neighbors, it stays alive.
    - If the cell has more than 3 neighbors, it dies of overpopulation.
- If the cell is dead:
    - If the dead cell has _exactly_ 3 neighbors, it becomes a live cell, via reproduction!

Since we've already written the code that counts the neighbors of each cell, we can use our accumulated knowledge to iterate through each cell in the grid, and update the value accordingly!
*/
class MySimulation: NeighborsSolutionSimulation {
    
/*:
We'll use this Character "■" in order to denote alive cells. This is stored into a variable entitled `liveChar`, for your convenience. If cells are dead, they are set to `nil`.
*/
    let liveChar: Character = "■"
  
/*:
This is the `update` function that will get called on each step of the simulation. Here, you're responsible for accessing `grid`, and updating its values. Iterate through each row and column using bounds `grid.count` and `grid[0].count`, and get the neighbor count for each, using `countNeighbors(grid, x, y)`. Use `if` statements to check if cells are equal to `nil` and to compare neighbor values, and set the cell to its new state!
    
Every time you make a change, your code will automatically run. A red overlay on some cells means that that cell value is incorrect.
    
Good luck!

Hint: Think carefully about what you're doing when you set array elements as you iterate through them. Is there a chance that some neighbors get counted using their "new" cell values instead of the old ones? Would you need to instantiate a new array in order to circumvent this issue?
*/
    override func update() {
        // Student code here!
        grid // this contains your 2D grid! Update this value.
    }
}


/*:
Congratulations! You've now completed this lengthy introduction to Arrays in Swift, _and_ you've created your very own implementation of Conway's Game Of Life! In the attached Xcode project, you'll have an opportunity to make a custom type of simulation, using multiple Characters instead of just one, and implement your own logic for updating cells!
*/

//: [Next](@next)







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

let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC)))
dispatch_after(delayTime, dispatch_get_main_queue()) {
    scene.play()
}
