//
//  main.swift
//  函数
//
//  Created by 黄祖明 on 2021/7/15.
//

import Foundation

//MARK: - 函数的定义与调用
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}
///格式： func 函数名（参数名称：类型） -> 返回值类型{函数体}
///所有的这些信息汇总起来成为函数的定义，并以 func 作为前缀。指定函数返回类型时，用返回箭头 ->（一个连字符后跟一个右尖括号）后跟返回类型的名称的方式来表示。



//无返回值函数
func greet2(person: String) {
    print("Hello, \(person)!")
}
greet2(person: "zm")
// 打印“Hello, Dave!
///2、注意：严格地说，即使没有明确定义返回值，该 greet(Person：) 函数仍然返回一个值。
///没有明确定义返回类型的函数的返回一个 Void 类型特殊值，该值为一个空元组，写成 ()。


//隐式返回的函数
///如果一个函数的整个函数体是一个单行表达式，这个函数可以隐式地返回这个表达式。
func anotherGreeting(for person: String) -> String {
    return "Hello, " + person + "!"
}

func greeting(for person: String) -> String {
    "Hello, " + person + "!"
}
///两个函数效果一样



//多重返回值函数
func minMax(number1: Int,number2: Int) -> (min: Int, max: Int) {
    return (number1, number2)
}
print(minMax(number1: 10, number2: 10))



//可选元组返回类型
///当传入值可能为空时，返回结果就可能为空，所以需要对返回值进行可选项处理
func minMax2(number1: Int?,number2: Int?) -> (min: Int, max: Int)? {
    if number1 == nil || number2 == nil {return nil}
    return (number1!, number2!)
}

///调用的时候需要判断是否为空
if let temp = minMax2(number1: 20, number2: 20){
    print(temp)
}




//MARK: - 函数参数标签和参数名称
///你可以在参数名称前指定它的参数标签，中间以空格分隔：
func someFunction(firstLabel firstParameterName: Int,secondLabel secondParameterName: Int) {
    ///在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
    /// firstLabel 和 secondLabel 是对应的标签
    print("someFunction(\(firstParameterName),\(secondParameterName))")
}

someFunction(firstLabel: 10, secondLabel: 20)


//忽略参数标签
///如果你不希望为某个参数添加一个标签，可以使用一个下划线（_）来代替一个明确的参数标签
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    print("someFunction(\(firstParameterName),\(secondParameterName))")
}
someFunction(1, secondParameterName: 2)

//注意：如果一个参数有一个标签，那么在调用的时候必须使用标签来标记这个参数。




//MARK: - 默认参数值
///可以在函数体中通过给参数赋值来为任意一个参数定义默认值（Deafult Value）。
///当默认值被定义后，调用这个函数时可以忽略这个参数。
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    print("someFunction(\(parameterWithoutDefault),\(parameterWithDefault))")
}

someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6)
someFunction(parameterWithoutDefault: 4)
///一般来说将不带有默认值的参数放在函数参数列表的最前。



//MARK: - 可变参数
///1、一个可变参数（variadic parameter）可以接受零个或多个值。
///2、函数调用时，你可以用可变参数来指定函数参数可以被传入不确定数量的输入值。
///3、通过在变量类型名后面加入（...）的方式来定义可变参数。

func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
print(arithmeticMean(1, 2, 3, 4, 5))
///返回 3.0, 是这 5 个数的平均数。
print(arithmeticMean(3, 8.25, 18.75))
///返回 10.0, 是这 3 个数的平均数。

//注意：一个函数最多只能拥有一个可变参数。



//MARK: - 输入输出参数
///想要一个函数可以修改参数的值，并且想要在这些修改在函数调用结束后仍然存在，那么就应该把这个参数定义为输入输出参数（In-Out Parameters）。
///1、定义一个输入输出参数时，在参数定义前加 inout 关键字。
///2、你只能传递变量给输入输出参数。你不能传入常量或者字面量，因为这些量是不能被修改的。
///3、当传入的参数作为输入输出参数时，需要在参数名前加 & 符，表示这个值可以被函数修改。
///4、输入输出参数不能有默认值，而且可变参数不能用 inout 标记。
func swapTwoInts(_ a: inout Int) {
    a = 2
}
var aa = 100
swapTwoInts(&aa)
print("aa = \(aa)")
///a = 2


//MARK: - 使用函数类型
///在 Swift 中，使用函数类型就像使用其他类型一样。
//例如，你可以定义一个类型为函数的常量或变量，并将适当的函数赋值给它：
func tempSum(_ number1: Int,_ number2: Int) -> Int {number1+number2}
var tempFunction: (Int, Int) -> Int = tempSum
///现在，你可以用 mathFunction 来调用被赋值的函数了：
print("tempFunction = \(tempFunction(1,2))")


//有相同匹配类型的不同函数可以被赋值给同一个变量，就像非函数类型的变量一样：
func tempSum2(_ number1: Int,_ number2: Int) -> Int {number1-number2}
tempFunction = tempSum2
print("tempFunction = \(tempFunction(1,2))")

//就像其他类型一样，当赋值一个函数给常量或变量时，你可以让 Swift 来推断其函数类型：
var tempFunction2 = tempSum2
print("tempFunction2 = \(tempFunction2(1,2))")




//MARK: - 函数类型作为参数类型

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("函数类型作为参数类型 :Result: \(mathFunction(a, b))")
}
printMathResult(tempFunction, 3, 5)


//MARK: - 函数类型作为返回类型
///你可以用函数类型作为另一个函数的返回类型。你需要做的是在返回箭头（->）后写一个完整的函数类型。
func chooseFunction() -> (Int,Int) -> Int {
    return tempFunction
}

var ccc = chooseFunction()
print("函数类型作为返回类型 : ccc = \(ccc(1,2))")




//MARK: - 嵌套函数
///到目前为止本章中你所见到的所有函数都叫全局函数（global functions），它们定义在全局域中。
///你也可以把函数定义在别的函数体中，称作 嵌套函数（nested functions）。
///默认情况下，嵌套函数是对外界不可见的，但是可以被它们的外围函数（enclosing function）调用。
///一个外围函数也可以返回它的某一个嵌套函数，使得这个函数可以在其他域中被使用。
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!
