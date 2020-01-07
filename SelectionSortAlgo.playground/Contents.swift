var numbers = [2,4,6,8,6,9,34,56,67,78,64]

func selectionSort(_ array: inout [Int]) -> [Int] {
    // Write your code here.
    var currentIndex = 0
    while currentIndex <   array.count - 1 {
        var indexOfSmallest = currentIndex
        for i in currentIndex + 1 ..< array.count {
            if array[indexOfSmallest] > array[i] {
                indexOfSmallest  = i
            }
        }
            swapTheElement(&array, currentIndex, indexOfSmallest)
         currentIndex += 1
    }
    return array
}

func swapTheElement(_ array: inout [Int],_ firstIndex: Int, _ secondIndex: Int) {
    let temp = array[secondIndex]
    array[secondIndex] = array[firstIndex]
    array[firstIndex] = temp
}


let sortedArray = selectionSort(&numbers)
print("sorted array ====== \(sortedArray)")
