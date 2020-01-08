class Node {
    var name: String
    var childern: [Node]
    init(name: String) {
        self.name = name
        self.childern = []
    }
    func addChild(name: String) {
        let node = Node(name: name)
        childern.append(node)
    }
    
    func breathFirstSearch(array: inout [String]) -> [String] {
        var queue = [self]
        let currentNode = queue.removeFirst()
        array.append(currentNode.name)
        
        for child in currentNode.childern {
            queue.append(child)
        }
        return array
    }
}
