class Solution {
    func maximumScore(_ nums: [Int], _ multipliers: [Int]) -> Int {
        let n = nums.count, m = multipliers.count
        var dp = [[Int?]](repeating: [Int?](repeating: nil, count: m), count: m)
        func helper(_ left: Int, _ right: Int) -> Int {
            if left + right >= m { return 0 }
            if let savedResult = dp[left][right] { return savedResult }
            let result = max(nums[left] * multipliers[left + right] + helper(left + 1, right), nums[n - 1 - right] * multipliers[left + right] + helper(left, right + 1))
            dp[left][right] = result
            return result
        }
        return helper(0, 0)
    }
}