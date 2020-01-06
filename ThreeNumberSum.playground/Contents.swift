//three number sum

//O(n square) time | O(1) space

func threeNumberSum(array: inout [Int], targetSum: Int) -> [[Int]] {
    // Write your code here.
    array.sort()
    
    var resultArr = [[Int]]()
    
    for i in 0..<array.count - 2 {
        var leftMost = i + 1
        var rightMost = array.count - 1
        
        while leftMost < rightMost {
            
            let currentSum = array[i] + array[leftMost] + array[rightMost]
            if currentSum == targetSum {
                resultArr.append([array[i],array[leftMost],array[rightMost]])
                leftMost += 1
                rightMost -= 1
            }
            else if  currentSum < targetSum {
                leftMost += 1
            } else if  currentSum > targetSum {
                rightMost -= 1
            }
            
            }
    }
    return resultArr
}
var testArray = [1,3,4,5,-1,-5,3,-3,6]

print(threeNumberSum(array: &testArray, targetSum:0 ))


