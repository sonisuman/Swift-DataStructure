//largestRange
// O(n) time | O(n) space

func largestRange(array: [Int]) -> [Int] {
    // Write your code here.
    var bestRange = [Int]()
    var largestLength = 0
    var nums = [Int : Bool]()
    
    for num in array {
        nums[num] = true
    }
    for num in array {
        if let number = nums[num], !number {
            continue
        }
        var currentLength = 1
        var left = num - 1
        var right = num + 1
        while nums.keys.contains(left)  {
            nums[left] = false
            currentLength += 1
            left -= 1
        }
        while nums.keys.contains(right) {
            nums[right] = false
            currentLength += 1
            right += 1
        }
        if currentLength > largestLength {
            bestRange = [left + 1 , right - 1]
          largestLength = currentLength
        }
    }
    return bestRange
}

print(largestRange(array: [1,11,3,0,15,5,2,4,10,7,12,6]))
