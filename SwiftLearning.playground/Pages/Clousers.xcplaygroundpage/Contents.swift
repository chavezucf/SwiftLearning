import Foundation

var greeting = "Hello, playground"


func add(_ num1: Int, _ num2: Int) -> Int {
    return num1 + num2;
}

let test = add(1, 3);

let c_add: (Int, Int) -> Int = {
    (num1: Int, num2: Int) -> Int in num1 + num2;
}

let c_sub: (Int, Int) -> Int  = {
    (num1: Int, num2: Int) -> Int in num1 - num2;
}

let c_mul: (Int, Int) -> Int = {$0 * $1};

c_add(10,30)


func math (
    _ num1 :Int,
    _ num2 :Int,
    using f: (Int, Int) -> Int
    ) -> Int {
   f(num1, num2)
}


math(10,30, using: c_add)

math(30,10, using: c_sub)

math(10,10, using: c_mul)
