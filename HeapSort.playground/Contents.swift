func heapSort(_ array: [Int]) -> [Int] {
    var tempArr = array
    buildHeap(&tempArr)
    
    for index in stride(from: array.count - 1, to: 0, by: -1) {
        swap(0, index, &tempArr)
        var startIndex = 0
        var endIndex = index - 1
        siftDown(&startIndex, &endIndex, &tempArr)
    }
    return tempArr
}

func buildHeap(_ array: inout [Int]) {
    var firstParentIndex = Double((array.count - 2) / 2)
    firstParentIndex = firstParentIndex.rounded(.down)
    for var currentIndex in (0 ... Int(firstParentIndex)).reversed() {
        var endIndex = array.count - 1
        siftDown(&currentIndex, &endIndex, &array)
    }
}

func siftDown(_ currentIndex: inout Int, _ endIndex: inout Int, _ heap: inout [Int ]) {
    var firstChildIndex = (currentIndex * 2) + 1
    while  firstChildIndex <= endIndex {
        var secondeChildeIndex = -1
        let potentialSecondChildIndex = (currentIndex * 2) + 2
        
        if potentialSecondChildIndex <= endIndex {
            secondeChildeIndex = potentialSecondChildIndex
        }
        
        var indexToSwap = -1
        
        if secondeChildeIndex != -1 , heap[secondeChildeIndex] > heap[firstChildIndex] {
            indexToSwap = secondeChildeIndex
        } else {
            indexToSwap = firstChildIndex
        }
        
        if heap[indexToSwap] > heap[currentIndex] {
            swap(currentIndex, indexToSwap, &heap)
            currentIndex = indexToSwap
            firstChildIndex = (currentIndex * 2) + 1
            
        } else {
            return
        }
        
    }
}
func swap(_ firstIndex: Int, _ secondIndex: Int, _ array: inout [Int]) {
    let temp = array[firstIndex]
    array[firstIndex] = array[secondIndex]
    array[secondIndex] = temp
}

var tempArr = [8,5,2,9,5,6,3]

print(heapSort(tempArr))

