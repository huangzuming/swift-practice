//
//  main.swift
//  基本运算
//
//  Created by 黄祖明 on 2021/7/10.
//

import Foundation

//MARK:- 基本运算符
//运算符是检查、改变、合并值的特殊符号或短语。


/**
 Swift 支持大部分标准 C 语言的运算符，为了减少常见编码错误做了部分改进：
 1、赋值符（=）不再有返回值，这样就消除了手误将判等运算符（==）写成赋值符导致代码错误的缺陷。
 2、算术运算符（+，-，*，/，% 等）的结果会被检测并禁止值溢出，以此来避免保存变量时由于变量大于或小于其类型所能承载的范围时导致的异常结果
 3、Swift 还提供了 C 语言没有的区间运算符，例如 a..<b 或 a...b，这方便我们表达一个区间内的数值。
 */



//MARK:- 赋值运算符
//如果赋值的右边是一个多元组，它的元素可以马上被分解成多个常量或变量：
var (t1, t2) = (1, 2)
///现在 x 等于 1，y 等于 2

//与C和OC不同，Swift的赋值操作并不返回任何值。所以下面语句是无效的：
let number1 = 100,number2 = 100
//if number1 = number2 {
//    ///此句错误，因为 x = y 并不返回任何值
//}

//if number1 = number2 并不会返回真假



//MARK:- 空合运算符（Nil Coalescing Operator）
///空合运算符（a ?? b）将对可选类型 a 进行空判断，如果 a 包含一个值就进行解包，否则就返回一个默认值 b。
let x : String? = "hzm"
let xx = (x ?? "mzm")
//注意：？？的优先级特别低，使用时建议用（）增加优先级


//空合运算符是对以下代码的简短表达方法：
x != nil ? x! : xx
///警告：Expression of type 'String' is unused（类型为'String'的表达式未使用）
///注意：如果 x 为非空值（non-nil），那么值 xx 将不会被计算。这也就是所谓的短路求值。



//MARK:- 区间运算符（Range Operators）
///闭区间运算符（a...b）定义一个包含从 a 到 b（包括 a 和 b）的所有值的区间。当然a 的值不能超过 b。
//例子：
for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}
/// 1 * 5 = 5
/// 2 * 5 = 10
/// 3 * 5 = 15
/// 4 * 5 = 20



//MARK:- 半开区间运算符（Range Operators）
///半开区间运算符（a..<b）定义一个从 a 到 b 但不包括 b 的区间。
//例子：
let names = ["Anna", "Alex", "Brian", "Jack"]
for i in 0..<names.count {
    print("第 \(i + 1) 个人叫 \(names[i])")
}
/// 第 1 个人叫 Anna
/// 第 2 个人叫 Alex
/// 第 3 个人叫 Brian
/// 第 4 个人叫 Jack

//数组有 4 个元素，但 0..<count 只数到3（最后一个元素的下标），因为它是半开区间


//MARK:- 单侧区间
///区间操作符有另一个表达形式，可以表达往一侧无限延伸的区间
///例如，一个包含了数组从索引 2 到结尾的所有值的区间。在这些情况下，你可以省略掉区间操作符一侧的值
//例子：
for name in names[2...] {
    print(name)
    ///Brian
    ///Jack
}


for name in names[...2] {
    print(name)
    ///Anna
    ///Alex
    ///Brian
}

for name in names[..<2] {
    print(name)
    ///Anna
    ///Alex
}

