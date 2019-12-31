class BinaryNode<Element> {
    var value : Element
    var leftNode: BinaryNode?
    var rightNode: BinaryNode?
    
    init(_ value: Element) {
        self.value = value
    }
    
    var min: BinaryNode {
        return leftNode?.min ?? self
    }
}

struct BinarySearchTree<Element: Comparable> {
    
 private(set) var root: BinaryNode<Element>?
    
    init() { }
}
extension BinarySearchTree: CustomStringConvertible {
    var description: String {
        guard let root = root else {
         return "empty value"
        }
        return String(describing: root)
    }
}

extension BinarySearchTree {
    mutating func remove(_ value: Element) {
        root = remove(node: root,value: value)
    }
    private func remove(node: BinaryNode<Element>?,value: Element) -> BinaryNode<Element>? {
        guard let node = node else {
            return nil
        }
        if value == node.value {
            if node.leftNode == nil && node.rightNode == nil {
                return nil
            }
            if node.leftNode == nil {
                return node.rightNode
            }
            if node.rightNode == nil {
                return node.leftNode
            }
            node.value = (node.rightNode?.min.value)!
            node.rightNode = remove(node: node.rightNode, value: node.value)
            
        }else  if value < node.value {
            node.leftNode = remove(node: node.leftNode, value: value)
        } else {
            node.rightNode = remove(node: node.rightNode, value: value)
        }
        return node
    }
}

extension BinarySearchTree {

mutating func insert(_ value: Element) {
    root = insert(from: root, value: value)
    }
    
    private func insert(from node: BinaryNode<Element>?,value: Element) -> BinaryNode<Element> {
        
        guard let node = node  else {
            return BinaryNode(value)
        }
        if value < node.value {
            node.leftNode = insert(from: node.leftNode, value: value)
        } else {
            node.rightNode = insert(from: node.rightNode, value: value)
        }
       return node
    }
    mutating func contains(_ value: Element) -> Bool {
        var current = root
        while let node = current {
            if node.value == value {
                return true
            }
            if value < node.value {
                current = node.leftNode
            }
            else {
                current = node.rightNode
            }
        }
        return false
    }
}

var bst = BinarySearchTree<Int>()
bst.insert(10)
bst.insert(12)
bst.insert(11)
bst.insert(13)
bst.insert(14)
bst.insert(15)
bst.insert(16)
bst.insert(17)

print(bst.root?.leftNode?.value)
print(bst.contains(34))

