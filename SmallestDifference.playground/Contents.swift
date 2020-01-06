func smallestDifference(arrayOne: inout [Int], arrayTwo: inout [Int]) -> [Int] {
    // Write your code here.
    
    arrayOne.sort()
    arrayTwo.sort()
    var indexOne = 0
    var indexTwo = 0
    var current = Int.max
    var smallest = Int.max
    var smallestPair = [Int]()
    
while indexOne < arrayOne.count , indexTwo < arrayTwo.count {
    
    let firstNum = arrayOne[indexOne]
    let secondNum = arrayTwo[indexTwo]
    
    if firstNum > secondNum {
        current = firstNum - secondNum
        indexTwo += 1
    } else if firstNum < secondNum {
        current = secondNum - firstNum
        indexOne += 1
    } else {
        return [firstNum,secondNum]
    }
    if smallest >  current {
        smallest = current
        smallestPair = [firstNum,secondNum]
    }
}
    return smallestPair
}
var testArray1 = [1,45,56,3,5,6,78,23,49]
var testArray2 = [3,56,67,78,23,56,34,78,34]

print(smallestDifference(arrayOne: &testArray1, arrayTwo: &testArray2))
