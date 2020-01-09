func findThreeLargestNumbers(_ array: [Int]) -> [Int] {
    var largestItemsArr:[Int?] = [nil , nil, nil]
    for number in array {
        updateLargest(&largestItemsArr, number)
    }
    let threeLargestItemArr = largestItemsArr.compactMap() {$0}
    return threeLargestItemArr
}
func updateLargest(_ largestItemsArr: inout [Int?], _ number: Int) {
    if largestItemsArr[2] == nil {
        shiftAndUpdate(&largestItemsArr, 2, number)
    }
    else if largestItemsArr[1] == nil {
        shiftAndUpdate(&largestItemsArr, 1, number)
    }
    else if largestItemsArr[0] == nil {
        shiftAndUpdate(&largestItemsArr, 0, number)
    }
    if let thrirdNumber =  largestItemsArr[2] , number > thrirdNumber {
        shiftAndUpdate(&largestItemsArr, 2, number)
    }
    else if let seconddNumber =  largestItemsArr[1] , number > seconddNumber {
        shiftAndUpdate(&largestItemsArr, 1, number)
    }
    else if let firstdNumber =  largestItemsArr[0] , number > firstdNumber {
        shiftAndUpdate(&largestItemsArr, 0, number)
    }
    
}
func shiftAndUpdate(_ largestItemsArr: inout [Int?],_ Index: Int, _ number: Int) {
    for i in 0 ... Index {
        if i == Index {
            largestItemsArr[i] = number
        } else {
            largestItemsArr[i] = largestItemsArr[i + 1]
        }
    }
}

var testArr = [141,1,17,-7,-17,-27,18,541,8,7,7]
print(findThreeLargestNumbers(testArr))

