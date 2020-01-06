//minimum reward
//O(n square) | time,O(n) space
func minRewards(_ scores: [Int]) -> Int {
    // Write your code here.
    var reward = Array(repeating: 1, count : scores.count)
    for i in 1 ..< scores.count {
        var j = i - 1
        if scores[i] > scores[j] {
            reward[i] = reward[j] + 1
        } else {
            while j >= 0, scores[j] > scores[j + 1] {
                reward[j] = max(reward[j], reward[j + 1] + 1)
                j -= 1
            }
        }
    }
    
    return reward.reduce(0) {$0 + $1}
}

// O(n) time |O(n) space

func minRewardsUsingStride(_ scores: [Int])-> Int {
    var reward = Array(repeating: 1, count: scores.count)
    
    for i in stride(from: 1, to: scores.count, by: 1) {
        if scores[i] > scores[i - 1] {
            reward[i] = reward[i - 1] + 1
        }
    }
    
    for i in stride(from: scores.count - 2, through: 0, by: -1) {
        if scores[i] > scores[i + 1] {
            reward[i] = max(reward[i], reward[i + 1] + 1)
        }
    }
    return reward.reduce(0) { $0 + $1}
}
print(minRewardsUsingStride([8,4,2,1,3,6,7,9,5]))

print(minRewards([8,4,2,1,3,6,7,9,5]))
