 struct LinkedList<Value> {
    var head: Node<Value>?
    var tail: Node<Value>?
    init() { }
    var isEmpty: Bool {
        return head == nil
    }
    mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        let node = Node(value: value)
        tail?.next = node
        tail = node
        
    }
    func node(at index: Int) -> Node<Value>? {
        var currentIndex = 0
        var currentNode = head
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
    }
    mutating func insert(_ value: Value, after node: Node<Value>) {
        node.next = Node(value: value, next: node.next)
    }
    mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    mutating func removeLast() -> Value? {
        guard let head = head else {
                   return nil
               }
        
        guard head.next != nil else {
            return pop()
        }
       
        var current = head
        var prev = head
        
        while let next = current.next {
            prev = current
            current = next
            
           
        }
         prev.next = nil
        tail = prev
        return current.value
        
    }
    mutating func remove(after node: Node<Value>) -> Value {
        defer {
            if node.next === tail {
                tail = node
            }
        }
        node.next = node.next?.next
        return node.next!.value
    }
 }
 
 extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return ("empty list")
        }
        return String(describing: head)
    }
 }
 
 
 class Node<Value> {
    var next: Node?
    var value: Value
    
    init(value: Value, next: Node? = nil) {
        self.next = next
        self.value = value
    }
 }
 
 extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + ""
    }
 }
 
 var list = LinkedList<Int> ()
 list.append(10)
 list.append(15)
 list.append(24)
 list.append(20)
 
 print(list)
 if let node1 = list.node(at: 1) {
   list.remove(after:node1)
       print(list)

   
 }

 
 
 
 
 
 
