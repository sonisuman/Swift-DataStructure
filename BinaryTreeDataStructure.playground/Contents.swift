class BinaryNode<Element> {
    var value: Element
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    init(_ value: Element) {
        self.value = value
    }
}

extension BinaryNode {
    
    func traverseInOrder(_ visit: (Element)-> Void) {
        leftChild?.traverseInOrder(visit)
        visit(value)
        rightChild?.traverseInOrder(visit)
    }
    
    func traversePostOrder(_ visit: (Element)-> Void) {
        leftChild?.traversePostOrder(visit)
        rightChild?.traversePostOrder(visit)
        visit(value)
    }
    
    func traversePreOrder(_ visit: (Element)-> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit)
        rightChild?.traversePreOrder(visit)
    }
}
var fst = BinaryNode<Int>(10)
var _2st = BinaryNode<Int>(11)
var _3st = BinaryNode<Int>(12)
var _4st = BinaryNode<Int>(13)
var _5st = BinaryNode<Int>(14)
var _6st = BinaryNode<Int>(15)
var _7st = BinaryNode<Int>(16)
var _8st = BinaryNode<Int>(17)
fst.leftChild = _2st
fst.rightChild = _3st
_2st.leftChild = _4st
_2st.rightChild = _5st
_3st.rightChild = _7st
_3st.leftChild = _8st
//fst.traverseInOrder {
//    print($0)
//}
fst.traversePreOrder {
    print($0)
}
