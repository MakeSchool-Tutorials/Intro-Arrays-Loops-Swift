//: [Previous](@previous)
/*:
# A Quick Detour: Optionals

One thing you might have been wondering as we were setting values to arrays, is that you couldn't set an array element to be _empty_. After all, we said that arrays are like buckets of data; why can't one of the buckets be empty?

_Optionals_ is a feature in Swift that lets you do this. It turns out that Swift provides you with a very special value – one that represents nothingness, or the absense of data: `nil`. (This is also commonly referred as `null` in other programming languages.) 

All variables in Swift can be set to nil, if you specify them as an _optional_ type:

    let char: Character? = nil

Here, our `char` variable is initialized with a type of `Character?`, indicating that it is a "Character optional." That means that the variable can be set to all normal characters, _or_ the value `nil`. Try it:
*/


/*:
`nil` is going to be handy in order to represent empty buckets in our palette of Characters, but first we need to modify our `palette` variable to be of the right type. Now instead of being an array of `Character`s, our palette is going to be an array of `Character` optionals:
*/

var palette: [Character?] = []

/*:
Now, a challenge for you: Using our newfound knowledge of for loops and Optionals, set the palette to an array of size 10, such that:

- The first 5 elements are set to "♡"
- The remaining 5 elements are empty (`nil`).

The display on the right will tell you if your array is correct: if any of your cells light up red, that's an incorrect value!
*/



/*:
When you're done, click Next to move on.
*/

//: [Next](@next)












/*:
Don't worry about this code. This takes the scene and deck information and displays it.
*/
import XCPlayground
import SpriteKit
let size = CGSize(width: 320, height: 576)
let scene = SolutionOverlaySimulationScene(sim: EmptySimulation(), palette: palette, solutionSim: EmptySimulation(), solutionPalette: solutionArray(), size: size)
let sceneView = SKView(frame: CGRect(origin: CGPointZero, size: size))
sceneView.presentScene(scene)
XCPlaygroundPage.currentPage.liveView = sceneView
