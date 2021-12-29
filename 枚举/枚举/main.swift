//
//  main.swift
//  枚举
//
//  Created by 黄祖明 on 2021/7/25.
//

import Foundation

//MARK: - 枚举
///枚举为一组相关的值定义了一个共同的类型，使你可以在你的代码中以类型安全的方式来使用这些值。


///如果你熟悉 C 语言，你会知道在 C 语言中，枚举会为一组整型值分配相关联的名称。
///Swift 中的枚举更加灵活，不必给每一个枚举成员提供一个值。
///如果给枚举成员提供一个值（称为原始值），则该值的类型可以是字符串、字符，或是一个整型值或浮点数。



///此外，枚举成员可以指定任意类型的关联值存储到枚举成员中，就像其他语言中的联合体（unions）和变体（variants）。
///你可以在一个枚举中定义一组相关的枚举成员，每一个枚举成员都可以有适当类型的关联值。



//MARK: - 枚举语法
enum SomeEnumeration {
    // 枚举定义放在这里
}




//使用 case 关键字来定义一个新的枚举成员值。
enum CompassPoint {
    case north
    case south
    case east
    case west
}
///与 C 和 Objective-C 不同，Swift 的枚举成员在被创建时不会被赋予一个默认的整型值。
///在上面的 CompassPoint 例子中，north，south，east 和 west 不会被隐式地赋值为 0，1，2 和 3。
///相反，这些枚举成员本身就是完备的值，这些值的类型是已经明确定义好的 CompassPoint 类型。





//多个成员值可以出现在同一行上，用逗号隔开：
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}



//使用
let emumTemp1:CompassPoint = CompassPoint.east

let emumTemp2:CompassPoint = .east //编译器知道了emumTemp2类型，所以可以简写

var enumTemp3 = CompassPoint.west

enumTemp3 = .north //编译器推断出enumTemp3类型，所以可以简写






//MARK: - 使用 Switch 语句匹配枚举值
switch enumTemp3 {

case .north:
    print("north")
case .west:
    print("west")
case .east:
    print("east")
case .south:
    print("south")
    
}
///正如在 控制流 中介绍的那样，在判断一个枚举类型的值时，switch 语句必须穷举所有情况。
///如果忽略了 .west 这种情况，上面那段代码将无法通过编译，因为它没有考虑到 CompassPoint 的全部成员。
///强制穷举确保了枚举成员不会被意外遗漏。




//MARK: - 枚举成员的遍历
///令枚举遵循 CaseIterable 协议。Swift 会生成一个 allCases 属性，用于表示一个包含枚举所有成员的集合。
enum Beverage: CaseIterable {
    case coffee, tea, juice
}


//获取枚举有多少个值
let enumAllCases = Beverage.allCases.count
print(enumAllCases)


//遍历枚举类型所有的值
for temp in Beverage.allCases{
    print(temp)
}




//MARK - 关联值
///有时候把其他类型的值和成员值一起存储起来会很有用。
///这额外的信息称为关联值，并且你每次在代码中使用该枚举成员时，还可以修改这个关联值。
enum Barcode {
    case upc(Int, Int, Int, Int)//关联值类型是4个Int的元组
    case qrCode(String)//关联值类型是String
}


var productBarcode = Barcode.upc(10, 10, 10, 20)
productBarcode = .qrCode("adadadadadsada")


//可以在 switch 的 case 分支代码中提取每个关联值作为一个常量（用 let 前缀）或者作为一个变量（用 var 前缀）来使用：
switch productBarcode {
case .qrCode(let str):
    print("是个二维码:\(str)")//使用关联值
case .upc:
    print("是条形码")//不使用关联值也可以
}


//如果一个枚举成员的所有关联值都被提取为常量，或者都被提取为变量，为了简洁，你可以只在成员名称前标注一个 let 或者 var：
productBarcode = .upc(1, 2, 3, 4)
switch productBarcode {
case let .qrCode(str):
    print("是个二维码:\(str)")//使用关联值
case let .upc(num1,num2,num3,num4):
    print("是条形码:\(num1)\(num2)\(num3)\(num4)")//不使用关联值也可以
}





//MARK: - 原始值
///1、枚举成员可以被默认值（称为原始值）预填充，这些原始值的类型必须相同。
///2、原始值可以是字符串、字符，或者任意整型值或浮点型值。每个原始值在枚举声明中必须是唯一的。
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
///注意：1、原始值和关联值是不同的。原始值是在定义枚举时被预先填充的值，对于一个特定的枚举成员，它的原始值始终不变。
///     2、关联值是创建一个基于枚举成员的常量或变量时才设置的值，枚举成员的关联值可以变化。



//MARK: - 原始值的隐式赋值
///在使用原始值为整数或者字符串类型的枚举时，不需要显式地为每一个枚举成员设置原始值，Swift 将会自动为你赋值。

//当使用整数作为原始值时，隐式赋值的值依次递增 1。如果第一个枚举成员没有设置原始值，其原始值将为 0 开始
enum number:Int{
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
let numberEnum = number.venus.rawValue
///numberEnum = 2


//当使用字符串作为枚举类型的原始值时，每个枚举成员的隐式原始值为该枚举成员的名称。
enum string:String {
    case hzm,mzm,hdm,mxm
}
let name = string.hdm.rawValue
///name = hdm




//MARK: - 使用原始值初始化枚举实例
///如果在定义枚举类型的时候使用了原始值，那么将会自动获得一个初始化方法，这个方法接收一个叫做 rawValue 的参数，参数类型即为原始值类型，返回值则是可选类型的枚举成员或 nil。

if  let i = number(rawValue: 2){
    print(i)
}
///注意：原始值构造器是一个可失败构造器，因为并不是每一个原始值都有与之对应的枚举成员。如果初始化的原始值枚举内并没有对应的值，初始化方法就会返回nil






//MARK - 递归枚举
///递归枚举是一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值。
///使用递归枚举时，编译器会插入一个间接层。

//你可以在枚举成员前加上 indirect 来表示该成员可递归。
enum A {
    case number(Int)
    indirect case addition(A, A)
    indirect case multiplication(A, A)
}

//也可以在枚举类型开头加上 indirect 关键字来表明它的所有成员都是可递归的：

indirect enum B {
    case number(Int)
    case addition(B, B)
    case multiplication(B, B)
}
