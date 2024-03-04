class Solution {
    func bagOfTokensScore(_ tokens: [Int], _ power: Int) -> Int {
    let sortedTokens = tokens.sorted()
    var maxScore = 0
    var score = 0
    var power = power
    var left = 0
    var right = sortedTokens.count - 1

    while left <= right {
        if power >= sortedTokens[left] {
            power -= sortedTokens[left]
            left += 1
            score += 1
            maxScore = max(maxScore, score)
        } else if score > 0 && left < right {
            power += sortedTokens[right]
            right -= 1
            score -= 1
        } else {
            break
        }
    }

    return maxScore
}

}