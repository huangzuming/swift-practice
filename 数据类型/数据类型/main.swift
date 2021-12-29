//
//  main.swift
//  数据类型
//
//  Created by 黄祖明 on 2021/7/10.
//

import Foundation

//MARK: - 整数 Int

/**
 
 Swift 提供了8、16、32和64位的有符号和无符号整数类型。
 1、这些整数类型和 C 语言的命名方式很像，比如8位无符号整数类型是 UInt8，32位有符号整数类型是 Int32 。
 2、就像 Swift 的其他类型一样，整数类型采用大写命名法。

 */


//MARK: - 整数范围
///你可以访问不同整数类型的 min 和 max 属性来获取对应类型的最小值和最大值：
let minValue = UInt8.min  // minValue 为 0，是 UInt8 类型
let maxValue = UInt8.max  // maxValue 为 255，是 UInt8 类型
///min 和 max 所传回值的类型，正是其所对的整数类型（如上例 UInt8, 所传回的类型是 UInt8），可用在表达式中相同类型值旁。


//MARK: - 浮点数 Double
/**
浮点类型比整数类型表示的范围更大，可以存储比 Int 类型更大或者更小的数字。
Swift 提供了两种有符号浮点数类型：

1、Double 表示64位浮点数。当你需要存储很大或者很高精度的浮点数时请使用此类型。
2、Float 表示32位浮点数。精度要求不高的话可以使用此类型。
 
注意：swift 优先使用double
*/


//MARK: - 数值型字面量
/**
 整数字面量可以被写作：
 
 一个十进制数，没有前缀
 一个二进制数，前缀是 0b
 一个八进制数，前缀是 0o
 一个十六进制数，前缀是 0x
 
 */

let decimalInteger = 17
let binaryInteger = 0b10001       // 二进制的17
let octalInteger = 0o21           // 八进制的17
let hexadecimalInteger = 0x11     // 十六进制的17

///等号右边的就是字面量

//MARK: - 整数转换

///需要转换的原因：不同整数类型的变量和常量可以存储不同范围的数字，如果数字超出了常量或者变量可存储的范围，编译的时候会报错
let cannotBeNegative: UInt8 = -1
// UInt8 类型不能存储负数，所以会报错
let tooBig: Int8 = Int8.max + 1
// Int8 类型不能存储超过最大值的数，所以会报错


///因此：
///1、每种整数类型都可以存储不同范围的值，所以你必须根据不同情况选择性使用数值型类型转换。
///2、这种选择性使用的方式，可以预防隐式转换的错误并让你的代码中的类型转换意图变得清晰
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)
///SomeType(ofInitialValue) 是调用 Swift 构造器并传入一个初始值的默认方法。


//注意：结合数字类常量和变量不同于结合数字类字面量。字面量 3 可以直接和字面量 0.14159 相加，因为数字字面量本身没有明确的类型。它们的类型只在编译器需要求值的时候被推测。


//MARK:- 类型别名 typealias
///类型别名（type aliases）就是给现有类型定义另一个名字。你可以使用 typealias 关键字来定义类型别名。

typealias AudioSample = UInt16 //给UInt16 起了个别名为AudioSample
 
var maxAmplitudeFound = AudioSample.min //可以用AudioSample当UInt16使用】



//MARK:- 布尔值 Bool

//Swift 有一个基本的布尔（Boolean）类型，叫做 Bool。布尔值指逻辑上的值
//因为它们只能是真或者假。Swift 有两个布尔常量，true 和 false：

let orangesAreOrange = true
let turnipsAreDelicious = false

//简单使用：
if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}

//错误使用：
let i = 1
if i {
    ///这个例子不会通过编译，会报错
}

//正确使用：
let i = 1
if i == 1 {
    ///这个例子会编译成功
}

//原因：swift逻辑值只有真和假


//MARK:- 元组 tuples
//元组（tuples）把多个值组合成一个复合值。元组内的值可以是任意类型，并不要求是相同类型。

//例子：
//用元组描述描述 HTTP 状态码(404, "Not Found")
let http404Error = (404, "Not Found")
///这个元组类型，即http404Error的类型为 (Int, String)



//你可以把任意顺序的类型组合成一个元组，这个元组可以包含所有类型。只要你想，你可以创建一个类型为 (Int, Int, Int) 或者 (String, Bool) 或者其他任何你想要的组合的元组。
let http404Error2 = (404, "Not Found",0.3)
///类型为：（Int,String,Double）的元组



//你可以将一个元组的内容分解（decompose）成单独的常量和变量，然后你就可以正常使用它们了：
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
/// 输出“The status code is 404”
print("The status message is \(statusMessage)")
/// 输出“The status message is Not Found”

//如果你只需要一部分元组值，分解的时候可以把要忽略的部分用下划线（_）标记：
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
///输出“The status code is 404”


//此外，你还可以通过下标来访问元组中的单个元素，下标从零开始：
print("The status code is \(http404Error.0)")
///输出“The status code is 404”
print("The status message is \(http404Error.1)")
///输出“The status message is Not Found”


//你可以在定义元组的时候给单个元素命名：
let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
///输出“The status code is 200”
print("The status message is \(http200Status.description)")
///输出“The status message is OK”


//注意：当遇到一些相关值的简单分组时，元组是很有用的。元组不适合用来创建复杂的数据结构。
