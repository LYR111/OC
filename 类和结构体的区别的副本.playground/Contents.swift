//结构体对象之间的值传递，采用的是拷贝的方式，两个对象都是相互独立的，一方发生变化，不会对另一方产生影响
struct Animal
{
    var name :String
    var age :Int
}
let tiger = Animal(name: "Tiger", age: 2)
var lion = tiger
lion.name = "Lion"
print (tiger.name)
print(lion.name)


//两个对象其实是对同一个实例的两个引用，当其中一个发生变化时，另一个也将发生变化
class Person
{
    var name :String
    var age :Int
    init()
    {
        self.name = ""
        self.age = 0
    }
}
let person = Person()
let person2 = person
person2.name = "Jerry"
print (person.name)
print(person2.name)



//get 和set关键字的使用
class Player
{
    var name :String = "sam"
    var level :Int = 3
//    添加第三个属性，作为玩家的分数，并在尾部添加一对大括号，用来添加需要执行的代码
    var score :Double
    {
         get
         {
            return Double(level) * 2.0
         }
         set (newScore)
         {
            level = Int(newScore) / 2
         }
    }
}
 var player = Player()
player.score
player.score = 4
player.level
