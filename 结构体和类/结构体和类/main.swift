//
//  main.swift
//  结构体和类
//
//  Created by 黄祖明 on 2021/7/25.
//

import Foundation



//MARK: - 结构体和类

///与其他编程语言所不同的是，Swift 并不要求你为自定义的结构体和类的接口与实现代码分别创建文件。
///你只需在单一的文件中定义一个结构体或者类，系统将会自动生成面向其它代码的外部接口。


//MARK: - 结构体和类对比
/**
 Swift 中结构体和类有很多共同点。两者都可以：
 
 定义属性用于存储值
 定义方法用于提供功能
 定义下标操作用于通过下标语法访问它们的值
 定义构造器用于设置初始值
 通过扩展以增加默认实现之外的功能
 遵循协议以提供某种标准功能
 
 
 
 与结构体相比，类还有如下的附加功能：

 继承允许一个类继承另一个类的特征
 类型转换允许在运行时检查和解释一个类实例的类型
 析构器允许一个类实例释放任何其所被分配的资源
 引用计数允许对一个类的多次引用
 
 
 
 类支持的附加功能是以增加复杂性为代价的。作为一般准则，优先使用结构体，因为它们更容易理解，仅在适当或必要时才使用类。实际上，这意味着你的大多数自定义数据类型都会是结构体和枚举。
 */





//MARK: - 结构体和枚举是值类型
/**
 
 值类型是这样一种类型，当它被赋值给一个变量、常量或者被传递给一个函数的时候，其值会被拷贝。

 实际上，Swift 中所有的基本类型：整数（integer）、浮点数（floating-point number）、布尔值（boolean）、字符串（string)、数组（array）和字典（dictionary），都是值类型，其底层也是使用结构体实现的。

 Swift 中所有的结构体和枚举类型都是值类型。这意味着它们的实例，以及实例中所包含的任何值类型的属性，在代码中传递的时候都会被复制。
 
 
 注意

 1、标准库定义的集合，例如数组，字典和字符串，都对复制进行了优化以降低性能成本。
 2、新集合不会立即复制，而是跟原集合共享同一份内存，共享同样的元素。
 3、在集合的某个副本要被修改前，才会复制它的元素。
 4、而你在代码中看起来就像是立即发生了复制。

 */




//MARK: - 类是引用类型
///引用类型在被赋予到一个变量、常量或者被传递到一个函数时，其值不会被拷贝。因此，使用的是已存在实例的引用，而不是其拷贝。





//MARK: - 恒等运算符
/**
 因为类是引用类型，所以多个常量和变量可能在幕后同时引用同一个类实例。（对于结构体和枚举来说，这并不成立。因为它们作为值类型，在被赋予到常量、变量或者传递到函数时，其值总是会被拷贝。）

 判定两个常量或者变量是否引用同一个类实例有时很有用。
 为了达到这个目的，Swift 提供了两个恒等运算符：
 相同（===）
 不相同（!==）
 
 */



//MARK: - 指针
/**
 如果你有 C，C++ 或者 Objective-C 语言的经验，那么你也许会知道这些语言使用指针来引用内存中的地址。
 Swift 中引用了某个引用类型实例的常量或变量，与 C 语言中的指针类似，不过它并不直接指向某个内存地址，也不要求你使用星号（*）来表明你在创建一个引用。
 相反，Swift 中引用的定义方式与其它的常量或变量的一样
*/





//MARK: - 类型定义的语法
struct SomeStructure {
    /// 在这里定义结构体
}
class SomeClass {
    /// 在这里定义类
}




//MARK: - 结构体和类的实例

struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//创建结构体和类实例的语法非常相似：
var someResolution = Resolution()
let someVideoMode = VideoMode()




//MARK: - 属性访问
print(someResolution.width)
print(someVideoMode.frameRate)

//使用点语法为可变属性赋值：
someResolution.width = 100
someVideoMode.frameRate = 200.0
print(someResolution.width)
print(someVideoMode.frameRate)




//MARK: - 结构体类型的成员逐一构造器(结构体)
///所有结构体都有一个自动生成的成员逐一构造器，用于初始化新结构体实例中成员的属性。
let vga = Resolution(width: 100, height: 100)
print(vga.width,vga.height)
///注意：与结构体不同，类实例没有默认的成员逐一构造器。





