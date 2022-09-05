class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var closestSum = nums[0..<3].reduce(0,+)
        let nums = nums.sorted()
        
        for i in 0 ..< nums.count - 2 {
            if i > 0 && nums[i-1] == nums[i] { continue }
            var j = i + 1, k = nums.count - 1

            while j < k {
                let sum = nums[i] + nums[j] + nums[k]
    
                if sum == target {
                    return target
                } else if sum < target {
                    j += 1
                } else {
                    k -= 1
                }
            
                if abs(sum - target) < abs(closestSum - target) {
                    closestSum = sum
                }
            }
        }
        
        return closestSum   
    }
}