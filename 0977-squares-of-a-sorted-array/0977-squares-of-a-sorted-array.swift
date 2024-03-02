class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
    var left = 0
    var right = nums.count - 1
    var result = [Int](repeating: 0, count: nums.count)
    var index = nums.count - 1

    while left <= right {
        if abs(nums[left]) > abs(nums[right]) {
            result[index] = nums[left] * nums[left]
            left += 1
        } else {
            result[index] = nums[right] * nums[right]
            right -= 1
        }
        index -= 1
    }
    return result
    }
}