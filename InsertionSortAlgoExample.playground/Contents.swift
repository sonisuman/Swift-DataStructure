func insertionSort(array: inout [Int]) -> [Int] {
    // Write your code here.
    for i in 1 ..< array.count {
        var j = i
        while j > 0 , array[j] < array[j - 1]{
            swapTheNumbers(&array,j,j - 1)
            j -= 1
        }
    }
    return array
}
func swapTheNumbers(_ array:  inout [Int], _ firstNumber: Int, _ secondNumber: Int) {
    let temp = array[secondNumber]
    array[secondNumber] = array[firstNumber]
    array[firstNumber] = temp
}

var testArr = [8,5,2,9,5,6,3]
print(insertionSort(array: &testArr))
