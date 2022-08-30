class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        matrix.reverse()
        for (i,row) in matrix.enumerated()  {
            for (j,_) in row.enumerated() where j >= i {
                var temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
        }    
    }
}