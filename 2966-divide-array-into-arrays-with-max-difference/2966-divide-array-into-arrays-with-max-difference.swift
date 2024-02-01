class Solution {
    func divideArray(_ nums: [Int], _ k: Int) -> [[Int]] {
    let sortedNums = nums.sorted()
    var result = [[Int]]()
    
    for i in stride(from: 0, to: sortedNums.count, by: 3) {
        if sortedNums[i + 2] - sortedNums[i] <= k {
            result.append([sortedNums[i], sortedNums[i + 1], sortedNums[i + 2]])
        } else {
            return []
        }
    }
    
    return result
}
}