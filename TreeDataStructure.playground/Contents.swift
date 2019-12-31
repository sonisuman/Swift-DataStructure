struct Queue<Element> {
    var storage = [Element]()
    var isEmpty: Bool {
        return storage.isEmpty
    }
    @discardableResult
    mutating func enqueue(_ value: Element) -> Bool {
        storage.append(value)
        return true
    }
    mutating func dequeue() -> Element? {
        return isEmpty ? nil : storage.removeFirst()
    }
}


class TreeNode<Element> {
    var value: Element
    var childrens = [TreeNode]()
    init(_ value: Element) {
        self.value = value
    }
    func  add(_ child: TreeNode) {
        childrens.append(child)
    }
}

extension TreeNode where Element: Equatable{
    func forEachTraversal(_ visit: (TreeNode)-> Void) {
       visit(self)
        childrens.forEach {
            $0.forEachTraversal(visit)
        }
    }
    
    func forEachLevelTraversal(_ visit: (TreeNode)-> Void) {
        visit(self)
        var queue = Queue<TreeNode>()
        childrens.forEach {
           queue.enqueue($0)
        }
        while let node = queue.dequeue() {
            visit(node)
            node.childrens.forEach {
                queue.enqueue($0)
            }
        }
    }
    
    func search(_ value: Element) -> TreeNode? {
        var result: TreeNode?
        forEachLevelTraversal { node in
            if node.value == value {
                result = node
            }
        }
        return result
    }
}

var root = TreeNode("RootNode")
var fstchild = TreeNode("fstchild")
var sndChild = TreeNode("sndChild")
root.add(sndChild)
root.add(fstchild)
//print(root)
//root.forEachTraversal {
//    print($0.value)
//}
//root.forEachLevelTraversal {
//    print($0.value)
//}
if let value = root.search("RootNode") {
    print(value.value)

}
