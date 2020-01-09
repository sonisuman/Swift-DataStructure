func binarySearch(array: [Int], target: Int) -> Int {
    var leftPointer = 0
    var rightPointer = array.count - 1
    return    binarySearchHelper(array: array,target: target, &leftPointer,&rightPointer)
}

func binarySearchHelper(array: [Int], target: Int, _ leftPointer: inout  Int, _ rightPointer: inout Int) -> Int{
    while leftPointer <= rightPointer {
        let middle = (leftPointer + rightPointer) / 2
        let potentialMatch = array[middle]
        if potentialMatch == target {
            return middle
        }
        if potentialMatch > target {
            rightPointer = middle - 1
        }
        else if potentialMatch < target {
            leftPointer = middle + 1
        }
    }
    return -1
}


