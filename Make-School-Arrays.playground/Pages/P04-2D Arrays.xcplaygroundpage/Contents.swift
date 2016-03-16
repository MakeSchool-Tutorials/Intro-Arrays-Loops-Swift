//: [Previous](@previous)
/*:
# 2D Arrays

You might have noticed we haven't dealt with how to build the 2D grid of cells that is required in Game of Life. Let's figure that out!

You might remember that when we introduced arrays, we said that arrays can represent a list of _any_ type. What if... a variable was initialized to be an array of _arrays_?
*/

var grid: [[Character?]] = []

/*:
That's right. The double brackets mean that `grid` is a variable of type "Array of Arrays of `Character` optionals," which is a convoluted way of saying 2D grid of optional `Character`s. And just like in previous examples, we can append values to `grid`... just that those values have to be of type `[Character?]`!

Try this:

    let column = [Character?](count: 10, repeatedValue: nil)
    grid.append(column)

(The initializer for column is a special _constructor_ syntax that lets you quickly set an array with a count of repeated values.)

We now have a column of empty cells! Try utilizing our for loop logic in order to append 10 of these empty columns, to make a 10x10 grid.
*/




/*:
Indexing from a 2D grid is simple: You simply use the subscript operator twice – once for the outer array, and then again for the array inside that indexed outer array. In this example, this translates to x and y coordinates of the grid. Like so:

    grid[1][2] = "♡"

This would modify the cell at the _second column_ and _third row_ of the grid.

Try it out, and make yourself a nice pattern of `Character`s!
*/

//: [Next](@next)












/*:
Don't worry about this code. This takes the scene and deck information and displays it.
*/
import XCPlayground
import SpriteKit
let size = CGSize(width: 320, height: 576)
let palette: [Character?] = ["♡", "♡", "♡", "♡", "♡", nil, nil, nil, nil, nil]
let sim = Simulation()
sim.map = grid
let scene = SimulationScene(sim: sim, palette: palette, size: size)
let sceneView = SKView(frame: CGRect(origin: CGPointZero, size: size))
sceneView.presentScene(scene)
XCPlaygroundPage.currentPage.liveView = sceneView
