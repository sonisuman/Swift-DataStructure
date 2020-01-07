class ContinuousMedianHandler {
    var median: Double
    var lowers: Heap
    var greaters: Heap
    
    init() {
        median = 0.0
        lowers = Heap(array: [],comparisonFunction: maxHeapFunc(_:_:))
        greaters = Heap(array: [],comparisonFunction: minHeapFunc(_:_:))
    }
    func getMedian() -> Double {
        return median
    }
    func insert(number: Int) {
        if lowers.length == 0 || number < Int(lowers.peek()) {
            lowers.insert(value: number)
        } else {
            greaters.insert(value: number)
        }
        reblanceHeaps()
        updateMedian()
    }
    func reblanceHeaps() {
        if lowers.length - greaters.length == 2 {
            greaters.insert(value: lowers.remove())
        } else if greaters.length - lowers.length == 2 {
            lowers.insert(value: greaters.remove())
        }
    }
    func updateMedian() {
        if lowers.length == greaters.length {
            median = Double((lowers.peek() + greaters.peek()) / 2)
        } else if lowers.length > greaters.length {
            median = Double(lowers.peek())
        } else {
            median = Double(greaters.peek())
        }
    }
}

class Heap {
    var length = 0
    var heap = [Int]()
    var comparisonFunction: (Int , Int) -> Bool
    typealias comparisonFuncTypeAlias = (Int , Int) -> Bool
    
    init(array: [Int], comparisonFunction: @escaping comparisonFuncTypeAlias) {
        self.comparisonFunction = comparisonFunction
        heap = buildHeap(array: array)
        length = heap.count
    }
    func buildHeap (array: [Int]) -> [Int] {
        var heapToReturn = array
        var firstParentIndex = Double((array.count - 2) / 2)
        firstParentIndex = firstParentIndex.rounded(.down)
        if array.count > 0 {
            for var currentIndex in (0 ... Int(firstParentIndex)).reversed() {
                var endIndex = array.count - 1
                
                siftDown(currentIndex: &currentIndex,endIndex: &endIndex, heap: &heapToReturn)
            }
        }
        return heapToReturn
    }
    func siftDown(currentIndex: inout Int,endIndex: inout Int, heap: inout [Int]) {
        var firstChildIndex = (2 * currentIndex) + 1
        while firstChildIndex <= endIndex {
            var secondChildIndex = -1
            let potentialSecondChild = (2 * currentIndex) + 2
            
            if potentialSecondChild <= endIndex {
                secondChildIndex = potentialSecondChild
            }
            var indexToSwap = -1
            if secondChildIndex != -1, comparisonFunction(heap[secondChildIndex], heap[firstChildIndex]) {
                indexToSwap = secondChildIndex
            }
            else {
                indexToSwap = firstChildIndex
            }
            if comparisonFunction(heap[indexToSwap], heap[currentIndex]) {
                swap(firstIndex: currentIndex, secondIndex: indexToSwap, heap: &heap)
                currentIndex = indexToSwap
                firstChildIndex = (2 * currentIndex) + 1
            }else {
                return
            }
        }
    }
    
    func siftUp(currentIndex: inout Int, heap: inout [Int]) {
        var parentIndex = Double((currentIndex - 1) / 2)
        parentIndex = parentIndex.rounded(.down)
        while currentIndex > 0 {
            if comparisonFunction(heap[currentIndex],heap[Int(parentIndex)]) {
                swap(firstIndex: currentIndex, secondIndex: Int(parentIndex), heap: &heap)
                currentIndex = Int(parentIndex)
                parentIndex = Double((currentIndex - 1) / 2)
            } else {
                return
            }
        }
    }
    func peek() -> Double {
        return Double(heap[0])
    }
    
    func remove() -> Int {
        swap(firstIndex: 0, secondIndex: heap.count - 1, heap: &heap)
        if let valueToRemove = heap.popLast() {
            var currentIndex = 0
            var endIndex = heap.count - 1
            length -= 1
            siftDown(currentIndex: &currentIndex, endIndex: &endIndex, heap: &heap)
            return valueToRemove
        }
        return -1
    }
    func  insert(value: Int) {
        heap.append(value)
        length += 1
        var currentIndex = heap.count - 1
        siftUp(currentIndex: &currentIndex, heap: &heap)
    }
    
    func swap(firstIndex: Int, secondIndex: Int, heap: inout [Int]) {
        let temp = heap[firstIndex]
        heap[firstIndex] = heap[secondIndex]
        heap[secondIndex] = temp
    }
}

func minHeapFunc(_ a: Int, _ b: Int) -> Bool {
    return a < b
}

func maxHeapFunc(_ a: Int, _ b: Int) -> Bool {
    return a > b
}
