class Solution {
    var visitedMap = [[Bool]]()
    func numIslands(_ grid: [[Character]]) -> Int {
        guard grid.count != 0 else {
            return 0
        }
        let visitedMapRow = Array(repeating: false, count: grid[0].count)
        visitedMap = Array(repeating: visitedMapRow, count: grid.count)
        var count = 0
        for i in 0..<grid.count{
            for j in 0..<grid[i].count {
                if visitedMap[i][j] {
                    continue
            }
            if grid[i][j] == "1"{
                count += 1
                findAreaOfIsland(grid, i, j)
            }
            visitedMap[i][j] = true
        }
    }
    return count
}
    
    func findAreaOfIsland(_ grid: [[Character]], _ row: Int, _ col: Int) {
        visitedMap[row][col] = true
        
        if row != 0 {
            if !visitedMap[row - 1][col] && grid[row - 1][col] == "1" {
                findAreaOfIsland(grid, row - 1, col)
            }
        }
        
        if row < grid.count - 1 {
            if !visitedMap[row + 1][col] && grid[row + 1][col] == "1" {
                findAreaOfIsland(grid, row + 1, col)
            }
        }
        
        if col != 0 {
            if !visitedMap[row][col - 1] && grid[row][col - 1] == "1" {
                findAreaOfIsland(grid, row, col - 1)
            }
        }
        
        if col < grid[row].count - 1 {
            if !visitedMap[row][col + 1] && grid[row][col + 1] == "1" {
                findAreaOfIsland(grid, row, col + 1)
            }
        }
    }
}