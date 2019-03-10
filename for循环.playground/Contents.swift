//对于不关注的遍历数组中的元素，可以使用 _ 来表示
for _ in 1..<6
{
    print("you get a star")
}
for i in 4..<8
{
print (i)
}
for i in 4...8
{
    print(i)
}
//利用for in循环语句可以遍历数组中的每一个元素
for item in [1,2,3,4]
{
    print (item)
}
//利用for in循环语句可以遍历字符串中的每一个字符
let url = "whehnxnmzm.dxmmx/"
for character in url
{
    print(character)
}
//利用循环语句获得数组中的最小值
let cardNumbers = [
    "Clubs":[22,54,64,74,93,24],
    "Hearts":[34,58,86,89,77,99],
    "Square":[4,67,99,22,45]
]
var min = 1000
for(_,numbers) in cardNumbers
{
    for number in numbers
    {
        if number < min
        {
            min = number
        }
    }
}
print (min)
//switch语句的使用，必须包含  default
let time = 20
var message = ""
switch time
{
    case 7:
       message = "It's time to get up"
    case 8,12,18:
       message = "It's time to eating"
//    使用let 和where 语句，可以对时间的值进行区间判断
    case let x where x > 18 && x <= 24:
       message = "Happy time"
    case 1...6:
        message = "It's time to rest"
    default:
        message = "Keeping busy"
}
//continue的使用
var sum = 0
for i in 1...4
{
  if i == 2
  {
    continue
  }
    sum += i
}
print (sum)

//break 的使用
var m = 0
for i in 1...4
{
    if i == 2
    {
        break
    }
    m += i
}
print (m)

let time1 = 6
var description = "It's "
switch time1
{
    case 2,3,6,7:
        description += "\(time1) o'clock"
        fallthrough
    default:
        description += "."
}
print (description)

