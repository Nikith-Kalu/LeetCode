class Solution {
    public int maxSumSubmatrix(int[][] matrix, int k) {
        int n = matrix.length, m = matrix[0].length, res = Integer.MIN_VALUE;
        int[][] dp = new int[n][m];
        for (int r=0; r<n; r++) {
            for (int c=0; c<m; c++) {
                dp[r][c] = (r > 0 ? dp[r-1][c] : 0) + (c > 0 ? dp[r][c-1] : 0) - (r > 0 && c > 0 ? dp[r-1][c-1] : 0) + matrix[r][c];
                
                for (int i=-1; i<=r; i++) {
                    for (int j=-1; j<=c; j++) {
                        if (i == r || j == c) continue;
                        int sub = dp[r][c] - (i >= 0 ? dp[i][c] : 0) - (j >= 0 ? dp[r][j] : 0) + (i >= 0 && j >= 0 ? dp[i][j] : 0);
                        if (sub <= k) res = Math.max(res, sub);
                    }
                }
            }
        }
        
        return res;
    }
}