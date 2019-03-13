//扩展就是对一个已有的类，结构体，枚举中添加新的能力，但是不能重写已有的功能
//我们不能对存储类型进行扩展，本节将对类型的计算型属性进行扩展
extension Int
{
    var double :Int
    {
        return self * 2
    }
    var triple:Int
    {
        return self * 3
    }
    var half :Double
    {
        return Double(self)/2.0
    }
}
2.double
2.triple
2.half
////针对方法的扩展
//import UIKit
//struct Point
//{
//    var x = 0.0
//    var y = 0.0
//}
//extension Point
//{
////    给结构体添加一个扩展方法，该方法用来计算与另一个点之间的距离
//    func distance(anotherPoint:Point)->Double
//    {
//        let distanceX = anotherPoint.x - self.x
//        let distanceY = anotherPoint.y - self.y
//        return sqrt(distanceX * distanceX + distanceY * distanceY)
//    }
//}
//let startPoint = Point (x: 0.0, y: 0.0)
//let endPoint = Point(x: 10.0, y: 10.0)
//startPoint.distance(anotherPoint: endPoint)

//定义协议
protocol Walking
{
    func walk()
}
protocol Eating {
    
    func eat()
}
protocol Fighting:Walking {
    func fight()
}
class Animal:Fighting,Eating
{
    var name = "bird"
    var  age = 1
    var damage = 10
    
    func fight() {
        print("Fighting very hard!")
    }
    func walk() {
        print("happily walk")
    }
    func eat() {
        print("happily eat")
    }
    func say()
    {
        print("I am a dove of peace!")
    }
}
var animal = Animal()
animal.damage
animal.fight()
//对类进行扩展，同样可以实现类似的功能增强
extension Animal
{
    var weight:Double
    {
        get{return 15.0}
    }
    func getWeight()->Double
    {
        return 45.6
    }
}
var secondAnimal = Animal()
secondAnimal.say()
secondAnimal.getWeight()
//系统不会自动给变量设置初始值
//var password:Optional<Any>
//声明一个optional的变量
var password :String?
//在对值操作时，判断是否可以响应后面的操作
//当前面的代码无法执行时，就采用双问号后面的值
print(password?.count ?? 0)

