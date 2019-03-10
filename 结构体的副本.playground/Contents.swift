struct Animal
{
    var name:String
    var age:Int
}
let tiger = Animal(name: "Tiger", age: 2)
//将该对象赋予一个变量，该变量也将具有和对象相同的属性，以及属性的值
var lion = tiger
//结构体对象之间的值，采用的是拷贝的方式，两个对象是相互独立的，一方发生变化，不会对另一方发生变化
lion.name = "Lion"
print(tiger.name)
print(lion.name)

class Person
{
    var name:String
    var age :Int
//    添加一个初始化方法
    init()
    {
       self.name = ""
       self.age = 0
    }
}
//两个对象其实是对同一实例的两个引用，当其中一个发生变化时，另一个也将发生变化
let person = Person()
let person2 = person
person2.name = "Jerry"
print(person.name)
print(person2.name)
//最后使用全等号，来比较对同一个实例进行引用的两个对象。可以看出，这两个对象是完全相同的
person2 === person

class Player
{
    var name:String = "Sam"
    var level:Int = 3
//    添加第三个属性，在尾部添加一对大括号，用来添加需要执行的代码
    var score:Double
    {
//        首先添加一个get语句，当获取分数的值时，返回玩家的级别和2的乘积
        get
        {
           return Double(level) * 2.0
        }
        set(newScore)
        {
            level = Int(newScore) / 2
        }
    }
    
}
var player = Player()
player.score
player.score = 4
player.level
//类的属性还拥有即将设置和完成设置这两个特性，它们将用来监视属性除初始化之外的值变化
class Player1
{
    var name:String = "Sam"
    var level:Int = 3
    var score :Double = 0.0
    {
//        首先添加一个即将设置语句，当即将设置分数的值时，执行改代码
        
        willSet
        {
            if level == 3
            {
                print("Be careful")
            }
            else
            {
                print("Go ahead!")
            }
        }
//        接着添加一个完成设置方法，当完成分数值得设置时，在执行该方法
        didSet
        {
            print("Do something!")
        }
    }
}
var player1 = Player1()
player1.score
player1.score = 12
