func fourNumSum(array: [Int],targetSum: Int) -> [[Int]] {
    var allPairsSum = [Int: [[Int]]]()
    var quadruplets = [[Int]]()
    
    for i in 1 ..< array.count - 1 {
        for j in i + 1 ..< array.count {
            let currentSum = array[i] + array[j]
            let difference = targetSum - currentSum
            if allPairsSum.keys.contains(difference) {
                for pair in allPairsSum[difference]! {
                    quadruplets.append(pair + [array[i], array[j]])
                }
            }
        }
        for k in 0 ..< i {
            let currentSum =  array[k] + array[i]
            if !allPairsSum.keys.contains(currentSum) {
                allPairsSum[currentSum] = [[array[k], array[i]]]
            }
            else {
                allPairsSum[currentSum]!.append([array[k], array[i]])
            }
        }
    }
    return quadruplets
}

var testArr = [7,6,4,-1,1,2]
print(fourNumSum(array: testArr, targetSum: 16))
