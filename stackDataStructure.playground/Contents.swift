struct Stack<Element> {
    var storage = [Element]()
    init() {}
    
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    mutating func pop(){
        storage.popLast()
    }
}
extension Stack: CustomStringConvertible {
    var description: String {
        let seperator = "========"
        let devider = "========"
        let storageElement = storage.map({"\($0)"}).reversed().joined(separator: "\n")
        return seperator + "\n" + storageElement + "\n" +  devider
    }
}

var stack = Stack<Int>()
stack.push(10)
stack.push(12)
stack.push(13)
stack.push(15)
stack.push(16)
print(stack)
stack.pop()
stack.pop()
print(stack)


