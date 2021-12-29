//
//  main.swift
//  控制流
//
//  Created by 黄祖明 on 2021/7/13.
//

import Foundation

/**
 
 1、Swift 提供了多种流程控制结构，包括可以多次执行任务的 while 循环，基于特定条件选择执行不同代码分支的 if、guard 和 switch 语句
 2、还有控制流程跳转到其他代码位置的 break 和 continue 语句。
 3、Swift 还提供了 for-in 循环，用来更简单地遍历数组（Array），字典（Dictionary），区间（Range），字符串（String）和其他序列类型。
 
 */


//MARK: - For-In 循环
///你可以使用 for-in 循环来遍历一个集合中的所有元素。
///例如数组中的元素、范围内的数字或者字符串中的字符。

//遍历数组
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}


//遍历字典，字典的每项元素会以 (key, value) 元组的形式返回，你可以在 for-in 循环中使用显式的常量名称来解读 (key, value) 元组
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}


//遍历数字范围。
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
///注意：上面的例子中，index 是一个每次循环遍历开始时被自动赋值的常量。这种情况下，index 在使用前不需要声明，只需要将它包含在循环的声明中，就可以对其进行隐式声明，而无需使用 let 关键字声明


//如果你不需要区间序列内每一项的值，你可以使用下划线（_）替代变量名来忽略这个值：
for _ in 1...100 {
    print("是男人就挑战100次")
}




//MARK: - While 循环

/**
 
 Swift 提供两种 while 循环形式：

 1、while 循环，每次在循环开始时计算条件是否符合；
 2、repeat-while 循环，每次在循环结束时计算条件是否符合。

 
 while 循环格式：
 
 while 条件 {
     语句
 }
 
 
 repeat-while 循环格式：
 
 repeat {
     语句
 } while 条件
 
 
 
 */



//MARK:- 条件语句

/**
 
 Swift 提供两种类型的条件语句：
 
 1、if 语句
 2、switch 语句
 
 */



//MARK:-  if（条件语句）
///1、if的判断语句不需要小括号，但是执行语句必须要花括号
///2、取消了c语言中的非零即真，判断语句中结果只有ture和false
///3、在 if 语句中，条件必须是一个布尔表达式

let a = 1

if a>0 {
    print("a > 0")
}



//MARK:- 三目运算 （条件语句）
///1、条件语句也不需要（）
///2、而且开头不需要 if 关键字
///3、if  条件语句 ? 语句1 : 语句2)   这是错误的写发

let b = 100
b > 1 ? print("b大于1") : print("b小于1")
//这里会出现警告：Will never be executed（意思：永远执行不到）



//MARK:- if let 和 if var （条件语句）
///这是swift特有的

let nameString: String? = "hzm"
let age : Int? = 25

//正常打印（可能会崩，因为是可选项在实际开发中不知道是否为nil）
print(nameString! + "和" + String(age!) + "都有值")

//所以需要判断是否为空
///正常操作
if nameString != nil && age != nil {
    print(nameString! + "和" + String(age!) + "都有值")//因为是可选的，使用打印必须带！强行解包
}

///使用if let
if let n = nameString, var a = age {
    a = 200 //修改a，用于测试age是否被改变
    print(n+"和"+String(a)+"都有值")//不需要强行解包了
}

print(age!)//打印100，age没有被修改

/**
0、语法解释：如果nameString有值就保存到常量n中，且可以用逗号隔开添加下一个判断
1、如果if判断语句中有一个判断是false（即变量或常量的值为nil），就终止下一个的判断，直接退出if语句
2、如果内部修改了值，不会影响外面的值
3、if let 和if var 判断语句中不能出现 &&  ||  != 等逻辑运算符
    
*/



//MARK:-  guard let（条件语句）
///swift 2.0 新增的

guardLetDome()

func guardLetDome() {
    //可以理解和if let 的用途相反
    let nameString:String? = "mzm"
    var age:Int? = 99

    //正常的写法
    ///常量
//    guard  let name = nameString  else { //如果nameString 不为空就跳过当前代码，如果为空就进去代码块，遇到return跳出当前函数或方法
//        print("nameSring 为空")
//        return
//    }

    ///变量
//    age = 98//测试消除警告
//    guard  var a = age  else {
//        print("age 为空")
//        return
//    }

    //因为'guard'条件中声明的变量或常量在其代码块内是不可用的,所以要换成：
    
    ///常量
    guard  nameString != nil  else { //如果nameString 不为空就进行进行下面的代码，如果为空就进去语句内并跳出方法
        print("nameSring 为空")
        return
    }

    ///变量
    age = 98 //测试消除警告
    guard  age != nil  else {
        print("age 为空")
        return
    }

    //结果
    print("这里只有当上面两个属性不为nil才被执行到")

}






//MARK:- switch （条件语句）

/**
与oc的swith不同点：
    1、判断类型不再局限于整型
    2、case间不会穿透，如果是多个值，使用逗号分隔就好
    3、每个case内必须有语句，而case中有语句就不用写break
    4、必须覆盖所有条件，即需要有default
*/

//格式：
let number = "100" //字符串常量
switch number {
    case "99":
        
        print("99")
        
    case "100","98":
        
        print(100)
        
    default:break//没有语句所以需要break
}


//区间匹配
//case 分支的模式也可以是一个值的区间。
//下面的例子展示了如何使用区间匹配来输出任意数字对应的自然语言格式：
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String

switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
/// 输出“There are dozens of moons orbiting Saturn.”


//元组匹配
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}
/// 输出“(1, 1) is inside the box”
///注意：实际上，在这个例子中，点 (0, 0)可以匹配所有四个 case。
///但是，如果存在多个匹配，那么只会执行第一个被匹配到的 case 分支。
///考虑点 (0, 0)会首先匹配 case (0, 0)，因此剩下的能够匹配的分支都会被忽视掉。



//值绑定（Value Bindings）
///case 分支允许将匹配的值声明为临时常量或变量，并且在 case 分支体内使用 —— 这种行为被称为值绑定（value binding），因为匹配的值在 case 分支体内，与临时的常量或变量绑定。

let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("x =  \(x)")
case (0, let y):
    print("y =  \(y)")
case let (x, y):
    print("x = (\(x), y = \(y))")
}
///输出:x = 2
///一旦声明了这些临时的常量，它们就可以在其对应的 case 分支里使用。
///注意: 这个 switch 语句不包含默认分支。这是因为最后一个 case ——case let(x, y) 声明了一个可以匹配余下所有值的元组。这使得 switch 语句已经完备了，因此不需要再书写默认分支。


//Where
///case 分支的模式可以使用 where 语句来判断额外的条件。
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
///输出“(1, -1) is on the line x == -y”



//复合型 Cases
///当多个条件可以使用同一种方法来处理时，可以将这几种可能放在同一个 case 后面，并且用逗号隔开。
///当 case 后面的任意一种模式匹配的时候，这条分支就会被匹配。并且，如果匹配列表过长，还可以分行书写：
let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}
///输出“e is a vowel”



//MARK: - 控制转移语句
/**
 1、控制转移语句改变你代码的执行顺序，通过它可以实现代码的跳转。
 2、Swift 有五种控制转移语句：

 continue
 break
 fallthrough
 return
 throw

 */



//Continue
///1、continue 语句告诉一个循环体立刻停止本次循环，重新开始下次循环。
///2、就好像在说“本次循环我已经执行完了”，但是并不会离开整个循环体。



//Break
///1、break 语句会立刻结束整个控制流的执行。
///2、break 可以在 switch 或循环语句中使用，用来提前结束 switch 或循环语句。




//循环语句中的 break
///当在一个循环体中使用 break 时，会立刻中断该循环体的执行，然后跳转到表示循环体结束的大括号（}）后的第一行代码。
///不会再有本次循环的代码被执行，也不会再有下次的循环产生。




//Switch 语句中的 break
///当在一个 switch 代码块中使用 break 时，会立即中断该 switch 代码块的执行
///并且跳转到表示 switch 代码块结束的大括号（}）后的第一行代码。




//贯穿（Fallthrough）
///在 Swift 里，switch 语句不会从上一个 case 分支跳转到下一个 case 分支中。
///相反，只要第一个匹配到的 case 分支完成了它需要执行的语句，整个 switch 代码块完成了它的执行。
///如果你确实需要 C 风格的贯穿的特性，你可以在每个需要该特性的 case 分支中使用 fallthrough 关键字。
///下面的例子使用 fallthrough 来创建一个数字的描述语句：
let integerToDescribe = 5
var description = 0
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += 1
    fallthrough
default:
    description += 1
}
print(description)
///输出：7
///fallthrough 关键字不会检查它下一个将会落入执行的 case 中的匹配条件。
///fallthrough 简单地使代码继续连接到下一个 case 中的代码，这和 C 语言标准中的 switch 语句特性是一样的。






//带标签的语句(难点)

///在 Swift 中，你可以在循环体和条件语句中嵌套循环体和条件语句来创造复杂的控制流结构。
///并且，循环体和条件语句都可以使用 break 语句来提前结束整个代码块。
///因此，显式地指明 break 语句想要终止的是哪个循环体或者条件语句。
///类似地，如果你有许多嵌套的循环体，显式指明 continue 语句想要影响哪一个循环体也会非常有用。


///为了实现这个目的，你可以使用标签（statement label）来标记一个循环体或者条件语句
///1、对于一个条件语句，你可以使用 break 加标签的方式，来结束这个被标记的语句。
///2、对于一个循环语句，你可以使用 break 或者 continue 加标签，来结束或者继续这条被标记语句的执行。

///声明一个带标签的语句是通过在该语句的关键词的同一行前面放置一个标签，作为这个语句的前导关键字（introducor keyword）并且该标签后面跟随一个冒号。
///下面是一个针对 while 循环体的标签语法，同样的规则适用于所有的循环体和条件语句。

//label name: while condition {
//    statements
//}



let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0

//gameLoop 就是一个标签
gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    switch square + diceRoll {
    case finalSquare:
        //使用标签结束这一轮循环
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        //使用标签结束这一轮循环
        continue gameLoop
    default:
        square += diceRoll
        square += board[square]
    }
}
print("Game over!")
//注意：如果上述的 break 语句没有使用 gameLoop 标签，那么它将会中断 switch 语句而不是 while 循环。
//使用 gameLoop 标签清晰的表明了 break 想要中断的是哪个代码块。





//检测 API 可用性
///Swift 内置支持检查 API 可用性，这可以确保我们不会在当前部署机器上，不小心地使用了不可用的 API。
///编译器使用 SDK 中的可用信息来验证我们的代码中使用的所有 API 在项目指定的部署目标上是否可用。
///如果我们尝试使用一个不可用的 API，Swift 会在编译时报错。


//编译器使用从可用性条件语句中获取的信息去验证，在这个代码块中调用的 API 是否可用：
if #available(iOS 10, macOS 10.12, *) {
    // 在 iOS 使用 iOS 10 的 API, 在 macOS 使用 macOS 10.12 的 API
} else {
    // 使用先前版本的 iOS 和 macOS 的 API
}


//在它一般的形式中，可用性条件使用了一个平台名字和版本的列表：

//if #available(平台名称 版本号, ..., *) {
//    APIs 可用，语句将执行
//} else {
//    APIs 不可用，语句将不执行
//}
