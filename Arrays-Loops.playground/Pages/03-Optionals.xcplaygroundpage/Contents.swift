/*:
 ![Make School Banner](./swift_banner.png)
 # ちょっとした遠回り: オプショナル

 ## 空の値

 もしかしたら、 _空の_ 要素を配列に付け加えるにはどうしたらいいかと考えた人がいるかもしれません。配列は、データの入るバケツのようなものです。では、空のバケツがあってもいいのでは？これを考えるために、配列は少し置いておいて _オプショナル_ について知りましょう。

 
 _オプショナル_ はSwiftの特徴の一つで、空のデータを扱うためのものです。Swiftは無を表す特別な値 - `nil` - を持っています。オプショナルは箱のようなもので、中に何かが入っているか、もしくは何も入っていないか(`nil`)どちらかです。

- note: （メモ)`nil`はよく他のプログラミング言語の`null`と同じように言われます。Swiftは他の言語と比べて値が空であることにすごく厳しい言語で、これによってバグを防ぐのに役立っています。

 ## nil

　_オプショナル_ として定義していれば、Swiftのどんな値も`nil`をセットすることができます。

 */

var mightContainCharacter: Character? = nil

/*:

 `?`マークをつけることで、この値がオプショナル型であることを示します。例えば、値を`Int?`として定義するときは下記のように書きます。
 */

var maybeAnInt: Int? = 15

//: ここでは、値を15として定義していますが、後から`nil`に書き換えても問題ないのです:

maybeAnInt = nil

/*:

 今、`maybeAnInt`は`nil`で、つまり値が空ということです。`maybeAnInt`がもしただのInt型として定義されていたら、`nil`と書き換えることはできません。

 ## OptionalをUnwrapする

 オプショナル型から値を取り出すとき、"unwrap(アンラップ)"すると表現します。これは、箱を開けて中身を確認する作業と似ています。オプショナルの値を`nil`と比較することで、値が実際に入っているかをテストします。もしこれが`nil`と同じでなかったら、この変数は値を含んでいることになります。

 この値を使う時は、**force unwrapping**しなくてはいけません。Force unwrappingは、変数名の後に`!`マークを使うことで完了します。こうすることで、このオプショナルは値が入っているので、安全に読むことができますよ、とSwiftプログラムに伝えることができます。もし間違っていたら、このコードはクラッシュします。下に、`maybeAnInt`は値を持っているかどうかをテストして、もし入っていたらforce unwrapをしてその値をプリントするというコードが書かれています。

 */

if maybeAnInt != nil {
    print("maybeAnInt contains a value, and it is \(maybeAnInt!)")
} else {
    print("maybeAnInt does not contain a value")
}

/*:

 - experiment: (実験)上で定義した`maybeAnInt`の値を`nil`から別の値に変えてみましょう。プリントされる結果が変わるはずです。

 ## Optional Binding

 もっと簡単な方法があります。**optional binding** という方法で、値が存在するかを確認して、そうであれば新しい変数を作りその変数に存在する値を定義します。下のコードは、`definitelyAnInt`という新しい定数を、`maybeAnInt`の値（もし存在すれば）に束縛("bind")しています。

 */

if let definitelyAnInt = maybeAnInt {
    print("maybeAnInt contains a value, and it is \(definitelyAnInt)")
} else {
    print("maybeAnInt does not contain a value")
}

/*:

 - experiment: （実験）`maybeAnInt`を何度か変えてみて、もし`maybeAnInt`に値が入っていれば、 `definitelyAnInt`が同じ値になるかどうかを実験してみましょう。もし値が入っていなければ、`definitelyAnInt`は作られません。

 - important: （重要）Unwrapする時、新しく作る値に同じ変数名を使うことが慣習になっています。この値はif文の中ではunwrapされた状態ですが、if文の外ではオプショナルに戻ります。

 ## Implicitly Unwrapped Optionals　(暗黙的アンラップ型)

 時々、オプショナル型だけどアクセスする時はアンラップ型がいいという値があります。例えば、初めに値を定義する時はオプショナルとして定義して、まずは空のままにしておきますが、その後実際に使う時には必ず値をいれて使うというケースです。このケースを可能にするために、**implicitly unwrapped optional(暗黙的アンラップ型)** として値を宣言します。暗黙的アンラップ型は`!`を使うことで定義できます。こうすると、初めに定義する時は`nil`をいれられますが、そのあとその値にアクセスする時には必ず値が入っている必要があります。
 */

var alwaysAString: String! = nil

/*:

上では`nil`として定義しました。このまま値を入れずに、下のコードを実行するとエラーになります。
 */

//let stringLength = alwaysAString.characters.count

/*:

 - experiment:（実験）上の行をアンコメントして何が起こるか見てみましょう。空の`alwaysAString`にアクセスしようとするため、クラッシュしてしまいます。

 ではここで`nil`ではない値を入れましょう。

 */

alwaysAString = "Now I have a value!"

//: この値を下のようにプリントする時、暗黙的に`String`値がアンラップされます。


print(alwaysAString)

/*:

暗黙的アンラップを使うことで、Swiftは自動的に値をアンラップしてくれます。これは、本来のケースとは逆です。普通は、`!`を強制的アンラップに使います。暗黙的アンラップを使うことで、この値がアクセスする時は必ず`nil`以外になると命令しています。この方法を使うとたくさんのコードを書かなくてすむので、何度もアクセスする値に使うのに便利です。しかし、この値がアクセスされる前に必ず実際に値を含んでいることが100%保証されていなければなりません。
 
 ## オプショナル型のメソッド

 オプショナル型のメソッドを呼び出すためには、オプショナル型でない形にして使う必要があります。つまり、呼び出す時に暗黙的アンラップもしくは強制的アンラップする必要があります。オプショナル型に直接アクセスしようとするとコンパイルタイムエラーが発生してしまうのです。下のコードをアンコメントしてみましょう。

 */

//let intDescription = maybeAnInt.description

/*:

でも、Optional Chaining（オプショナル・チェイニング）というテクニックを使うと、オプショナル型ではない形にする必要がなくなるのです。チェイニングはオプショナルのアクセスを可能にする仕組みです。この仕組みを使うと、オプショナルに値があれば、そのまま呼び出そうとするメソッドを呼び出し、nilであればメソッドを呼び出さず、`nil`を返します。チェイニングは変数名とドットの間、[]とドットの間等に`?`を加えることで可能です。下の例を見てみましょう。

 */

let optionalArray: [Int]? = [ 1, 2, 3, 4 ]
let arrayLength = optionalArray?.count
let firstElement = optionalArray?[0]

/*:

`optionalArray`の後に`?`をつけることで、`count`メソッドを呼び出す前に`optionalArray`が`nil`かどうかを確認してくれます。この時、メソッドの返す値も、オプショナル型になります。（`count`メソッドを使う時、通常は `Int`を返すのですが、この場合は`Int?`を返すということです。）

 - experiment:（実験）`optionalArray`を`nil`にセットし直して、そのあとのコードがどう実行されるか見てみましょう。

 ## Nil Coalescing Operator

 時々、もし使おうとしている変数が`nil`だった時、`nil`の代わりに何かデフォルトの値を使いたい時があります。例えば、数字を表す変数が、`nil`だったら０を使う、といった場合です。

 Swiftはこれを可能にするテクニックを持っています。Nil Coalescing Operator と呼ばれ、`??`マークを使います。`??`の左側にある変数が値を持っていたら、その値を使い、もし`nil`だったら、`??`の右側の値を使います。下の例を見てみましょう。

 */

let optionalString: String? = nil
let petName = optionalString ?? "Fido"

/*:

`optionalString`が`nil`ではなかったら、`petName`は`optionalString`の値にセットされます。もし`optionalString`が`nil`だったら、`petName`は"Fido"にセットされます。

 ここまでで、オプショナルの可能性について色々と見て実験してみましたね。オプショナルはSwiftの基本的で重要な概念です。少し難しい部分があったかもしれませんが、色々な例を見たことで直感的にどういうものなのか感じ取れたでしょうか。

 - important:（重要）オプショナルを使う時、_optional binding_(`if let`)や_optional chaining_(`?`)をできるだけ使うことを推奨します。`!= nil`や _force unwrapping_ (`!`)はあまり使わない）
 
"Next"を押して次へ進みましょう。

*/
//: [Previous](@previous) | [Next](@next)
