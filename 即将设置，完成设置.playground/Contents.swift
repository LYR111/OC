class Player
{
    var name :String = "Sam"
    var level :Int = 3
    var score :Double = 0.0
    {
        willSet
        {
            if level == 3
            {
                print ("Be careful")
            }
            else
            {
                print ("go ahead")
            }
        }
//        当完成分数值的设定时，执行该方法
        didSet
        {
           print ("Do soething")
        }
    }
}
var player = Player()
player.score
player.score = 12


//类的析构方法，系统会自动释放不再需要的实例，以释放各种资源，在一个类的实例被释放之前，析构函数会被调用
class Animal
{
    var name :String
    var age :Int
    init (name :String ,age :Int)
    {
        self.name = name
        self.age = age
        
    }
    func say()
    {
        print ("I am  \(name)")
    }
    deinit {
        print ("I am deinited")
    }
}
var animal :Animal? = Animal(name: "Jerry", age: 33)
animal?.say()

//下标是访问集合，列表，序列中的元素的快捷方式，结构体，枚举和类都可以定义下标
class Person
{
}
