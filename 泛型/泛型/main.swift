//
//  main.swift
//  泛型
//
//  Created by 黄祖明 on 2021/7/29.
//

import Foundation


/**
 
 泛型：
 1、泛型代码能根据自定义的需求，编写出适用于任意类型的、灵活可复用的函数及类型。
 2、避免编写重复的代码，而是用一种清晰抽象的方式来表达代码的意图。

*/



//MARK : - 泛型的使用


//下面是一个标准的非泛型函数 swapTwoInts(_:_:)，用来交换两个 Int 值：
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 1
var anotherInt = 2
swapTwoInts(&someInt, &anotherInt)
print(" someInt = \(someInt) , anotherInt = \(anotherInt)")

//2 1



//字符串交换
func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

//浮点型交换
func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}


//使用泛型
func swapTwoValues<T>(_ a:inout T,_ b:inout T) {
    let temp = a
    a = b
    b = temp
}
///泛型版本的函数使用占位符类型名（这里叫做 T ），而不是 实际类型名（例如 Int、String 或 Double），占位符类型名并不关心 T 具体的类型，但它要求 a 和b 必须是相同的类型，T 的实际类型由每次调用 swapTwoValues(_:_:) 来决定。

var a = 1
var b = 2
swapTwoValues(&a,&b)
print(" a = \(a) , b = \(b)")






//MARK :  - 泛型扩展
///1、当对泛型类型进行扩展时，你并不需要提供类型参数列表作为定义的一部分。
///2、原始类型定义中声明的类型参数列表在扩展中可以直接使用
///3、并且这些来自原始类型中的参数名称会被用作原始定义中类型参数的引用。

//这个一个模仿栈的泛型结构体
struct Stack <Element> {
    var items = [Element]()
   
    mutating func push(_ e:Element){
        items.append(e)
    }
    
    mutating func pop() -> Element{
        
        return items.removeLast()
    }
}

//下面的例子扩展了泛型类型 Stack，为其添加了一个名为 topItem 的只读计算型属性，它将会返回当前栈顶元素且不会将其从栈中移除：
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
    
}
///注意：
///topItem 属性会返回 Element 类型的可选值。当栈为空的时候，topItem 会返回 nil；
///当栈不为空的时候，topItem 会返回 items 数组中的最后一个元素。





//MARK : - 类型约束
/**
 
 swapTwoValues(_:_:) 函数和 Stack 适用于任意类型。
 不过，如果能对泛型函数或泛型类型中添加特定的类型约束，这将在某些情况下非常有用。
 类型约束指定类型参数必须继承自指定类、遵循特定的协议或协议组合。

 例如，Swift 的 Dictionary 类型对字典的键的类型做了些限制。
 在 字典的描述 中，字典键的类型必须是可哈希（hashable）的。也就是说，必须有一种方法能够唯一地表示它。
 字典键之所以要是可哈希的，是为了便于检查字典中是否已经包含某个特定键的值。
 若没有这个要求，字典将无法判断是否可以插入或替换某个指定键的值，也不能查找到已经存储在字典中的指定键的值。

 这个要求通过 Dictionary 键类型上的类型约束实现，它指明了键必须遵循 Swift 标准库中定义的 Hashable 协议。
 所有 Swift 的基本类型（例如 String、Int、Double 和 Bool）默认都是可哈希的。

 当自定义泛型类型时，你可以定义你自己的类型约束，这些约束将提供更为强大的泛型编程能力。
 像 可哈希（hashable） 这种抽象概念根据它们的概念特征来描述类型，而不是它们的具体类型。
 
 */

//类型约束语法
///在一个类型参数名后面放置一个类名或者协议名，并用冒号进行分隔，来定义类型约束。

///下面将展示泛型函数约束的基本语法（与泛型类型的语法相同）:

class SomeClass{}
protocol  SomeProtocol{}

func someFunction<T: SomeClass, U: SomeProtocol>(a: T, b: U) {
    // 这里是泛型函数的函数体部分
}




//类型约束实践

///非泛型函数
func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

//泛型类型约束函数
func findIndex<T:Equatable>(of valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
///Swift 标准库中定义了一个 Equatable 协议，该协议要求任何遵循该协议的类型必须实现等式符（==）及不等符（!=），从而能对该类型的任意两个值进行比较。
///所有的 Swift 标准类型自动支持 Equatable 协议。
///所以函数被调用的时候，传入的类型必须是遵守Equatable协议的

let index = findIndex(of: 1222, in: [1,2,3,3,4,2,32,321,31321,1231321])
if let a = index{
    print("index = \(a)")
}else{
    print("index = nil")
}





//MARK: - 关联类型
///定义一个协议时，声明一个或多个关联类型作为协议定义的一部分将会非常有用。
///关联类型为协议中的某个类型提供了一个占位符名称，其代表的实际类型在协议被遵循时才会被指定。
///关联类型通过 associatedtype 关键字来指定。


protocol Container {
    associatedtype Item
    mutating func append(_ item:Item) // 如果不先声明一个关联类型，这里就无法确定形参的类型
    var count : Int{ get }
    subscript(index:Int) -> Item{ get }
}


//非泛型版本 IntStack 类型，使其遵循 Container 协议：
struct IntStack: Container {
    // IntStack 的原始实现部分
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // Container 协议的实现部分
    typealias Item = Int
    mutating func append(_ item: Item) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}


//使用泛型 Stack 结构体遵循 Container 协议：
struct AllStack<Elemet>:Container{
    var items = [Elemet]()
    mutating func push(_ item:Elemet){
        items.append(item)
    }
    mutating func pop() -> Elemet{
        return items.removeLast()
    }
    
    //typealias Item = Elemet //这里就是确定Item代表的类型，可以省略，并且把类型直接写在函数实现的形参上
   mutating func append(_ item: Elemet) {
    self.push(item)
   }
    
    var count: Int{
        return items.count
    }
    
    subscript(index: Int) -> Elemet {
        return items[index]
    }
}





//MARK: - 给关联类型添加约束
protocol Container2 {
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
///要遵守 Container 协议，Item 类型也必须遵守 Equatable 协议。





//MARK: - 在关联类型约束里使用协议
protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}
///在这个协议里，Suffix 是一个关联类型，就像上边例子中 Container 的 Item 类型一样。
///Suffix 拥有两个约束：它必须遵循 SuffixableContainer 协议（就是当前定义的协议），以及它的 Item 类型必须是和容器里的 Item 类型相同。






//MARK: - 泛型 Where 语句
///类型约束 让你能够为泛型函数、下标、类型的类型参数定义一些强制要求。

///对关联类型添加约束通常是非常有用的。可以通过定义一个泛型 where 子句来实现。
///通过泛型 where 子句让关联类型遵从某个特定的协议，以及某个特定的类型参数和关联类型必须类型相同。
///你可以通过将 where 关键字紧跟在类型参数列表后面来定义 where 子句，where 子句后跟一个或者多个针对关联类型的约束，以及一个或多个类型参数和关联类型间的相等关系。
///你可以在函数体或者类型的大括号之前添加 where 子句。

func allItemsMatch<C1: Container, C2: Container>
    (_ someContainer: C1, _ anotherContainer: C2) -> Bool
    where C1.Item == C2.Item, C1.Item: Equatable {

        /// 检查两个容器含有相同数量的元素
        if someContainer.count != anotherContainer.count {
            return false
        }

        /// 检查每一对元素是否相等
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }

        ///所有元素都匹配，返回 true
        return true
}





//具有泛型 Where 子句的扩展
///你也可以使用泛型 where 子句作为扩展的一部分。
///基于以前的例子，下面的示例扩展了泛型 Stack 结构体，添加一个 isTop(_:) 方法。
extension Stack where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}
