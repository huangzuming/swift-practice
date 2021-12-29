//
//  main.swift
//  字符串和字符
//
//  Created by 黄祖明 on 2021/7/10.
//

import Foundation


//MARK:- 字符串 String
/**
 字符串是一系列字符的集合
 Swift 的字符串通过 String 类型来表示
 Swift 的 String 和 Character 类型提供了一种快速且兼容 Unicode 的方式来处理代码中的文本内容
 Swift 的 String 类型与 Foundation NSString 类进行了无缝桥接
 Swift 的 String 类型实质是一个结构体，所以它比NSString轻量，更高效
 */


//MARK:- 字符串字面量
///使用了字面量方式进行初始化
let someString = "Some string literal value"


//MARK:- 多行字符串字面量
///如果你需要一个字符串是跨越多行的，那就使用多行字符串字面量
///由一对三个双引号包裹着的具有固定顺序的文本字符集：
let stringName1 = "hzm mzm"
let stringName2 = """
hzm
mzm
"""
///hzm mzm
///hzm
///mzm


//为了让一个多行字符串字面量开始和结束于换行符，请将换行写在第一行和最后一行，例如：
let stringName3 = """

hzm
mzm

"""

print(stringName3)



//MARK: - 字符串字面量的特殊字符
///转义字符 \0(空字符)、\\(反斜线)、\t(水平制表符)、\n(换行符)、\r(回车符)、\"(双引号)、\'(单引号)。
///Unicode 标量，写成 \u{n}(u 为小写)，其中 n 为任意一到八位十六进制数且可用的 Unicode 位码。

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
/// "Imageination is more important than knowledge" - Enistein
let dollarSign = "\u{24}"
/// $，Unicode 标量 U+0024
let blackHeart = "\u{2665}"
/// ♥，Unicode 标量 U+2665
let sparklingHeart = "\u{1F496}"
/// 💖，Unicode 标量 U+1F496


//由于多行字符串字面量使用了三个双引号，而不是一个，所以你可以在多行字符串字面量里直接使用双引号（"）而不必加上转义符（\）。
//要在多行字符串字面量中使用 """ 的话，就需要使用至少一个转义符（\）：
let threeDoubleQuotes = """

mmm\"""
mmm\"\"\"

"""
///mmm"""
///mmm"""




//MARK: - 初始化空字符串
var emptyString = ""               // 空字符串字面量
var anotherEmptyString = String()  // 初始化方法
/// 两个字符串均为空并等价。


//可以通过检查 Bool 类型的 isEmpty 属性来判断该字符串是否为空：

if emptyString.isEmpty{
    print("这是一个空的字符串")
}
// 打印输出：这是一个空的字符串



//MARK: - 字符串可变性
//通过将一个特定字符串分配给一个变量来对其进行修改
var variableString = "Horse"
variableString += " and carriage"
// variableString 现在为 "Horse and carriage"

//let constantString = "Highlander"
//constantString += " and another Highlander"
//// 这会报告一个编译错误（compile-time error） - 常量字符串不可以被修改。



//MARK: - 字符串是值类型
/**
 在 Swift 中 String 类型是值类型。
 如果你创建了一个新的字符串，那么当其进行常量、变量赋值操作，或在函数/方法中传递时，会进行值拷贝。
 在前述任一情况下，都会对已有字符串值创建新副本，并对该新副本而非原始字符串进行传递或赋值操作。
 值类型在 结构体和枚举是值类型 中进行了详细描述。
 */



//MARK: -  使用字符
///可通过 for-in 循环来遍历字符串，获取字符串中每一个字符的值：
for  character in "hzmlovemzm"{
    print(character)
}

//通过标明一个 Character 类型并用字符字面量进行赋值，可以建立一个独立的字符常量或变量：
let exclamationMark: Character = "c"


//通过传递一个值类型为 Character 的数组创建字符串：
let cArray: [Character] = ["h","z","m","l","o","v","e","m","z","m"]
let  cString = String(cArray)
print(cString)
///打印：hzmlovemzm



//MARK: - 连接字符串和字符
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
// welcome 现在等于 "hello there"


var instruction = "look over"
instruction += string2
// instruction 现在等于 "look over there"


//也可以用 append() 方法将一个字符附加到一个字符串变量的尾部：
let characterMark: Character = "!"
welcome.append(characterMark)
// welcome 现在等于 "hello there!"


//注意：不能将一个字符串或者字符添加到一个已经存在的字符变量上，因为字符变量只能包含一个字符




//MARK:- Unicode 标量
///Unicode 标量是对应字符或者修饰符的唯一的 21 位数字
///例如 U+0061 表示小写的拉丁字母（"a"），U+1F425 表示小鸡表情（"🐥"）。

//注意:并非所有 21 位 Unicode 标量值都分配给字符，某些标量被保留用于将来分配或用于 UTF-16 编码。




//MARK:- 可扩展的字形群集
///每一个 Swift 的 Character 类型代表一个可扩展的字形群。
///而一个可扩展的字形群构成了人类可读的单个字符，它由一个或多个（当组合时） Unicode 标量的序列组成。

//例如：
let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e 后面加上
/// eAcute 是 é, combinedEAcute 是 é





//MARK:- 计算字符数量
//如果想要获得一个字符串中 Character 值的数量，可以使用 count 属性：
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print(unusualMenagerie.count)
///打印输出40

/**
注意：
1、Swift 中，使用可拓展的字符群集作为 Character 值来连接或改变字符串时，并不一定会更改字符串的字符数量。
2、 count 属性返回的字符数量并不总是与包含相同字符的 NSString 的 length 属性相同。
3、NSString 的 length 属性是利用 UTF-16 表示的十六位代码单元数字，而不是 Unicode 可扩展的字符群集。
 */




//MARK:- 字符串插值
///字符串插值是一种构建新字符串的方式，可以在其中包含常量、变量、字面量和表达式。
///字符串字面量和多行字符串字面量都可以使用字符串插值。你插入的字符串字面量的每一项都在以反斜线为前缀的圆括号中：
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
/// message 是 "3 times 2.5 is 7.5"
//注意:插值字符串中写在括号中的表达式不能包含非转义反斜杠（\），并且不能包含回车或换行符。不过，插值字符串可以包含其他字面量。




//MARK:- 访问和修改字符串（字符串索引）

///每一个 String 值都有一个关联的索引（index）类型，String.Index，它对应着字符串中的每一个 Character 的位置。
///不同的字符可能会占用不同数量的内存空间，所以要知道 Character 的确定位置，就必须从 String 开头遍历每一个 Unicode 标量直到结尾。
///因此，Swift 的字符串不能用整数（integer）做索引。
///而是使用  String.Index  类型来获取字符串的字符。


///使用String的 startIndex 属性可以获取一个 String 的第一个 Character 的索引（String.Index类型）。
///使用String的 endIndex 属性可以获取最后一个 Character 的后一个位置的索引（String.Index类型）。
///因此String的，endIndex 属性不能作为一个字符串的有效下标。
///如果 String 是空串，startIndex 和 endIndex 是相等的。


//通过字符串索引获取字符
let greeting = "Guten Tag!"
let start = greeting[greeting.startIndex]
/// G


//通过调用 String 的 index(before:) 或 index(after:) 方法，可以立即得到前面或后面的一个索引。

let before = greeting[greeting.index(before: greeting.endIndex)]
/// !
let after = greeting[greeting.index(after: greeting.startIndex)]
/// u

//通过调用 String 的 index(_:offsetBy:) 方法来获取对应偏移量的索引
let index = greeting.index(greeting.startIndex, offsetBy: 7)
let indexString = greeting[index]
/// a


//使用 indices 属性会创建一个包含全部索引的范围（Range），用来在一个字符串中访问单个字符。
for index in greeting.indices{
    print("\(greeting[index])") //获取到所以Character
}


//注意：你可以使用 startIndex 和 endIndex 属性或者 index(before:) 、index(after:) 和 index(_:offsetBy:) 方法在任意一个确认的并遵循 Collection 协议的类型里面，如上文所示是使用在 String 中，你也可以使用在 Array、Dictionary 和 Set 中。


//MARK:- 访问和修改字符串（插入和删除）
//调用 insert(_:at:) 方法可以在一个字符串的指定索引插入一个字符
var welcomeTo = "hello"
welcomeTo.insert("!", at: welcomeTo.endIndex)
print(welcomeTo)
///welcomeTo 变量现在等于 "hello!"


//调用 insert(contentsOf:at:) 方法可以在一个字符串的指定索引插入一个段字符串。
welcomeTo.insert(contentsOf:" there", at: welcomeTo.index(before: welcomeTo.endIndex))
print(welcomeTo)
///welcome 变量现在等于 "hello there!"


//调用 remove(at:) 方法可以在一个字符串的指定索引删除一个字符
welcomeTo.remove(at: welcomeTo.index(before: welcomeTo.endIndex))
print(welcomeTo)
// welcome 现在等于 "hello there"



//调用 removeSubrange(_:) 方法可以在一个字符串的指定索引删除一个子字符串。
let range = welcomeTo.index(welcomeTo.endIndex, offsetBy: -6)..<welcomeTo.endIndex

welcomeTo.removeSubrange(range)
print(welcomeTo)
// welcome 现在等于 "hello"




//MARK:- 子字符串
///从字符串中获取一个子字符串
let greeting2 = "Hello, world!"

//firstIndex(of:)方法：从字符串中查找传入的字符，并返回第一相同字符的string.index 如果没有查找到就返回nil
let index2 = greeting2.firstIndex(of: ",") ?? greeting2.endIndex

//beginning 保存的是greeting2同一内存下区间内的内容
let beginning = greeting2[..<index]
/// beginning 的值为 "Hello"

// 所以把结果转化为 String 以便长期存储。
let newString = String(beginning)




//MARK:- 比较字符串 (字符串/字符相等)
///Swift 提供了三种方式来比较文本值：字符串字符相等、前缀相等和后缀相等。
///
///字符串/字符可以用等于操作符（==）和不等于操作符（!=）
let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("相同")
}
// 打印：相同

//注意：如果两个字符串（或者两个字符）的可扩展的字形群集是标准相等，那就认为它们是相等的。只要可扩展的字形群集有同样的语言意义和外观则认为它们标准相等，即使它们是由不同的 Unicode 标量构成。



//MARK:- 比较字符串 （前缀/后缀相等）

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]


//通过调用字符串的 hasPrefix(_:)获取前缀
var tempCount:Int = 0
for temp in romeoAndJuliet{
    if temp.hasPrefix("Act 1") {
        tempCount+=1
    }
}
print(tempCount)
/// 打印：5


///通过调用字符串的hasSuffix(_:) 方法来检查字符串是否拥有特定后缀
var cellCount = 0
for scene in romeoAndJuliet {
     if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print(cellCount)
/// 打印：2
