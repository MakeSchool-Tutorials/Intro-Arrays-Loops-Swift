//: [Previous](@previous)
/*:
# Counting Neighbor Cells

Now that we know how to instantiate a 2D grid, it's time to start implementing the logic of Game Of Life. Here, we've provided you with a pre-formed grid with a Glider pattern. Our first task is to count correctly how many neighbors each cell has!

In the display to the right, you'll see that we've provided an overlay of the number of neighbors that your code will count. As you can see, all of the cells currently return 1, which is obviously incorrect. We'll fix this soon, so that all of the numbers will show the correct numbers and light up green!
*/
class MySimulation: NeighborsSimulation {
    
/*:
Before we do our neighbor counting logic, let's instead prepare for ourselves a helper function – something that will help us simplify our logic when we write a `countNeighbors` function later on. Here, we have a `getAlive` function, which takes a `grid` of `[[Character?]]`, and `x` and `y` coordinates for the cell in question.

Given these parameters, you should:

- Check if the coordinates `x` and `y` are _in bounds_ of `grid`. If not, return 0.
- Get the `Character?` value from grid. Is it equal (`==`) to `nil`? If so, return 0.
- If all checks failed, then return 1.

Hint: To get the number of columns in grid, you can use `grid.count`. To get the number of rows, you can get the size of the first column: `grid[0].count`

Write your code inside the following function:
*/
    func getAlive(grid: [[Character?]], _ x: Int, _ y: Int) -> Int {
        //Student code here!
        return 1
    }
    
/*:
Great! Now, we have a `countNeighbors` function, in which you need to write code that, given a `grid` of `[[Character?]]`, and `x` and `y` coordinates, return as an `Int` how many neighbors the cell has.
    
To do this, we'll call our `getAlive` function we just wrote, on all the neighboring x/y coordinates that we've been given. If any return 0, that means that the cell is empty or that those are invalid coordinates – no error-checking necessary here!

To call `getAlive`, you can use a syntax like this:

    let alive = getAlive(grid, x - 1, y)

`alive` will then contain a 1 or 0 indicating status of the cell to the _left_ of the coordinate! Now all you have to do is call the function 8 times, in each of the directions (including diagonals) and add all of them up.
    
If you get red numbers in the overlay, check your logic again – looking at which numbers are wrong might help you pinpoint any bugs in your code.
*/
    override func countNeighbors(grid: [[Character?]], x: Int, y: Int) -> Int {

        // Student code here!
        return 1
    }
    
}


//: [Next](@next)






/*:
Don't worry about this code. This takes the scene and deck information and displays it.
*/
import XCPlayground
import SpriteKit
let size = CGSize(width: 320, height: 576)
let path = NSBundle.mainBundle().pathForResource("grid01", ofType: "txt")!
let scene = NeighborsOverlaySimulationScene(sim: MySimulation(file: path)!, palette: defaultPalette(), size: size)
let sceneView = SKView(frame: CGRect(origin: CGPointZero, size: size))
sceneView.presentScene(scene)
XCPlaygroundPage.currentPage.liveView = sceneView
