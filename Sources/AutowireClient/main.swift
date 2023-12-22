import Autowire

let a = 17
let b = 25

let (result, code) = #stringify(a + b)

print("The value \(result) was produced by the code \"\(code)\"")

class Widget {
    let id: String
    let age: Int
    
    init(id: String, age: Int) {
        self.id = id
        self.age = age
    }
}

class Foo {
    let blah: String = "zoo"
    
    
    @Memoize
    let someName: Int = 23
    
    @Memoize
    let widget: Widget = Widget(id: "x", age: 23)
}

let foo = Foo()

print(foo._someName())
