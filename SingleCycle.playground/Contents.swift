func findSingleCycle(_ array: [Int]) -> Bool {
    var isNumberVisited = 0
    var currentIndex = 0
    
    while isNumberVisited < array.count {
        if isNumberVisited > 0 , currentIndex == 0{
          return false
        }
      isNumberVisited += 1
        currentIndex = getNextIndex(currentIndex: &currentIndex, array: array)
    }
    return currentIndex == 0
}

func getNextIndex(currentIndex: inout Int, array: [Int]) -> Int {
    let jump = array[currentIndex]
    let nextIndex = (currentIndex + jump) % array.count
    if nextIndex >= 0 {
        return nextIndex
    }
    else {
       return nextIndex + array.count
    }
}

var arrayTest = [2,3,1,-4,-4,2]

print(findSingleCycle(arrayTest))
