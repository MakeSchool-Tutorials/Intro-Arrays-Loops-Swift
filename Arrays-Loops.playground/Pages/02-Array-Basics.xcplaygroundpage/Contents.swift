/*:
 ![Make School Banner](./swift_banner.png)
 # 配列のきほん

 In order to make our Game of Life simulation, we will first need to create a "palette" for the different kinds of `Characters` that the user will be able to place on the grid cells. We will be using a one-dimensional array to store this pallete.
 ライフシミュレーションを作るために、まずは"palette"と呼ばれるものを用意します。これは、ユーザーが色々な文字をこのシミュレーションで使うことができるようにするためのものです。まずは”一次元”配列を使います。

 In many ways, you already know how to manipulate array variables. They behave similarly to normal variables. Shown below is a standard way to initialize an _empty_ array, using `let`.
 どうしたら配列を操作できるか、いくつかの方法を実はもう学んでいます。配列は、普通の変数と同じように扱うことができます。下の例は、空の配列を"let"を使って初期化する方法です。

 */

let palette: [Character] = []

/*:

 - note: A `String` is made up of `Character`s. A `Character` is just a single element `String`! It cannot store more than one letter/number/special characters. An `Array` can hold any data type as long as every element in it is the same data type! We'll be working with `Array`'s holding `Character`s most of this playground.
 - 注意: "String(文字列)"は"Character(文字)"からできています。"Character(文字)"は、"String(文字列)"の一要素で、２文字以上を保存することはできません。配列はどんなデータ型も保存することができます。（ただし配列に入っている全てのデータは同じデータ型でないといけません。）

 ## Declaring Arrays　配列を宣言する

 The _data type_ of this palette variable is `[Character]`. This translates to "an _array_ of _Characters_." You can make arrays of anything, including arrays of `String`s, arrays of `Int`s, or even arrays of _arrays of_ `Character`s (we'll get there soon).
 この"palette"変数のデータ型は、`[Character]`です。つまり、"Character(文字)の配列"がデータ型です。Character(文字)以外にも、どんなデータの配列も作ることができます。("String"の配列、"Int"の配列、"Character"の配列の配列（これは少しややこしいですが、この後登場します。））

 The `palette` variable is initialized to the empty array, denoted by `[]`. In order to represent a _literal representation_ of an array, you list 0 or more comma-separated values, enclosed within square brackets.
 この"palette"変数はまずは何も入っていない、空の配列として定義されています。カンマで区切って文字を[]の中に入力することで、文字の配列を作ることができます。

 - callout(試してみよう): Try overwriting the empty array literal (right of the equals sign in the code above) with the array below. This represents three `Character` elements, enclosed within an array. Watch how the palette appears to reflect your changes!　定義をした空の配列をしたの配列に書き換えてみましょう。３つの要素が一つの配列に格納されます。どうpaletteが変化するか見てみましょう！

    `["🐱", "😀", "😜"]`

 - important: You open up an emoji keyboard by pressing `control + command + space`. Do not forget the `"` around the emoji characters!
 - 重要: `control + command + space`を押すと絵文字キーボードが開きます。

 ## Indexing　インデックス

 Now that we have 3 elements the `palette` variable, how do we retrieve those elements? Enter the _subscript_ operator:
 今`palette`には3つの要素が入っています。どうしたらこの要素を取り出すことができるでしょうか？　この_subscript(添え字)_を使いましょう:
    palette[0]

 In order to retrieve an _element_ of an array, you _postpend_ the variable with brackets containing the _index_ number of the element you wish to retrieve.
配列から要素を取り出すためには、上の例のように配列の名前の後に取り出したい要素の番号を付け加えます。
 - important: Array indices start from 0 and end with 1 less than the number of elements in it!_ So in this example, `palette[1]` will return the _second_ element in the array, and `palette[3]` will yield an __error__.
 - 重要: 配列の番号は、0から始まります！つまり、`palette[1]`は、_2_つ目の要素を取り出すということになります。

 The below image shows how an example array might be initalized, with the indices to the elements shown above each cell:
下のイメージは要素が入った配列と、要素一つ一つに対応する番号を示しています。
 ![](array.jpg)

 */

let exampleArray = [2, 5, 1, 3, 4]
exampleArray[0]
exampleArray[1]
exampleArray[2]
exampleArray[3]
exampleArray[4]

/*:

 ## Subscript assignment 添え字を使って定義する

 - callout(試してみよう): In addition to retrieving elements from the array, you can also assign to elements with the _subscript operator_. It looks exactly like a normal assignment statement. 配列から要素を取り出すだけではなく、_添え字_を使って要素を定義することができます。これまでに学んだ定義の方法ととても似ています。

    `palette[0] = "😜"`


 */



/*:

 ### エラーが出てしまう！

 The above code won't work without some changes, though.
 この上のコードはこのままでは動かないようです。

 - 重要: We originally delcared the palette variable using `let`. This made it a constant or _immutable_ array. Just like normal `let` constants, if you create an array using `let`, you won't be able to change anything _inside_ it. In order to overcome this, change your `let` declaration to a `var`. paletteは、`let`を使って定義しました。つまり、この変数は変更ができない配列ということです。もし、paletteの値を後から変更可能にしたければ、`let`ではなく`var`を使って定義します。

 Now, you can try setting element 0 of the array to 😜. The first and third elements of the array should now both be set to "😜".これで要素0を😜に設定できます。初めと三番目の要素がこれで😜になっているはずです。

 */



/*:

 ## Append (アペンド)

 What if you want to _insert_ an element, changing the size of an array? `palette[3] = "🐱"` won't work, since accessing an array beyond it's bounds causes an error. This is where `append()` comes in! もし配列に要素を付け加えたかったら、どうしたらいいでしょうか？`palette[3] = "🐱"`では上手くいきません。なぜなら、定義した配列のサイズより大きな番号にアクセスをしようとするとエラーが出てしまうからです。ここで`append()`が登場します！


 - callout(試してみよう): このコードを試してみましょう。

    `palette.append("🐱")`

 Now, a new "🐱" character has been tacked on to the back of the array, and it's size has increased by one.
 新しい"🐱"が配列の後ろに追加され、配列の大きさが一つ増えました。

 - メモ: You can verify that the size of the array has changed, by checking its `count` property:`count`を使うと、配列の大きさを知ることができます。

    `palette.count`

 This will return how many elements there are in the array. It'll come in handy later!上のコードは、いくつの要素が配列に入っているかを教えてくれます。

 Try it out in the working space below.下のスペースで試してみましょう。

 */




/*:

 - 注意: The syntax for getting the number of elements in an array is _not_ a function -- it doesn't have parenthesizes! `count` is a _property_ or variable that belongs to an array. You access it using _dot syntax_ as you saw above.この配列の大きさを知るシンタックスは関数ではありません。よく見ると()がついていませんね！`count`は_プロパティ_ もしくは配列に紐づいている値です。ドットを使うことでこの値を取得することができます。

 ## Forループ

 So far, we've been operating on elements one at a time. What if we wanted to do the same operation multiple times, or wanted to replace the entire contents of the array? Re-enter the `for loop`... Do you remember it from `drawPolygon`?
 これまで、一つずつ、要素を操作してきました。もし配列の複数の要素に、同じ操作をしたかったらどうすればいいでしょうか？ `for loop` を思い出しましょう。`drawPolygon`で使いましたね。

    for index in 0..<5 {
        palette.append("😈")
    }

 */



/*:

 If you run it, you'll see that _five_ new 😈's have been appended to the back of the array, meaning that the code in the curly brackets ran 5 times! This is the magic of the _for loop_.
 このコードを実行すると、5つの😈が配列の後ろに追加されているはずです。つまり、{}の中のコードは５回実行されているということですね！これが_for ループ_の便利なところです。

 The above for loops, translated to English works as follows
 上のforループは、このように言葉で表現できます。

 - Set `index` to 0 `index`を0にセットする
 - While `index` is _less than_ 5, run the enclosing code. After each run, _increment_ the `index` variable by 1
 `index`が5より小さい時、{}の中のコードを実行する。実行する度に、`index`の値が1つずつ増える

 The variable `index` in this example was set to `0` on the first iteration, `1` in the next iteration, and so on... This might prove useful!
 `index`の値は初め`0`、次のターンで`1`、、、のように繰り返されます。

 - 重要: Did you spot the difference from last time we used `for-loops`? This time we have a counter variable called `index`. We are also starting at `0` and using `..<` instead of `...` -- `..<` means up to _but not_ including the final number while `...` means up to _and including_ the final number. You can read `0..<5` as _zero to five non-inclusive_. `0...5` reads as _zero to five inclusive_.
前回の `for　ループ`の使い方との違いに気づきましたか？今回、`index`というカウンター値を使いました。また、`0`の後`...`ではなく`..<`を使っています。`..<`はその後の値より小さいという意味です。`0..<5`の時は0から4まで、`0...5`の時は0から5までという意味です。
 */
/*:
 - callout(試してみよう): Remember `palette.count`? It told us how many elements there are in the array. Let's try replacing 5 with that, and use the _subscript assignment_ operator to set the element corresponding to that index with 👾.
 `palette.count`はpaletteがいくつの要素を持っているかを教えてくれるものでした。5の代わりにこれを使いましょう。そして添え字を使って、indexと同じ位置番号の要素が👾に書き換わるようにしましょう。

 */





/*:

 Congrats, you've learned how to set all the elements to a new value!
 これで全ての値を一度に書き換える方法がわかりましたね！

 ## for ループ続き

 Here are more variations on the for loop you just learned.
 下のコードは先ほど学んだやり方です。

    for index in 0...5 {
        // do something
    }

 This version of the for loop uses `...` instead of the `..<` found previously. This means that the for loops from 0 to 5, _inclusively_ – that is, _including_ the 5. That means that the loop will iterate for a total of 6 times!
 このループは`..<`ではなく`...`を使っています。つまりこのループは0から5までを表しています。つまり、6回コードが実行されるということです！

 - 重要: Be careful when using `...` to iterate over arrays. Array indices always go from 0 to _1 less than_ the `count` of the array. So the following code would cause an __error__:
 `...`を使う時は少し注意しましょう。配列の位置の番号は0から(配列の`count`-1)の間です。下のコードはエラーが出てしまいます。なぜでしょう？

        for index in 0...palette.count {
            palette[index] = "😈"
        }

 ## for-in ループ

 So far we've been iterating with for loops using integers, but you can actually use arrays directly to retrieve all the elements of the array:
 これまで、forループを整数の値(index)を使って操作してきました。別の方法もあります。下のコードを使うと、整数の値を使わずに直接配列のデータを取り出すことができます。

    for element in palette {
        // element is now a variable containing a Character
        // loop code here
    }

 This is equivalent to:
 これは下のコードと同じ操作をします:

    for index in 0..<palette.count {
        let element = palette[index]
        // loop code here
    }

 - メモ: We will not be using this syntax right now since we need the index of the array in order to update the elements, but this might be useful in the future.この新しいやり方はこのチュートリアルでは使いませんが、知っておくと後々便利です。

Nextをクリックして次へ進みましょう！

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
let scene = SimulationScene(fileNamed: "SimulationScene")!
scene.setup(simulation: EmptySimulation(), palette: convertToOptional(palette))
scene.scaleMode = .aspectFill
sceneView.presentScene(scene)
PlaygroundPage.current.liveView = sceneView
