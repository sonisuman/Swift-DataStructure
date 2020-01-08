class Node {
    var name: String
    var children: [Node]
    init(name: String) {
        self.name = name
        self.children = []
    }
    func addChild(name: String) -> Node  {
        let node = Node(name: name)
        children.append(node)
        return self
    }
    
    func breathFirstSearch(array: inout [String]) -> [String] {
        var queue = [self]
        while queue.count > 0 {
            let currentNode = queue.removeFirst()
            array.append(currentNode.name)
            for child in currentNode.children {
                queue.append(child)
            }
        }
        return array
    }
}
