//sortSubArray

//O(n) time | O(1) space

func subarraySort(array: [Int]) -> [Int] {
    // Write your code here.
    var minOutOfOrder = Int(Int.max)
    var maxOutOfOrder = -Int(Int.max)
    
    for i in 0 ..< array.count {
        let current = array[i]
        if isOutOfOrder(i,array,current) {
            minOutOfOrder = min(current,minOutOfOrder)
            maxOutOfOrder = max(current,maxOutOfOrder)
        }
    }
    if minOutOfOrder ==  Int(Int.max) {
            return [-1,-1]
        }
        var subArrLeftIndex = 0
        while minOutOfOrder >= array[subArrLeftIndex] {
            subArrLeftIndex += 1
        }
        var subArrRightIndex = array.count - 1
        while maxOutOfOrder <= array[subArrRightIndex] {
            subArrRightIndex -= 1
        }
        return [subArrLeftIndex,subArrRightIndex]
}
func isOutOfOrder(_ i: Int, _ array: [Int], _ current: Int) -> Bool {
    if i == 0 {
        return current > array[i + 1]
    }
else if i == array.count - 1 {
        return current < array[i - 1]
    }
    else {
        
        return  current > array[i + 1] || current < array[i - 1]
    }
}

print(subarraySort(array: [1,2,4,7,10,11,7,12,6,7,16,18,19]))
