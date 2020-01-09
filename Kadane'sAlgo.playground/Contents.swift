func kadanesAlgorithm(array: [Int]) -> Int {
    // Write your code here.
    
    if array.count > 0 {
        var maxEndingHere = array[0]
        var maxSoFar = array[0]
        for i in 1 ..< array.count  {
            let currentNumber = array[i]
            maxEndingHere = max(currentNumber , currentNumber + maxEndingHere)
            maxSoFar = max(maxSoFar, maxEndingHere)
        }
        if maxSoFar > 0 {
            return maxSoFar
        }
    }
    return -1
}

var testArr = [3,5,-9,1,3,-2,3,4,7,2,-9,6,3,1,-5,4]

print(kadanesAlgorithm(array: testArr))
