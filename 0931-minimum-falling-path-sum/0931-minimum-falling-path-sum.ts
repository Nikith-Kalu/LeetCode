function minFallingPathSum(matrix) {
    let n = matrix.length;
    let dp = [...matrix[0]];

    for (let i = 1; i < n; i++) {
        let tempDp = [...dp];

        for (let j = 0; j < n; j++) {
            let left = j > 0 ? dp[j - 1] : Number.MAX_SAFE_INTEGER;
            let right = j < n - 1 ? dp[j + 1] : Number.MAX_SAFE_INTEGER;
            let down = dp[j];

            tempDp[j] = matrix[i][j] + Math.min(left, down, right);
        }

        dp = tempDp;
    }

    return Math.min(...dp);
}
