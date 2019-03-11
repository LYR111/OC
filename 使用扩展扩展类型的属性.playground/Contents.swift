//扩展可以对一个类型添加新的功能，但是不能重写已有的功能
extension Int
{
    var double:Int
    {
        return self * 2
    }
    var triple:Int
    {
        return self * 3
    }
    var fourfold:Int
    {
        return self * 4
    }
    var half:Double
    {
        return Double(self)/2.0
    }
}
print(2.double)
print(2.half)
//针对方法的扩展
import UIKit
struct Point
{
    var x = 0.0
    var y = 0.0
}
//然后对结构体对象进行扩展
extension Point
{
    func distance(anotherPoint:Point) -> Double
    {
      let distanceX = anotherPoint.x - self.x
      let distanceY = anotherPoint.y - self.y
        return sqrt(distanceX * distanceX + distanceY * distanceY)
    }
}
//在扩展方法之前，首先定义一个结构体的对象

let startPoint = Point(x: 0.0, y: 0.0)
let endPoint = Point(x: 10.0, y: 10.0)
startPoint.distance(anotherPoint: endPoint)
