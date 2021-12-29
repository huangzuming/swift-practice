//
//  main.swift
//  集合Set
//
//  Created by 黄祖明 on 2021/7/12.
//

import Foundation

//MARK: - 集合类型语法

///1、Swift 中的 Set 类型被写为 Set<Element>，这里的 Element 表示 Set 中允许存储的类型
///2、和数组不同的是，集合没有等价的简化形式。



//MARK: - 创建集合

//构造函数创建一个空的集合
var sers = Set<String>()
print(sers)


//如果上下文提供了Set的类型信息，就可以通过一个空的数组字面量创建一个空的Set：
sers = []
print(sers)


//用数组字面量创建集合
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]


//一个 Set 类型不能从数组字面量中被单独推断出来，因此 Set 类型必须显式声明。（即需要类型注解声明这是一个Set）
//然而，由于 Swift 的类型推断功能，如果你想使用一个数组字面量构造一个 Set 并且该数组字面量中的所有元素类型相同，那么你无须写出 Set 的具体类型。
//favoriteGenres 的构造形式可以采用简化的方式代替：
var favoriteGenres2: Set = ["Rock", "Classical", "Hip hop"]



//MARK: - 访问和修改一个集合

//Set 中元素的数量，可以使用其只读属性 count：
print(favoriteGenres.count)


//使用布尔属性 isEmpty 作为一个缩写形式去检查 count 属性是否为 0：
if favoriteGenres.isEmpty {
    print("不为空")
}


//调用insert(_:) 方法来添加一个新元素：
sers.insert("hzm")
print(sers)


//调用remove(_:) 方法去删除一个元素，如果该值是该 Set 的一个元素则删除该元素并且返回被删除的元素值，否则如果该 Set 不包含该值，则返回 nil
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)存在")
}

//调用contains(_:) 方法去检查 Set 中是否包含一个特定的值
if favoriteGenres.contains("Funk") {
    print("包含")
}


//MARK: - 遍历一个集合
for temp in favoriteGenres{
    print(temp)
}

let  tempArray = favoriteGenres.sorted()
for genre in tempArray {
    print("\(genre)")
}





//MARK: - 集合操作

/**
 
 使用 intersection(_:) 方法根据两个集合中都包含的值创建的一个新的集合。
 使用 symmetricDifference(_:) 方法根据在一个集合中但不在两个集合中的值创建一个新的集合。
 使用 union(_:) 方法根据两个集合的值创建一个新的集合。
 使用 subtracting(_:) 方法根据不在该集合中的值创建一个新的集合。
 
 */


let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

print(oddDigits.union(evenDigits).sorted())
/// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

print(oddDigits.intersection(evenDigits).sorted())
/// []

print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())
/// [1, 9]

print(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted())
/// [1, 2, 9]




//MARK: - 集合成员关系和相等

/**
 使用“是否相等”运算符（==）来判断两个集合是否包含全部相同的值。
 使用 isSubset(of:) 方法来判断一个集合中的值是否也被包含在另外一个集合中。
 使用 isSuperset(of:) 方法来判断一个集合中包含另一个集合中所有的值。
 使用 isStrictSubset(of:) 或者 isStrictSuperset(of:) 方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。
 使用 isDisjoint(with:) 方法来判断两个集合是否不含有相同的值（是否没有交集）。
 */


let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]


print(houseAnimals.isSubset(of: farmAnimals))
// true
print(farmAnimals.isSuperset(of: houseAnimals))
// true
print(farmAnimals.isDisjoint(with: cityAnimals))
// true
