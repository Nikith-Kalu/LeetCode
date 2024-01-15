class Solution {
    func findWinners(_ matches: [[Int]]) -> [[Int]] {
        var lossCount = [Int: Int]()

        // Count losses for each player
        for match in matches {
            let loser = match[1]
            lossCount[loser, default: 0] += 1
            // Ensure the winner is also in the dictionary with zero losses
            if lossCount[match[0]] == nil {
                lossCount[match[0]] = 0
            }
        }

        var noLosses = [Int]()
        var oneLoss = [Int]()

        // Classify players based on their loss count
        for (player, losses) in lossCount {
            if losses == 0 {
                noLosses.append(player)
            } else if losses == 1 {
                oneLoss.append(player)
            }
        }

        // Sort the arrays
        noLosses.sort()
        oneLoss.sort()

        return [noLosses, oneLoss]
    }
}