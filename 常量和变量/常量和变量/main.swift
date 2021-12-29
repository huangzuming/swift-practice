//
//  main.swift
//  常量和变量
//
//  Created by 黄祖明 on 2021/7/9.
//




/**
 

 1、类名()：创建并初始化一个对象。和oc的 alloc init 效果一样
 2、类名(xxx)：创建并初始化一个对象的构造方法。和oc的alloc initWithFram： 效果一样
 3、swift语句不用加分号，回车就代表语句接受，唯一需要用到的时候就是在一行里写两句语句的时候
 4、类名.类方法名称：类方法的调用。和oc的[类名 类方法名称] 效果一样
 5、swift 中self可以省略，只有在闭包中必须使用，所以建议省略
 6、print() :打印函数。类似OC中的NSLog，而且效率更高
 
 */




/**
 
 苹果极力建议：尽可能使用let，必要时才使用var
 
 注意：1、任何时候两个变量或常量都不会进行隐式转换（所以运算需要强制转换）
      2、小数默认是double（ 双精度
 */


import Foundation


//MARK:- 常量和变量

/// 常量和变量：把一个名字和一个指定类型的值（比如数字 10 或者字符串 "Hello" ）关联起来。
/// 常量的值一旦设定就不能改变，而变量的值可以随意更改。
/// 常量（实质：指针的指针不可变）
/// 变量（实质：指针的指向可变）


//MARK:- 声明常量和变量
///原理：编译器会推断出真实类型
///注意：这种方法只能定义和初始化一起进行
///例子：
let maximumNumberOfLoginAttempts = 10 //常量
var currentLoginAttempt = 0 //变量
///声明一个名字是 maximumNumberOfLoginAttempts 的新常量，并给它一个值 10 。
///声明一个名字是 currentLoginAttempt 的变量并将它的值初始化为 0 。


//可以在一行中声明多个常量或者多个变量，用逗号隔开：
var x1 = 0.0, y1 = 0.0, z1 = 0.0




//MARK:- 类型注解
///当你声明常量或者变量的时候可以加上类型注解（type annotation），说明常量或者变量中要存储的值的类型。
///类型注解：在常量或者变量名后面加上一个冒号和空格，然后加上类型名称
///例子：
let x: Int
x = 100
///注意：常量有类型注解的情况下，有一次赋值的机会（即可以先声明再初始化）


//可以在一行中定义多个同样类型的变量，用逗号分割，并在最后一个变量名之后添加类型注解：
var red, green, blue: Double



//MARK:- 常量和变量的命名
///常量和变量名可以包含任何字符，包括 Unicode 字符：
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
    

///常量与变量名不能包含数学符号，箭头，保留的（或者非法的）Unicode 码位，连线与制表符。
///也不能以数字开头，但是可以在常量与变量名的其他地方包含数字。


//MARK:- 输出常量和变量
///你可以用 print(_:separator:terminator:) 函数来输出当前常量或变量的值:

let friendlyWelcome = "Bonjour"

print(friendlyWelcome)
// 输出“Bonjour!”


///print(_:separator:terminator:) 是一个用来输出一个或多个值到适当输出区的全局函数

///Swift 用字符串插值（string interpolation）的方式把常量名或者变量名当做占位符加入到长字符串中
///原理：用当前常量或变量的值替换这些占位符。将常量或变量名放入圆括号中，并在开括号前使用反斜杠将其转义：
///例子：
print("The current value of friendlyWelcome is \(friendlyWelcome)")


