//
//  main.swift
//  集合Dictionary
//
//  Created by 黄祖明 on 2021/7/12.
//

import Foundation



//MARK:- 字典
/**
 
 1、字典是一种存储多个相同类型的值的容器。每个值（value）都关联唯一的键（key）
 2、键作为字典中的这个值数据的标识符。和数组中的数据项不同，字典中的数据项并没有具体顺序。
 3、我们在需要通过标识符（键）访问数据的时候使用字典，这种方法很大程度上和我们在现实世界中使用字典查字义的方法一样
 
 */



//MARK:- 字典类型简化语法
///Swift 的字典使用 Dictionary<Key, Value> 定义，其中 Key 是字典中键的数据类型，Value 是字典中对应于这些键所存储值的数据类型。
///我们也可以用 [Key: Value] 这样简化的形式去创建一个字典类型
///注意：一个字典的 Key 类型必须遵循 Hashable 协议，就像 Set 的值类型。




//MARK:- 创建一个空字典
///可以像数组一样使用构造语法创建一个拥有确定类型的空字典：
var namesOfIntegers = [Int: String]()


//如果上下文已经提供了类型信息，我们可以使用空字典字面量来创建一个空字典，记作 [:]（中括号中放一个冒号）：
namesOfIntegers = [:]
///namesOfIntegers 又成为了一个 [Int: String] 类型的空字典



//MARK:- 用字典字面量创建字典
var names: [String: String] = ["hzm": "26", "mzm": "26"]
///names 字典被声明为一种 [String: String] 类型，这意味着这个字典的键和值都是 String 类型。



//和数组一样，我们在用字典字面量构造字典时，如果它的键和值都有各自一致的类型，那么就不必写出字典的类型。 简短方式定义：
var names2 = ["hzm": "26", "mzm": "26"]



//MARK:-  访问和修改字典
///可以通过字典的方法和属性来访问和修改字典，或者通过使用下标语法。

//-------------------------创建----------------------------
///同样拥有只读属性count属性
print(names.count)

///同样拥有布尔属性 isEmpty
print(names.isEmpty)


///可以在字典中使用下标语法来添加新的数据项。使用一个恰当类型的键作为下标索引，并且分配恰当类型的新值：
names["hyy"] = "0"


///可以使用下标语法修改值：
names["hyy"] = "1"

//-------------------------修改-----------------------------
///作为另一种下标方法，字典的 updateValue(_:forKey:) 方法可以设置或者更新特定键对应的值。
///就像上面所示的下标示例，updateValue(_:forKey:) 方法在这个键不存在对应值的时候会设置新值或者在存在时更新已存在的值。
///和上面的下标方法不同的，updateValue(_:forKey:) 这个方法返回更新值之前的原值。
///这样使得我们可以检查更新是否成功。

if let old = names.updateValue("19", forKey: "mzm"){
    print("old = \(old)")
}else{
    print("old = nil ")//原本字典里没有这个键
}



//可以使用下标语法来在字典中检索特定键对应的值
if let temp = names["mzm"]{
    print("temp = \(temp)")
}else{
    print("temp = nil ")//原本字典里没有这个键
}



//-------------------------移除-----------------------------
//可以使用下标语法来通过给某个键的对应值赋值为 nil 来从字典里移除一个键值对：
names["mzm"] = nil
///打印：["hyy": "1", "hzm": "26"]


//removeValue(forKey:) 方法也可以用来在字典中移除键值对。
//这个方法在键值对存在的情况下会移除该键值对并且返回被移除的值或者在没有值的情况下返回 nil：
if let removeTemp = names.removeValue(forKey: "mzm") {
    print("\(removeTemp) 存在，并移除成功！")
}else{
    print("不存在，移除失败！")
}


//MARK:- 字典遍历
///我们可以使用 for-in 循环来遍历某个字典中的键值对。
///每一个字典中的数据项都以 (key, value) 元组形式返回，并且我们可以使用临时常量或者变量来分解这些元组：

for (key,value) in names{
    print("key = \(key), value = \(value)")
}


//通过访问 keys 或者 values 属性，可以遍历字典的键或者值：
for k in names.keys{
    print("k = \(k)")
}
//通过访问 keys 或者 values 属性，可以遍历字典的键或者值：
for v in names.values{
    print("v = \(v)")
}

//可以直接使用 keys 或者 values 属性构造一个新数组：
let nameArray = [String](names.keys)
let ageArray = [String](names.values)
