class Solution {
    func increasingTriplet(_ nums: [Int]) -> Bool {
        var first = nums[0], second = Int.max
        for num in nums.dropFirst() {
            if num > second {
                return true
            }
            if num > first {
                second = min(second, num)
            } else {
                first = num
            } 
        }
        return false
    }
}