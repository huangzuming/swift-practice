//
//  main.swift
//  继承
//
//  Created by 黄祖明 on 2021/7/28.
//

import Foundation



/**
 
 继承：
 一个类可以继承另一个类的方法，属性和其它特性。
 当一个类继承其它类时，继承类叫子类，被继承类叫超类（或父类）。
 在 Swift 中，继承是区分「类」与其它类型的一个基本特征。

 继承中的方法、属性、下标：
 在 Swift 中，类可以调用和访问超类的方法、属性和下标，并且可以重写这些方法，属性和下标来优化或修改它们的行为。
 Swift 会检查你的重写定义在超类中是否有匹配的定义，以此确保你的重写行为是正确的。

 继承中的观察器：
 可以为类中继承来的属性添加属性观察器，这样一来，当属性值改变时，类就会被通知到。
 可以为任何属性添加属性观察器，无论它原本被定义为存储型属性还是计算型属性。
 
 
  基类：
  不继承于其它类的类，称之为基类
  注意：Swift 中的类并不是从一个通用的基类继承而来的。如果你不为自己定义的类指定一个超类的话，这个类就会自动成为基类。
 
 */


//MARK : - 基类
class Vehicle{
    var currentSpeed = 0.0
    var description:String {
        "currentSpeed = \(currentSpeed)"
    }
    
    func makeNoise(){
        print(description)
    }
}
let someVehicle = Vehicle()
someVehicle.currentSpeed = 1.0
someVehicle.makeNoise()






//MAKR: - 子类生成
///子类生成指的是在一个已有类的基础上创建一个新的类。
///子类继承超类的特性，并且可以进一步完善。
///还可以为子类添加新的特性。


//继承自Vehicle
class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.currentSpeed = 2.0
bicycle.makeNoise()


//继承自Bicycle
class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}
let tandem = Tandem()
tandem.currentSpeed = 3.0
tandem.makeNoise()

//MARK : - 重写
///子类可以为继承来的实例方法，类方法，实例属性，类属性，或下标提供自己定制的实现。这种行为叫重写。


///如果要重写某个特性，你需要在重写定义的前面加上 override 关键字。
///这么做，表明了你是想提供一个重写版本，而非错误地提供了一个相同的定义。
///意外的重写行为可能会导致不可预知的错误，任何缺少 override 关键字的重写都会在编译时被认定为错误。
///override 关键字会提醒 Swift 编译器去检查该类的超类（或其中一个父类）是否有匹配重写版本的声明。
///这个检查可以确保你的重写定义是正确的。





//重写方法
///在子类中，你可以重写继承来的实例方法或类方法，提供一个定制或替代的方法实现。
class Train: Vehicle {
    override func makeNoise() {
        print("momo xiaohuang")
    }
}
let train = Train()
train.makeNoise()



//重写属性
///可以重写继承来的实例属性或类型属性，提供自己定制的 getter 和 setter
///或添加属性观察器，使重写的属性可以观察到底层的属性值什么时候发生改变。


//重写属性的 Getters 和 Setters
///你可以提供定制的 getter（或 setter）来重写任何一个继承来的属性，无论这个属性是存储型还是计算型属性。
///子类并不知道继承来的属性是存储型的还是计算型的，它只知道继承来的属性会有一个名字和类型。
///你在重写一个属性时，必须将它的名字和类型都写出来。这样才能使编译器去检查你重写的属性是与超类中同名同类型的属性相匹配的。
///你可以将一个继承来的只读属性重写为一个读写属性，只需要在重写版本的属性里提供 getter 和 setter 即可。
///但是，你不可以将一个继承来的读写属性重写为一个只读属性。
///如果你在重写属性中提供了 setter，那么你也一定要提供 getter。
///如果你不想在重写版本中的 getter 里修改继承来的属性值，你可以直接通过 super.someProperty 来返回继承来的值，其中 someProperty 是你要重写的属性的名字。

class Car: Vehicle {
    var gear = 1
    //重写一个读写属性
    override var currentSpeed: Double {
        
        set{
            //stting方法把继承的属性重新自定义了
            super.currentSpeed = newValue + 100
        }
        
        get{
            //getting方法把自定义了的属性返回
            return super.currentSpeed
        }
    }
    
    //重写一个只读属性
    override var description: String {
        "Car.description = \(currentSpeed) 重写的方法 "
    }
    
}

let car = Car()
car.currentSpeed = 1.0
car.makeNoise()




//重写属性观察器
///你可以通过重写属性为一个继承来的属性添加属性观察器。这样一来，无论被继承属性原本是如何实现的，当其属性值发生改变时，你就会被通知到。
///你不可以为继承来的常量存储型属性或继承来的只读计算型属性添加属性观察器。这些属性的值是不可以被设置的，所以，为它们提供 willSet 或 didSet 实现也是不恰当。
///此外还要注意，你不可以同时提供重写的 setter 和重写的属性观察器。
///如果你想观察属性值的变化，并且你已经为那个属性提供了定制的 setter，那么你在 setter 中就可以观察到任何值变化了。
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}
let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("gear = \(automatic.gear)")




//防止重写
///你可以通过把方法，属性或下标标记为 final 来防止它们被重写，只需要在声明关键字前加上 final 修饰符即可（例如：final var、final func、final class func 以及 final subscript）。
///任何试图对带有 final 标记的方法、属性或下标进行重写的代码，都会在编译时会报错。在类扩展中的方法，属性或下标也可以在扩展的定义里标记为 final。
///可以通过在关键字 class 前添加 final 修饰符（final class）来将整个类标记为 final 。这样的类是不可被继承的，试图继承这样的类会导致编译报错。

