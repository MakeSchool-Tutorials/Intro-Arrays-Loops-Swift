/*:
# An Introduction to Arrays

Arrays are your first foray into dealing with _collections_ of data. So far, you know how to store single values into variables, using `let` and `var`. But what if you wanted to store multiple data, without declaring `let` or `var for each one?

Arrays help you solve this problem, by providing you with an _ordered list_ of elements. Think of arrays like a line of buckets available for you to store your data:

![](array.jpg)

In this tutorial, you'll learn how to set up your own arrays, and _iterate_ through each of the elements. Also in the process, you'll code a famous game called __Conway's Game of Life__!

# Conway's Game of Life

![](not-game-of-life.png)

No, not that one!

![](gol.png)

Conway's Game of Life is less of a game than a _cellular automaton_ – one that depicts the life and death of a 2D grid of cells, that can be turned either on or off. The cells multiply and die off according to the state of their neighbors, much like how you might expect a colony of bacteria would spread.

The grid of tiles starts out in some configuration of alive and dead cells, as pictured above. Then, on each step, the cells are updated according to the following rules.

- Count how many alive neighbors the cell has (diagonals included).
- If the cell is alive:
    - If the cell has _less than_ 2 neighbors, it dies of underpopulation.
    - If the cell has 2 or 3 neighbors, it stays alive.
    - If the cell has more than 3 neighbors, it dies of overpopulation.
- If the cell is dead:
    - If the dead cell has _exactly_ 3 neighbors, it becomes a live cell, via reproduction!

What's interesting about this set of rules is that you can create some amazing animated patterns using them. Lo and behold, some of the phenomena found in Game of Life:

### Pulsar

![](Game_of_life_pulsar.gif)

### Glider

![](Game_of_life_animated_glider.gif)

### Glider Gun

![](Gospers_glider_gun.gif)

Click the Next button, and we'll be on our way to creating the Game of Life, using arrays!

*/
//: [Next](@next)
