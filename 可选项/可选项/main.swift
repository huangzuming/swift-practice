//
//  main.swift
//  可选项
//
//  Created by 黄祖明 on 2021/7/9.
//


/**
 可选项概念：要么有值，要么为nil
 注意：1、可选项的常量或变量不能直接参与运算
      2、常量没有默认值，变量默认值为nil
 */


import Foundation


//MARK: - 常量 可选项

    ///定义的时候在类型后添加？
    let a : Int? = 100

    print(a!)
    //常量名! 表示对'可选项常量'进行'强制解析' （意思：程序员承诺a有值，如果没有值程序你就崩给我看）
    //如果进行强制解析会输出：Optional(100)
    //而输出： Optional（常量）表示该常量是可选项

    let b:Int?

    b=101
    
    print(b!)

//MARK: - 变量 可选项
    
    ///和常量一样
    var c : String?

    c = "mzmlovehzm"

    print(c!)

//MARK:- 隐式解析可选类型
/**
 可选类型暗示了常量或者变量可以“没有值”。可选可以通过 if 语句来判断是否有值，如果有值的话可以通过可选绑定来解析值。

 有时候在程序架构中，第一次被赋值之后，可以确定一个可选类型总会有值。在这种情况下，每次都要判断和解析可选值是非常低效的，因为可以确定它总会有值。

 这种类型的可选状态被定义为隐式解析可选类型（implicitly unwrapped optionals）。把想要用作可选的类型的后面的问号（String?）改成感叹号（String!）来声明一个隐式解析可选类型。

 当可选类型被第一次赋值之后就可以确定之后一直有值的时候，隐式解析可选类型非常有用。隐式解析可选类型主要被用在 Swift 中类的构造过程中，请参考 无主引用以及隐式解析可选属性。

 一个隐式解析可选类型其实就是一个普通的可选类型，但是可以被当做非可选类型来使用，并不需要每次都使用解析来获取可选值。下面的例子展示了可选类型 String 和隐式解析可选类型 String 之间的区别：
 */

let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // 需要感叹号来获取值

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString  // 不需要感叹号
///你可以把隐式解析可选类型当做一个可以自动解析的可选类型。你要做的只是声明的时候把感叹号放到类型的结尾，而不是每次取值的可选名字的结尾。
//注意：如果你在隐式解析可选类型没有值的时候尝试取值，会触发运行时错误。和你在没有值的普通可选类型后面加一个惊叹号一样。

//你仍然可以把隐式解析可选类型当做普通可选类型来判断它是否包含值：
if assumedString != nil {
    print(assumedString!)
    ///输出“An implicitly unwrapped optional string.”
}


//你也可以在可选绑定中使用隐式解析可选类型来检查并解析它的值：
if let definiteString = assumedString {
    print(definiteString)
    /// 输出“An implicitly unwrapped optional string.”
}
//注意：如果一个变量之后可能变成 nil 的话请不要使用隐式解析可选类型。如果你需要在变量的生命周期中判断是否是 nil 的话，请使用普通可选类型
