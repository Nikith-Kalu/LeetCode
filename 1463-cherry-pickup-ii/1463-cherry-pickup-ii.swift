class Solution {
    func cherryPickup(_ grid: [[Int]]) -> Int {
    let rows = grid.count
    let cols = grid[0].count
    var dp = Array(repeating: Array(repeating: -1, count: cols), count: cols)
    var tempDp = dp

    for col1 in 0..<cols {
        for col2 in 0..<cols {
            dp[col1][col2] = col1 == col2 ? grid[rows-1][col1] : grid[rows-1][col1] + grid[rows-1][col2]
        }
    }

    for row in stride(from: rows - 2, through: 0, by: -1) {
        for col1 in 0..<cols {
            for col2 in 0..<cols {
                var maxCherries = 0
                for move1 in -1...1 {
                    let newCol1 = col1 + move1
                    if newCol1 < 0 || newCol1 >= cols { continue }
                    
                    for move2 in -1...1 {
                        let newCol2 = col2 + move2
                        if newCol2 < 0 || newCol2 >= cols { continue }
                        
                        maxCherries = max(maxCherries, dp[newCol1][newCol2])
                    }
                }
                
                tempDp[col1][col2] = grid[row][col1] + (col1 == col2 ? 0 : grid[row][col2]) + maxCherries
            }
        }
        dp = tempDp
    }

    return dp[0][cols-1]
}


}