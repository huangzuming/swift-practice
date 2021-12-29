//
//  main.swift
//  集合 Array
//
//  Created by 黄祖明 on 2021/7/12.
//

import Foundation


/**
 
 Swift 语言提供 Arrays、Sets 和 Dictionaries 三种基本的集合类型用来存储集合数据。
 
 数组（Arrays）是有序数据的集。
 集合（Sets）是无序无重复数据的集。
 字典（Dictionaries）是无序的键值对的集。

 */

//MARK:- 创建一个空数组

var arr = [Int]() //构造函数创建

var arr2: [Int] = [] //空数组语句

//打印都是：[]



//MARK:-  创建一个带有默认值的数组
///Swift 中的 Array 类型还提供一个可以创建特定大小并且所有数据都被默认的构造方法
var arrDoubles = Array(repeating:0.0, count:3) //repeating：重复的元素，可以理解为设置默认值
///[0.0, 0.0, 0.0]

print(arrDoubles)


//MARK:-  通过两个数组相加创建一个数组
///可以使用加法操作符（+）来组合两种已存在的相同类型数组
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
// anotherThreeDoubles 被推断为 [Double]，等价于 [2.5, 2.5, 2.5]

var sixDoubles = arrDoubles + anotherThreeDoubles
/// [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]


//MARK:- 用数组字面量构造数组
var shoppingList: [String] = ["Eggs", "Milk"]
//简写：var shoppingList = ["Eggs", "Milk"]





//MARK:- 访问和修改数组
///可以通过数组的方法和属性来访问和修改数组，或者使用下标语法

//使用数组的只读属性 count 来获取数组中的数据项数量：
print("\(shoppingList.count) items.")
///输出“2 items”（这个数组有2个项）

//使用布尔属性 isEmpty 作为一个缩写形式去检查 count 属性是否为 0：
if shoppingList.isEmpty {
    print("empty")
} else {
    print("not empty")
}


//------->添加
//使用 append(_:) 方法在数组后面添加新的数据项：
shoppingList.append("Flour")
///shoppingList 现在有3个数据项


//除此之外，使用加法赋值运算符（+=）也可以直接在数组后面添加一个或多个拥有相同类型的数据项：
shoppingList += ["Baking Powder"]
/// shoppingList 现在有4数据项
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
/// shoppingList 现在有7数据项


//------->替换
//可以利用下标来一次改变一系列数据值，即使新数据和原有数据的数量是不一样的。
shoppingList[4...6] = ["Bananas", "Apples"]
///shoppingList 现在有6项（因为：上面语句意思用2项替换区间内的所有项）


//------->插入
//调用数组的 insert(_:at:) 方法来在某个具体索引值之前添加数据项：
shoppingList.insert("Maple Syrup", at: 0)
///shoppingList 现在有7项
///现在是这个列表中的第一项是“Maple Syrup”


//------->移除
//可以使用 remove(at:) 方法来移除数组中的某一项。
//这个方法把数组在特定索引值中存储的数据项移除并且返回这个被移除的数据项（不需要的时候就可以无视它）：
let mapleSyrup = shoppingList.remove(at: 0)
///索引值为0的数据项被移除
///shoppingList 现在只有6项，而且不包括 Maple Syrup
///mapleSyrup 常量的值等于被移除数据项“Maple Syrup”的值

//可以使用 removeLast() 方法，把数组中的最后一项移除
let apples = shoppingList.removeLast()


//MARK:- 数组的遍历
///我们可以使用 for-in 循环来遍历所有数组中的数据项：
for item in shoppingList {
    print(item)
}


//需要每个数据项的值和索引值，可以使用 enumerated() 方法来进行数组遍历
for (index,value) in shoppingList.enumerated(){
    print("index = \(index) value = \(value)")
}
