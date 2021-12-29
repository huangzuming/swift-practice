//
//  main.swift
//  属性
//
//  Created by 黄祖明 on 2021/7/27.
//

import Foundation

/**
 属性：属性将值与特定的类、结构体或枚举关联。
 
 存储属性和计算属性：
 1、存储属性会将常量和变量存储为实例的一部分，
 2、计算属性则是直接计算（而不是存储）值。
 3、计算属性可以用于类、结构体和枚举，而存储属性只能用于类和结构体。

 类型属性：
 存储属性和计算属性通常与特定类型的实例关联。但是，属性也可以直接与类型本身关联，这种属性称为类型属性。
 
 
 属性观察器：
 1、可以定义属性观察器来监控属性值的变化，以此来触发自定义的操作。
 2、属性观察器可以添加到类本身定义的存储属性上，也可以添加到从父类继承的属性上。
 */


//MARK: - 存储属性
///1、简单来说，一个存储属性就是存储在特定类或结构体实例里的一个常量或变量。
///2、存储属性可以是变量存储属性（用关键字 var 定义），也可以是常量存储属性（用关键字 let 定义）。



struct oneStruct {
    var age: Int
    let name: String
}

var  man = oneStruct(age: 26, name: "hzm")
man.age = 27
print(man)

struct towStruct {
    var age = 100
    let name = "hzm"
}
var woman = towStruct()
woman.age = 100
print(woman)




//MARK: - 延时加载存储属性(懒加载)
///延时加载存储属性是指当第一次被调用的时候才会计算其初始值的属性。
///在属性声明前使用 lazy 来标示一个延时加载存储属性
///注意：

class A {
    var name:String = "哈哈哈哈哈哈哈哈哈"
}

class B {
    lazy var a = A()
    var dataArr = [String]()
}

let b = B()
b.dataArr.append("啊啊啊啊啊啊啊啊啊啊啊")

print(b.dataArr)
print(b.a.name)

///注意：1、如果一个被标记为 lazy 的属性在没有初始化时就同时被多个线程访问，则无法保证该属性只会被初始化一次。
///     2、必须将延时加载属性声明成变量（使用 var 关键字），因为属性的初始值可能在实例构造完成之后才会得到。而常量属性在构造过程完成之前必须要有初始值，因此无法声明成延时加载。






//MARK: - 计算属性
///计算属性不直接存储值，而是提供一个 getter 和一个可选的 setter，来间接获取和设置其他属性或变量的值。
struct Point {
    var x = 0.0
    var y = 0.0
}
struct Size {
    var width = 0.0
    var height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    
    var center:Point {
        get{
            let x = origin.x+1.0
            let y = origin.y+1.0
            return Point(x: x, y: y)
        }
        
        set(newValue){
            origin.x = newValue.x
            origin.y = newValue.y
        }
    }
    
}


var  R  = Rect(origin: Point(x: 1.0, y: 1.0), size: Size(width: 100, height: 100))

print(R.origin)
print(R.size)

R.center = Point(x: 2.0, y: 2.0)
print(R.center)


///如果整个 getter 是单一表达式，getter 会隐式地返回这个表达式结果。
///如果计算属性的 setter 没有定义表示新值的参数名，则可以使用默认名称 newValue。
struct Rect2 {
    var origin = Point()
    var size = Size()
    
    var center:Point {
        get{
           Point(x: origin.x+1.0, y: origin.y+1.0)
        }
        
        set{
            origin.x = newValue.x
            origin.y = newValue.y
        }
    }
    
}






//MARK: - 只读计算属性
///只有 getter 没有 setter 的计算属性叫只读计算属性。只读计算属性总是返回一个值，可以通过点运算符访问，但不能设置新的值。


//只读计算属性的声明可以去掉 get 关键字和花括号：
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)







//MARK: - 属性观察器
///属性观察器监控和响应属性值的变化，每次属性被设置值的时候都会调用属性观察器，即使新值和当前值相同的时候也不例外。
class StepCounter {
    
    var counter = 0 {
        
        willSet{
            print("newValue = \(newValue)")
        }
        
        didSet{
            print("oldValue = \(oldValue)")
        }
    }
    
}

var step = StepCounter()

step.counter = 100
///newValue = 100
///oldValue = 0

step.counter = 200
///newValue = 200
///oldValue = 100


//当 step 被设置新值的时候，它的 willSet 和 didSet 观察器都会被调用，即使新值和当前值完全相同时也会被调用。
//oldValue和newValue是编译器默认传入的，也可以自定义
class StepCounter2 {
    
    var counter = 0 {
        
        willSet(new){
            print("newValue = \(new)")
        }
        
        didSet(old){
            print("oldValue = \(old)")
        }
    }
    
}






//MARK: - 全局变量和局部变量(存储型变量)
///计算属性和观察属性所描述的功能也可以用于全局变量和局部变量。
///全局变量是在函数、方法、闭包或任何类型之外定义的变量。
///局部变量是在函数、方法或闭包内部定义的变量。

//注意：
///1、全局的常量或变量都是延迟计算的，跟 延时加载存储属性 相似，不同的地方在于，全局的常量或变量不需要标记 lazy 修饰符。
///2、局部范围的常量和变量从不延迟计算。






//MARK: - 类型属性
///实例属性属于一个特定类型的实例，每创建一个实例，实例都拥有属于自己的一套属性值，实例之间的属性相互独立。
///你也可以为类型本身定义属性，无论创建了多少个该类型的实例，这些属性都只有唯一一份。这种属性就是类型属性。
///类型属性用于定义某个类型所有实例共享的数据，比如所有实例都能用的一个常量（就像 C 语言中的静态常量），或者所有实例都能访问的一个变量（就像 C 语言中的静态变量）。
///存储型类型属性可以是变量或常量，计算型类型属性跟实例的计算型属性一样只能定义成变量属性。




//注意：
///1、跟实例的存储型属性不同，必须给存储型类型属性指定默认值，因为类型本身没有构造器，也就无法在初始化过程中使用构造器给类型属性赋值。
///2、存储型类型属性是延迟初始化的，它们只有在第一次被访问的时候才会被初始化。
///3、即使它们被多个线程同时访问，系统也保证只会对其进行一次初始化，并且不需要对其使用 lazy 修饰符。







//MARK: - 类型属性语法
///在 C 或 Objective-C 中，与某个类型关联的静态常量和静态变量，是作为 global（全局）静态变量定义的。
///但是在 Swift 中，类型属性是作为类型定义的一部分写在类型最外层的花括号内，因此它的作用范围也就在类型支持的范围内。
///使用关键字 static 来定义 类型属性 。在为类定义 计算型类型属性 时，可以改用关键字 class 来支持子类对父类的实现进行重写。

//演示了存储型和计算型类型属性的语法：
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}


//获取和设置类型属性的值
///跟实例属性一样，类型属性也是通过点运算符来访问。但是，类型属性是通过类型本身来访问，而不是通过实例

//print(SomeStructure.computedTypeProperty)
//print(SomeEnumeration.computedTypeProperty)
//print(SomeClass.computedTypeProperty)







//模拟实例：

struct AudioChannel {
    static let max = 10
    static var nowCount = 0
    
    var count:Int = 0{
        didSet{
            if count > AudioChannel.max {
                count = AudioChannel.max
            }
            if count > AudioChannel.nowCount {
                AudioChannel.nowCount = count
            }
        }
    }
    
}


var audioChannel1 = AudioChannel()
var audioChannel2 = AudioChannel()

audioChannel1.count = 1
audioChannel2.count = 5
audioChannel1.count = 8
print(AudioChannel.nowCount)
//8

