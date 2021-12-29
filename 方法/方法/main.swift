//
//  main.swift
//  方法
//
//  Created by 黄祖明 on 2021/7/28.
//

import Foundation
//MARK: - 方法

/**
 方法：
 方法是与某些特定类型相关联的函数。
 
 
 实例方法：
 类、结构体、枚举都可以定义实例方法；实例方法为给定类型的实例封装了具体的任务与功能。
 类、结构体、枚举也可以定义类型方法；类型方法与类型本身相关联。类型方法与 Objective-C 中的类方法（class methods）相似。
 
 区别：
 结构体和枚举能够定义方法是 Swift 与 C/Objective-C 的主要区别之一。
 在 Objective-C 中，类是唯一能定义方法的类型。但在 Swift 中，不仅能选择是否要定义一个类/结构体/枚举，还能灵活地在你创建的类型（类/结构体/枚举）上定义方法。
*/



//MARK: - 实例方法（Instance Methods）
///1、实例方法是属于某个特定类、结构体或者枚举类型实例的方法。
///2、实例方法提供访问和修改实例属性的方法或提供与实例目的相关的功能，并以此来支撑实例的功能。
///3、实例方法的语法与函数完全一致


//语法：
///实例方法要写在它所属的类型的前后大括号之间。
///实例方法能够隐式访问它所属类型的所有的其他实例方法和属性。
///实例方法只能被它所属的类的某个特定实例调用。
///实例方法不能脱离于现存的实例而被调用。


class Counter {
    var counter = 0
    
    func increment() {
        counter+=1
    }
    
    func increment(by addNumber:Int) -> Void {
        counter+=addNumber
    }
    
    func reset() -> Int {
        return counter
    }
    
}

let c = Counter()
c.increment()
print(c.counter)//1

c.increment(by: 100)
print(c.counter)//101

print(c.reset())//101

//小提示：1、函数参数可以同时有一个局部名称（在函数体内部使用）和一个外部名称（在调用函数时使用）
//       2、方法参数也一样，因为方法就是函数，只是这个函数与某个类型相关联了。




//MARK: - self 属性
///类型的每一个实例都有一个隐含属性叫做 self，self 完全等同于该实例本身。
///可以在一个实例的实例方法中使用这个隐含的 self 属性来引用当前实例。


///实际上，你不必在你的代码里面经常写 self。
///不论何时，只要在一个方法中使用一个已知的属性或者方法名称，如果你没有明确地写 self，Swift 假定你是指当前实例的属性或者方法。
///使用这条规则的主要场景是实例方法的某个参数名称与实例的某个属性名称相同的时候。
///在这种情况下，参数名称享有优先权，并且在引用属性时必须使用一种更严格的方式。
///这时你可以使用 self 属性来区分参数名称和属性名称。


struct Point {
    var x = 0.0,y = 0.0
    
    func isToTheRightOf(x:Double) -> Bool {
        return self.x>x
    }
    
}

let p = Point()
print(p.isToTheRightOf(x: 2))//false







//MARK: - 在实例方法中修改值类型
///结构体和枚举是值类型。默认情况下，值类型的属性不能在它的实例方法中被修改。


///如果需要在某个特定的方法中修改结构体或者枚举的属性，可以为这个方法选择 可变（mutating）行为，然后就可以从其方法内部改变它的属性；
///并且这个方法做的任何改变都会在方法执行结束时写回到原始结构中。
///方法还可以给它隐含的 self 属性赋予一个全新的实例，这个新实例在方法结束时会替换现存实例。


//要使用 可变方法，将关键字 mutating 放到方法的 func 关键字之前就可以了：

struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x newX:Double,y newY:Double){
        x+=newX
        y+=newY
    }
}

var p2 = Point2(x: 0.1, y: 0.1)
print(p2)
///Point(x: 0.1, y: 0.1)

p2.moveBy(x: 1.0, y: 1.0)
print(p2)
///Point2(x: 1.1, y: 1.1)

//注意，不能在结构体类型的常量（a constant of structure type）上调用可变方法，因为其属性不能被改变，即使属性是变量属性，





//可变方法能够赋给隐含属性 self 一个全新的实例。
struct Point3 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x newX:Double,y newY:Double){
        self = Point3(x: x+newX, y: y+newY)
    }
}
var p3 = Point3(x: 0.1, y: 0.1)
p3.moveBy(x: 1.0, y: 1.0)
print(p3)
///Point3(x: 1.1, y: 1.1)





//枚举的可变方法可以把 self 设置为同一枚举类型中不同的成员：

enum TriStateSwitch {
    case off, low, high
    
    mutating func next(){
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var t = TriStateSwitch.off
t.next()
print(t)
///low





//MARK: - 类型方法
///实例方法是被某个类型的实例调用的方法。
///你也可以定义在类型本身上调用的方法，这种方法就叫做类型方法。
///在方法的 func 关键字之前加上关键字 static，来指定类型方法。
///类还可以用关键字 class 来指定，从而允许子类重写父类该方法的实现

class SomeCalss {
    static func someFunc(){
        print("someFunc")
    }
}

SomeCalss.someFunc()


struct SomeStruct {
    static var number = 0
    var current = 1
    
    
    static func unlock(_ level: Int){
        number = level
    }
    
    static func isUnlocked(_ level: Int) -> Bool{
        return level<=number
    }
    
    
    mutating func advance(_ level:Int) ->Bool{
        if SomeStruct.isUnlocked(level) {
            current = level
            return true
        }else{
            return false
        }
    }
}
