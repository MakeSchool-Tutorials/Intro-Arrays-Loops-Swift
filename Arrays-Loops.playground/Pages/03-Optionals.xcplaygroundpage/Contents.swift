/*:
 ![Make School Banner](./swift_banner.png)
 # ちょっとした遠回り: オプショナル

 ## 空の値

 You might have been wondering how to set an array element to be _empty_. After all, arrays are like buckets of data: why can't one of the buckets be empty? Let's take a step back from arrays for a moment and talk about _optionals_.
 もしかしたら、_空の_要素を配列に付け加えるにはどうしたらいいかと考えた人がいるかもしれません。配列は、データの入るバケツのようなものです。では、空のバケツがあってもいいのでは？これを考えるために、配列は少し置いておいて_オプショナル_について知りましょう。

 _Optionals_ are a feature in Swift that allow pieces of data to be empty. Swift provides a very special value – one that represents nothingness, or the absense of data: `nil`. Optionals are like boxes that may have something inside, or they may have nothing inside (`nil`).
 _オプショナル_ はSwiftの特徴の一つで、空のデータを扱うためのものです。Swiftは無を表す特別な値を持っています: `nil`と言います。オプショナルは箱のようなもので、中に何かが入っているか、もしくは何も入っていないか(`nil`)どちらかです。

 - メモ: `nil` is also commonly referred as `null` in other programming languages. Swift is much more strict about when variables can lack a value, and this is very helpful in avoiding bugs where we think we have a value when in fact we don't. Functions can even return an optional to indicate when the operation has failed or they have no value to give back to you. `nil`はよく他のプログラミング言語の`null`と同じように言われます。Swiftは他の言語と比べて値が空であることにすごく厳しい言語で、これによってバグを防ぐのに役立っています。

 ## nil

 Any variable in Swift can be set to `nil`, if it is declared as an _optional_ type._オプショナル型_として定義していれば、Swiftのどんな値も`nil`をセットすることができます。

 */

var mightContainCharacter: Character? = nil

/*:

 We express the fact that a value is of optional type by putting a question mark (`?`) at the end of the type name. For example, here is how we declare a variable of type `Int?` (read as "optional `Int`"):
 `?`マークをつけることで、この値がオプショナル型であることを示します。例えば、値を`Int?`として定義するときは下記のように書きます。
 */

var maybeAnInt: Int? = 15

//: Here, we have expressly given the variable a value of 15, but we could just as easily have assigned it `nil`ここでは、値を15として定義していますが、後から`nil`に書き換えても問題ないのです:

maybeAnInt = nil

/*:

 Now `maybeAnInt` is `nil`, which is to say it has _no value_. If `maybeAnInt` had just been of type Int (no question mark), we could not have set it to `nil`.
 今、`maybeAnInt`は`nil`で、つまり値が空ということです。`maybeAnInt`がもしただのInt型として定義されていたら、`nil`と書き換えることはできません。

 ## OptionalをUnwrapする

 When we retrieve the value from an optional, we call that "unwrapping" it. This is like opening the box and seeing whether there's anything inside. We can test whether an optional has a value by comparing the whole thing to `nil`. If it is not equal to `nil`, it contains a value. Woo hoo!
 オプショナル型から値を取り出すとき、"unwrap(アンラップ)"すると表現します。これは、箱を開けて中身を確認する作業のようです。オプショナルの値を`nil`と比較することで、値が実際に入っているかをテストすることができます。もしこれが`nil`と同じでなかったら、この変数は値を含んでいることになります。

 We can then safely use **force unwrapping** to get its value. Force unwrapping is done by putting an exclamation point (`!`) after the name of the variable we want to unwrap. This assures Swift that the optional contains a value and that it is therefore safe to read. If we're wrong, the code will crash. Here, we test whether `maybeAnInt` has a value and if it does, we rip open the box (force unwrap) and print its value.
 この値を使う時は、**force unwrapping**しなくてはいけません。Force unwrappingは、変数名の後に`!`マークを使うことで完了します。こうすることでSwiftプログラムに、このオプショナルは値が入っているので、安全に読むことができますよ、と伝えることができます。もし間違っていたら、このコードはクラッシュします。下に、`maybeAnInt`は値を持っているかどうかをテストして、もし入っていたらforce unwrapをしてその値をプリントするというコードが書かれています。

 */

if maybeAnInt != nil {
    print("maybeAnInt contains a value, and it is \(maybeAnInt!)")
} else {
    print("maybeAnInt does not contain a value")
}

/*:

 - 実験: Try changing the value of `maybeAnInt` from `nil` to something else above. Notice which message is printed depending on the value. Make sure to change it _above_ the conditional! 上で定義した`maybeAnInt`の値を`nil`から別の値に変えてみましょう。プリントされる結果が変わるはずです。

 ## Optional Binding

 A more compact way of testing and acting on an optional value is **optional binding**, where we test for the presence of an object and, if it exists, we create a new variable for this object in a narrower scope. Here, we "bind" the value of `maybeAnInt` (if present) to a new constant named `definitelyAnInt`, which only exists inside the `if/else` block, and print it:
 もっと簡単な方法があります。**optional binding**という方法で、値が存在するかを確認して、そうであれば新しい変数を作りその変数に存在する値を定義します。下のコードは、`maybeAnInt`の値を（もし存在すれば）`definitelyAnInt`という新しい定数に結び合せる("bind")しています。

 */

if let definitelyAnInt = maybeAnInt {
    print("maybeAnInt contains a value, and it is \(definitelyAnInt)")
} else {
    print("maybeAnInt does not contain a value")
}

/*:

 - 実験: Try changing the value of `maybeAnInt` again, and again take note that if it contains a value, the message indicates this and the local variable `definitelyAnInt` has the same value. If it doesn't contain a value, then `definitelyAnInt` won't be created.`maybeAnInt`を何度か変えてみて、もし`maybeAnInt`に値が入っていれば、 `definitelyAnInt`が作られ、同じ値になるかどうかを実験してみましょう。もし値が入っていなければ、`definitelyAnInt`は作られません。

 - 重要: It is common practice to unwrap optionals to the same variable name. It is only unwrapped _inside_ the if-statement and becomes an optional again outside of the if-statement.　Unwrapする時、同じ変数名を使うことが慣習になっています。この値はif文の中ではunwrapされた状態ですが、if文の外ではオプショナルに戻ります。

 ## Implicitly Unwrapped Optionals　(暗黙的アンラップ型)

 Sometimes we want to indicate that an optional will always have a value when we need it. For example, this happens when we separate the declaration of an optional from the first time we set its value. The first time we declare the optional, it won't have a value, but we'll set it before we use it. To support this scenario, we can declare a variable as an **implicitly unwrapped optional**. Implicitly unwrapped optionals are declared by placing an exclamation point (`!`) after the type to indicate that they **can** contain `nil`, but must always have a value when they are read:
 時々、オプショナル型だけどアクセスする時はアンラップ型がいいと思う時があります。例えば、初めに値を定義する時、オプショナルとして定義して、まずは空のままにしておきますが、その後実際に使う時には必ず値をいれて使うというケースです。このケースを可能にするために、**implicitly unwrapped optional(暗黙的アンラップ型)**として値を宣言します。暗黙的アンラップ型は`!`を使うことで定義できます。こうすると、初めに定義する時は`nil`をいれられますが、そのあとその値にアクセスする時には必ず値が入っている必要があります。
 */

var alwaysAString: String! = nil

/*:

 Notice that we initially assign `nil` to this implicitly unwrapped optional `String`. If we were to try to use it at this point, we would trigger a runtime error:
上では`nil`として定義しました。このまま値を入れずに、下のコードを実行するとエラーになります。
 */

//let stringLength = alwaysAString.characters.count

/*:

 - 実験: Try uncommenting the line above and seeing what happens. You will probably notice that the remainder of the Playground can no longer be evaluated. This is because the underlying process crashes when it attempts to access the variable. That's why we have to ensure that we never read an implicitly-unwrapped optional before setting its value.
 上の行をアンコメントして何が起こるか見てみましょう。空の`alwaysAString`にアクセスしようとするため、クラッシュしてしまいます。

 Let's assign a value so the variable is no longer `nil`:
 ではここで`nil`ではない値を入れましょう。

 */

alwaysAString = "Now I have a value!"

//: Now, when we print this string, it is implicitly unwrapped to the `String` value it contains:　ここで、この値をプリントする時、暗黙的に`String`値がアンラップされます。


print(alwaysAString)

/*:

 The important takeaway here is that declaring a variable as implicitly unwrapped allows Swift to _automatically_ unwrap the value whenever it is used. This is the inverse of the usual situation: normally, we use the `!` to force-unwrap a value once we're sure it contains a value. With implicitly unwrapped optionals, we assert from the moment we declare the variable that it will _never_ be `nil` when we use it. That can save us a lot of typing (and visual clutter!) for variables that are accessed frequently. But it's important to be 100% sure that the variable is assigned before it's read the first time, because otherwise accessing it will result in crash.
暗黙的アンラップを使うことで、Swiftは自動的に値をアンラップしてくれます。これは、本来のケースとは逆です。普通は、`!`を強制的アンラップに使います。暗黙的アンラップを使うことで、この値がアクセスする時は必ず`nil`以外になると命令しています。この方法を使うとたくさんのコードを書かなくてすむので、何度もアクセスする値に使うのに便利です。しかし、この値がアクセスされる前に必ず実際に値を含んでいることが100%保証されていなければなりません。
 
 ## オプショナル型を呼ぶメソッド

 In order to call methods on optionals, you must first give Swift something that is non-optional, either through an implicitly unwrapped optional or by force unwrapping the optional where the method is called. Directly accessing an optional causes a compile-time error. Uncomment the following line to see:
 

 */

//let intDescription = maybeAnInt.description // Value of optional type 'Int?' not unwrapped!

/*:

 But we're programmers and we like working around the rules. You don't have to give Swift a non-optional if you use a technique called **optional chaining**. Chaining allows you to try to call a method on an optional. It will call the method if the optional has a value, and returns `nil` if it does not. Chaining is performed by placing a question mark between the variable name and the dot, parenthesis, or bracket that follows it:

 */

let optionalArray: [Int]? = [ 1, 2, 3, 4 ]
let arrayLength = optionalArray?.count
let firstElement = optionalArray?[0]

/*:

 Placing a `?` after the name `optionalArray` will cause Swift to check whether the variable is `nil` before attempting to call `count` or access the array. The types of these expressions are optionals of the same type as the return type of method (so the call to `count`, which normally produces an `Int`, produces an `Int?` in this case). Phew! Still with us?

 - experiment: Set `optionalArray` to `nil` and observe how the output values change.

 ## The Nil Coalescing Operator

 Sometimes we want to use a default value in the place of an optional when it turns out to be `nil`. For example, we might want to provide a placeholder name for an object when its own `name` property is `nil`, or use 0 if an integer is `nil`.

 Swift provides a way to do this very compactly: the nil-coalescing operator (`??`). When the optional to the left of the operator has a value, that value becomes the value of the expression. When the optional is `nil`, the value of the expression is the value on the right of the operator. Let's look at an example:

 */

let optionalString: String? = nil
let petName = optionalString ?? "Fido"

/*:

 So if `optionalString` is not nil, we'll set `petName` to the value of `optionalString`. If it is nil, we'll set `petName` to "Fido".

 ## Recap

 We have looked at some of the capabilities of optionals in Swift. Optionals are a fundamental part of Swift that allow us to be very clear about when variables contain values and when they do not. All of the rules associated with optionals can be confusing at first, but you will quickly gain an intuition by putting your knowledge into practice. The compiler will try to help you along the way, reminding you when you make mistakes.

 - important: When working with optionals, try to prefer _optional binding_ (`if let`) and _optional chaining_ (`?`) instead of using _nil checks_ (`!= nil`) and _force unwrapping_ (`!`).

 When you're done, click Next to move on.

*/
//: [Previous](@previous) | [Next](@next)
