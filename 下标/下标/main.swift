//
//  main.swift
//  下标
//
//  Created by 黄祖明 on 2021/7/28.
//

import Foundation


/**
 下标：
 下标可以定义在类、结构体和枚举中，是访问集合、列表或序列中元素的快捷方法。
 
 
 可以使用下标的索引，设置和获取值，而不需要再调用对应的存取方法。
 举例来说，用下标访问一个 Array 实例中的元素可以写作 someArray[index]，访问 Dictionary 实例中的元素可以写作 someDictionary[key]。
 一个类型可以定义多个下标，通过不同索引类型进行重载。下标不限于一维，你可以定义具有多个入参的下标满足自定义类型的需求。

 
 */


//MARK: - 下标语法

///下标允许你通过在实例名称后面的方括号中传入一个或者多个索引值来对实例进行存取。
///语法类似于实例方法语法和计算型属性语法的混合。
///与定义实例方法类似，定义下标使用 subscript 关键字，指定一个或多个输入参数和返回类型；
///与实例方法不同的是，下标可以设定为读写或只读。这种行为由 getter 和 setter 实现，有点类似计算型属性：


class SomeClass {
    var i = 9
    subscript (j:Int) ->Int{
     return 9*j
    }
}


let c = SomeClass()
print(c[100])
//900


//MARK: - 下标选项
///下标可以接受任意数量的入参，并且这些入参可以是任意类型。
///下标的返回值也可以是任意类型。
///下标可以使用可变参数，并且可以提供默认参数数值，但是不能使用输入输出参数。
///一个类或结构体可以根据自身需要提供多个下标实现，使用下标时将通过入参的数量和类型进行区分，自动匹配合适的下标，这就是下标的重载。

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}



//MARK: - 类型下标
///实例下标是在特定类型的一个实例上调用的下标。
///也可以定义一种在这个类型本身上调用的下标。
///这种下标的类型被称作类型下标。可以通过在 subscript 关键字之前写下 static 关键字的方式来表示一个类型下标。
///类可以使用 class 关键字来允许子类重写父类中对那个下标的实现。
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let mars = Planet[4]
print(mars)
