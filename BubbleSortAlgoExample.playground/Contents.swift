func bubbleSort(array: inout [Int]) -> [Int] {
    // Write your code here.
    var isSorted = false
    var counter = 0
    while !isSorted {
        isSorted = true
        for i in 0 ..< array.count - 1 - counter {
            if array[i] > array[i + 1] {
                swapElement(&array, i, i + 1)
                isSorted = false
            }
    }
        counter += 1
}
      return array
}
    func swapElement(_ array: inout [Int], _ firstIndex : Int, _ secondIndex : Int) {
        let temp = array[secondIndex]
                array[secondIndex] =  array[firstIndex]
                array[firstIndex] = temp
    }

var testArr = [8,5,2,9,5,6,3]
print(bubbleSort(array: &testArr))
