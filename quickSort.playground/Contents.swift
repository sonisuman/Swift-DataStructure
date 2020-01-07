func quickSort(_ array: inout [Int]) -> [Int] {
    // Write your code here.
    quickSortHelper(&array, 0, array.count - 1)
    
    return array
}

func quickSortHelper(_ array:  inout [Int], _ startIndex: Int,_ endIndex: Int) {
    
    if startIndex >= endIndex {
        return
    }
    var leftIndex = startIndex + 1
    var pivotIndex = startIndex
    var rightIndex = endIndex
    
     while rightIndex >= leftIndex {
         if array[leftIndex] > array[pivotIndex] , array[rightIndex] < array[pivotIndex] {
             swapTheElement(&array,leftIndex, rightIndex )
         }
         if array[leftIndex] <= array[pivotIndex] {
            leftIndex += 1
         }
         if array[rightIndex] >= array[pivotIndex] {
             rightIndex -= 1
         }
         
     }
    swapTheElement(&array,pivotIndex,rightIndex)
    
    let leftArrLength = rightIndex - 1 - startIndex
    let rightArrLength = endIndex - rightIndex + 1
    
    let leftSubArrSmaller = leftArrLength < rightArrLength
    
    if leftSubArrSmaller {
        quickSortHelper(&array,startIndex, rightIndex - 1)
        quickSortHelper(&array,rightIndex + 1, endIndex)
    }
    else {
        quickSortHelper(&array,rightIndex + 1, endIndex)
        quickSortHelper(&array,startIndex, rightIndex - 1)
    }
}
func swapTheElement(_ array: inout [Int],_ firstIndex: Int, _ secondIndex: Int) {
    let temp = array[secondIndex]
    array[secondIndex] = array[firstIndex]
    array[firstIndex] = temp
}

var testArr = [8,5,2,9,5,6,3]

print(quickSort(&testArr))
