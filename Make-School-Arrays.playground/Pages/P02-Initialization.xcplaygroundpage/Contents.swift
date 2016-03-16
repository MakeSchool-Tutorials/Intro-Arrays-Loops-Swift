//: [Previous](@previous)
/*:

# Array Basics

In order to make our Game Of Life simulation, we will first make ourselves a "palette" for the different kinds of Characters that the user will be able to place on the grid cells. To do that, we make our first foray into arrays.

In many ways, you already know how to manipulate array variables, since they behave similarly to normal variables. Shown below is a standard way to initialize an _empty_ array, using `let`:
*/
let palette: [Character] = []

/*:
There are a few interesting things to note here:

The _type_ of this palette variable is `[Character]`. This translates to "an _array_ of _Characters_." You can make arrays of anything, including arrays of `String`s, arrays of `Int`s, or even arrays of _arrays of_ `Character`s (we'll get there soon).

The `palette` variable is initialized to the empty array, denoted by `[]`. In order to represent a _literal representation_ of an array, you list 0 or more comma-separated literals, enclosed within brackets. For example, try replacing the empty array literal with this:

    ["♡", "😀", "😜"]

This represents three Character elements, enclosed within an array. Watch how the palette appears to reflect your changes!

## Indexing

Great, now we have our palette variable set to contain 3 elements. How do we retrieve those elements? Enter the _subscript_ operator:

    palette[0]

In order to retrieve an _element_ of an array, you postpend the variable with brackets containing the _index_ number of the element you wish to retrieve. __Important: Array indices start from 0 to _1 less than_ the number of elements in the array!__ So in this example, _palette[1]_ will return the _second_ element in the array, and palette[3] will yield an __error__.

The below image shows how an example array might be initalized, with the indices to the elements shown above each cell:

![](array.jpg)

You can use the subscript operator not only to retrieve elements from the array, but also to set them as well. All you need to do is to assign a value to the subscripted array:

    palette[0] = "😜"

You won't be able to run the above code, though. That's because your palette variable is _immutable_, as it was initialized using `let`. Array variables are just like normal variables in this regard: if you instantiate one using `let`, you won't be able to change anything _inside_ the array, or re-assign it to another array. In order to overcome this, change your `let` initialization to use `var`.

Now, you can try setting element 0 of the array to 😜. The first and third elements of the array should now both be set to "😜".

*/



/*:
## Appending

Now you know how to set and re-assign elements of an array. But what if you want to _insert_ an element, changing the size of an array? `palette[3] = "♡"` won't work, since indexing out of bounds of the array yields an error. This is where `append()` comes in:

    palette.append("♡")

Try running this code. Now, a new "♡" character has been tacked on to the back of the array, increasing its array size!

You can verify that the size of the array has changed, by checking its `count` property:

    palette.count

This will return how many elements there are in the array. It'll come in handy later!

Try this code in the working space below.
*/




/*:
## For Loops

So far, we've been operating on elements one at a time. What if we wanted to do the same operation multiple times, or wanted to replace the entire contents of the array? Enter the For loop:

    for index in 0..<5 {
        palette.append("😈")
    }
*/



/*:
What is this funky new syntax?! If you run it, you'll see that _five_ new 😈's have been appended to the back of the array, meaning that the code in the curly brackets ran 5 times! This is the magic of the _for loop_.

The above for loops, translated to English, look something like this.

- Set `index` to 0.
- While `index` is _less than_ 5, run the enclosing code. After each iteration, _increment_ the `index` variable.

This means that for each iteration of the for loop, the variable `index` in this example was set to 0 on the first iteration, 1 in the next iteration, and so on... This might prove useful!

Remember our `palette.count` that told us how many elements there are in the array? Let's try replacing 5 with that, and use the _subscript_ operator to set the element corresponding to that index with 😈:

    for index in 0..<palette.count {
        palette[index] = "😈"
    }
*/



/*:
Congrats, you've learned how to set all the elements to a new value!

Here are more variations on the for loop you just learned.

    for index in 0...5 {
        // do something
    }

This version of the for loop uses `...` instead of the `..<` found previously. This means that the for loops from 0 to 5, _inclusively_ – that is, _including_ the 5. That means that the loop will iterate for a total of 6 times!

Be careful when using loops like this to iterate over arrays, because array indices always go from 0 to _1 less than_ the `count` of the array. So, for example this code would cause an __error__:

    // code throws error!
    for index in 0...palette.count {
        palette[index] = "😈"
    }
*/

/*:
So far we've been iterating with for loops using integers, but you can actually use arrays directly to retrieve all the elements of the array:

    for element in palette {
        // element is now a Character variable
    }

Right now this isn't entirely useful since we need the index of the array in order to set the elements, but this might be useful in the future.

Press Next to go on!
*/


//: [Next](@next)












/*:
Don't worry about this code. This takes the scene and deck information and displays it.
*/
import XCPlayground
import SpriteKit
let size = CGSize(width: 320, height: 576)
let comparisonSim = simFilledWith("♡", size: 10)
let comparisonPalette = paletteFilledWith("♡", size: 10)
let scene = SimulationScene(sim: EmptySimulation(), palette: convertToOptional(palette), size: size)
let sceneView = SKView(frame: CGRect(origin: CGPointZero, size: size))
sceneView.presentScene(scene)
XCPlaygroundPage.currentPage.liveView = sceneView
