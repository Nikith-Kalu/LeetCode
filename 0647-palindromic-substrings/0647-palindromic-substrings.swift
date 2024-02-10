class Solution {
    func countSubstrings(_ s: String) -> Int {
    let chars = Array(s)
    let n = s.count
    var count = 0

    func expandAroundCenter(left: Int, right: Int) -> Int {
        var left = left
        var right = right
        var count = 0
        while left >= 0 && right < n && chars[left] == chars[right] {
            count += 1
            left -= 1
            right += 1
        }
        return count
    }

    for i in 0..<n {
        count += expandAroundCenter(left: i, right: i)
        count += expandAroundCenter(left: i, right: i+1)
    }

    return count
}

}