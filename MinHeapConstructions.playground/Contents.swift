class MinHeap {
    var heap = [Int]()
    init(array: [Int]) {
        var array = array
        heap = buildHeap(&array)
    }
    func buildHeap(_ array: inout [Int]) -> [Int] {
        var firstParentIndex = Double((array.count - 2)/2)
        firstParentIndex = firstParentIndex.rounded(.down)
        for var currentIndex in (0 ... Int(firstParentIndex)).reversed() {
            var endIndex = array.count - 1
            siftDown(&currentIndex, &endIndex, &array)
        }
        return array
    }
    func siftDown(_ currentIndex: inout Int, _ endIndex: inout Int, _ heap: inout [Int]) {
        var firstChildIndex = (2 * currentIndex) + 1
        while firstChildIndex < endIndex {
            var secondChildIndex = -1
            let potentialSecondChild = (2 * currentIndex) + 2
            if potentialSecondChild <= endIndex {
                secondChildIndex = potentialSecondChild
            }
            var indexToSwap = -1
            if secondChildIndex != -1 , heap[secondChildIndex] < heap[firstChildIndex] {
                indexToSwap = secondChildIndex
            } else {
                indexToSwap = firstChildIndex
            }
            if heap[indexToSwap] < heap[currentIndex] {
                swap(currentIndex, indexToSwap, heap: &heap)
                currentIndex = indexToSwap
                firstChildIndex = (2 * currentIndex) + 1
            }
            else {
                return
            }
        }
    }
    func siftUp(_ currentIndex: inout Int, heap: inout [Int]) {
        var parentIndex = Double((currentIndex - 1) / 2)
        parentIndex = parentIndex.rounded(.down)
        while currentIndex > 0, heap[currentIndex] < heap[Int(parentIndex)] {
            swap(currentIndex, Int(parentIndex), heap: &heap)
            currentIndex = Int(parentIndex)
            parentIndex = Double((currentIndex - 1) / 2 )
        }
    }
    func peek() -> Int {
        return heap[0]
    }
    func remove() -> Int {
        swap(0, heap.count - 1, heap: &heap)
        
        if let valueToRemove = heap.popLast() {
            var currentIndex = 0
            var endIndex = heap.count - 1
            siftDown(&currentIndex, &endIndex, &heap)
            
            return valueToRemove
        }
        return -1
    }
    func insert(_ value: Int) {
        heap.append(value)
        var currentIndex = heap.count - 1
        siftUp(&currentIndex, heap: &heap)
    }
    
    func swap(_ firstIndex: Int, _ secondIndex: Int, heap: inout [Int]) {
        let temp = heap[firstIndex]
        heap[firstIndex] = heap[secondIndex]
        heap[secondIndex] = temp
    }
}
var testArr = [48,12,24,7,8,-5,24,391,24,56,2,6,8,41]
var heap = MinHeap(array: testArr)
print(heap.buildHeap(&testArr))
print(heap.insert(76))
print(heap.remove())
print(heap.remove())
print(heap.insert(87))
