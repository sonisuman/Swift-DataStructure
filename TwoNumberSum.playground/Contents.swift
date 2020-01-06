//two number sum
// O(nlogn) time | O(1) space

func twoNumberSum(array: [Int], targetSum: Int) -> [Int] {
    // Write your code here.
    
    let sortedArr = array.sorted()
    var leftMostElement = 0
    var rightMostElement = array.count - 1
    var resultArr = [[Int]]()
    
    while leftMostElement < rightMostElement {
        let currentSum = sortedArr[leftMostElement] + sortedArr[rightMostElement]
        if  currentSum == targetSum {
            return [sortedArr[leftMostElement] , sortedArr[rightMostElement]].sorted()
        }
        else if  currentSum > targetSum {
            rightMostElement -= 1
        }
        else {
                leftMostElement += 1
        }
    }

    return []
}

// O(n) time | O(n) space

func twoNumberSumUsingHashTable(array: [Int],targetSum: Int) -> [[Int]] {
    var numberHashMap = [Int: Bool]()
    var resultArray = [[Int]]()
    for number in array {
        let potentialMatch = targetSum - number
        if let exists = numberHashMap[potentialMatch] , exists {
            var result = [potentialMatch, number].sorted()
            resultArray.append(result)
        }
        else {
            numberHashMap[number] = true
        }
    }
    return resultArray
}

//O(n square) time | O(1) space

func twoNumberSumUsingTwoForLoop(array: [Int], targerSum: Int) -> [Int] {
    for i in 0 ..< array.count - 1 {
        let firstNum = array[i]
        for j in i + 1 ..< array.count {
            let secondNum = array[j]
            if firstNum + secondNum == targerSum {
                return [firstNum , secondNum].sorted()
            }
        }
    }
    return []
}

print(twoNumberSumUsingHashTable(array: [1,3,4,6,4,3,2,6,7,8,9] , targetSum: 10))
print(twoNumberSum(array: [1,3,4,6,4,3,2,6,7,8,9], targetSum: 10))
print(twoNumberSumUsingTwoForLoop(array: [1,3,4,6,4,3,2,6,7,8,9], targerSum: 10))
