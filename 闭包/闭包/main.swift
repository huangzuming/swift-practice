//
//  main.swift
//  闭包
//
//  Created by 黄祖明 on 2021/7/15.
//

import Foundation

/**
 
 闭包是自包含的函数代码块，可以在代码中被传递和使用。
 Swift 中的闭包与 C 和 Objective-C 中的代码块（blocks）以及其他一些编程语言中的匿名函数（Lambdas）比较相似。
 
 闭包可以捕获和存储其所在上下文中任意常量和变量的引用。被称为包裹常量和变量。
 Swift 会为你管理在捕获过程中涉及到的所有内存操作。
 
 在 函数 章节中介绍的全局和嵌套函数实际上也是特殊的闭包，闭包采用如下三种形式之一：
 1、全局函数是一个有名字但不会捕获任何值的闭包
 2、嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
 3、闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的匿名闭包

 
 Swift 的闭包表达式拥有简洁的风格，并鼓励在常见场景中进行语法优化，主要优化如下：
 1、利用上下文推断参数和返回值类型
 2、隐式返回单表达式闭包，即单表达式闭包可以省略 return 关键字
 3、参数名称缩写
 4、尾随闭包语法
 
 
 
 闭包表达式语法一般形式：
 { (参数名称：参数类型) -> 返回值类型 in
     代码语句
 }
 注意：
 1、闭包表达式参数 可以是 in-out 参数，但不能设定默认值。
 2、如果你命名了可变参数，也可以使用此可变参数。
 3、元组也可以作为参数和返回值。
 
 */



//MARK: - 闭包表达式语法

///swift 标准库提供了名为 sorted(by:) 的方法，它会基于你提供的排序闭包表达式的判断结果对数组中的值（类型确定）进行排序。
///一旦它完成排序过程，sorted(by:) 方法会返回一个与旧数组类型大小相同类型的新数组，该数组的元素有着正确的排序顺序。
///原数组不会被 sorted(by:) 方法修改。


//sorted(by:) 方法接受一个闭包
///该闭包函数需要传入与数组元素类型相同的两个值，并返回一个布尔类型值来表明当排序结束后传入的第一个参数排在第二个参数前面还是后面。
///如果第一个参数值出现在第二个参数值前面，排序闭包函数需要返回 true，反之返回 false。

let names = ["c", "d", "b", "a", "n"]

//不使用闭包实现排序
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 < s2
}
print("闭包表达式语法:",names.sorted(by: backward))

//使用闭包排序
print("闭包表达式语法:",names.sorted(by: {(s1: String,s2: String) -> Bool in return s1 < s2}))
///单行表达式return可以省略




//MARK: - 根据上下文推断类型
///1、因为排序闭包函数是作为 sorted(by:) 方法的参数传入的，Swift 可以推断其参数和返回值的类型。
///2、sorted(by:) 方法被一个字符串数组调用，因此其参数必须是 (String, String) -> Bool 类型的函数。
///3、这意味着 (String, String) 和 Bool 类型并不需要作为闭包表达式定义的一部分。

//因为所有的类型都可以被正确推断，返回箭头（->）和围绕在参数周围的括号也可以被省略：
print("根据上下文推断类型:",names.sorted(by: {(s1,s2) in  return s1 < s2}))



///注意：
///1、实际上，通过内联闭包表达式构造的闭包作为参数传递给函数或方法时，总是能够推断出闭包的参数和返回值类型。
///2、这意味着闭包作为函数或者方法的参数时，你几乎不需要利用完整格式构造内联闭包。
///3、尽管如此，你仍然可以明确写出有着完整格式的闭包。如果完整格式的闭包能够提高代码的可读性，则我们更鼓励采用完整格式的闭包。



//MARK: -  单表达式闭包的隐式返回
print("单表达式闭包的隐式返回:",names.sorted(by: {(s1,s2) in  s1 < s2}))




//MARK: - 参数名称缩写
///Swift 自动为内联闭包提供了参数名称缩写功能，你可以直接通过 $0，$1，$2 来顺序调用闭包的参数，以此类推。
print("参数名称缩写:",names.sorted(by: {$0 < $1}))




//MARK: - 运算符方法
///实际上还有一种更简短的方式来编写上面例子中的闭包表达式。
///Swift 的 String 类型定义了关于小于号（<）的字符串实现，其作为一个函数接受两个 String 类型的参数并返回 Bool 类型的值。
///而这正好与 sorted(by:) 方法的参数需要的函数类型相符合。

//因此，你可以简单地传递一个小于号，Swift 可以自动推断找到系统自带的那个字符串函数的实现：
print("运算符方法:",names.sorted(by: <))




//MARK: - 尾随闭包
///如果你需要将一个很长的闭包表达式作为最后一个参数传递给函数，将这个闭包替换成为尾随闭包的形式很有用。
///尾随闭包是一个书写在函数圆括号之后的闭包表达式，函数支持将其作为最后一个参数调用。

//在使用尾随闭包时，你不必写出它的参数标签：
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // 函数体部分
}

// 以下是不使用尾随闭包进行函数调用
someFunctionThatTakesAClosure(closure: {
    // 闭包主体部分
})

// 以下是使用尾随闭包进行函数调用
someFunctionThatTakesAClosure() {
    // 闭包主体部分
}


//sorted(by:) 方法传入的闭包可以作为尾随包的形式改写在 ：
print("尾随闭包:",names.sorted(){$0 < $1})


//如果闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，你甚至可以把 () 省略掉：
print("尾随闭包:",names.sorted{$0 < $1})




//MARK: - 值捕获
///闭包可以在其被定义的上下文中捕获常量或变量。
///即使定义这些常量和变量的原作用域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值。

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

///注意：
///incrementer() 函数并没有任何参数，但是在函数体内访问了 runningTotal 和 amount 变量。
///这是因为它从外围函数捕获了 runningTotal 和 amount 变量的引用。
///捕获引用保证了 runningTotal 和 amount 变量在调用完 makeIncrementer 后不会消失，并且保证了在下一次执行 incrementer 函数时，runningTotal 依旧存在。



let  function1 = makeIncrementer(forIncrement: 100)
print("值捕获 function1 :",function1())/// 输出：100
print("值捕获 function1 :",function1())/// 输出：200
print("值捕获 function1 :",function1())/// 输出：300

///注意：
///为了优化，如果一个值不会被闭包改变，或者在闭包创建后不会改变，Swift 可能会改为捕获并保存一份对值的拷贝。
///Swift 也会负责被捕获变量的所有内存管理工作，包括释放不再需要的变量。


//如果你创建了另一个 incrementer函数，它会有属于自己的引用，指向一个全新、独立的：
let  function2 = makeIncrementer(forIncrement: 100)
print("值捕获 function2 :",function2())/// 输出：100





//MARK: - 闭包是引用类型
///函数和闭包都是引用类型。
///无论你将函数或闭包赋值给一个常量还是变量，你实际上都是将常量或变量的值设置为对应函数或闭包的引用
let function3 = function1
print("闭包是引用类型 function3 :",function3())/// 输出：300





//MARK: - 逃逸闭包
///当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。
///当你定义接受闭包作为参数的函数时，你可以在参数名之前标注 @escaping，用来指明这个闭包是允许“逃逸”出这个函数的。
///将一个闭包标记为 @escaping 意味着你必须在闭包中显式地引用 self。
///传递到函数参数 中的闭包是一个非逃逸闭包，这意味着它可以隐式引用 self。



//MARK: - 自动闭包
///自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式。
///这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值。
///这种便利语法让你能够省略闭包的花括号，用一个普通的表达式来代替显式的闭包。

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// 打印出“5”

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
// 打印出“5”

print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count)
// 打印出“4”
