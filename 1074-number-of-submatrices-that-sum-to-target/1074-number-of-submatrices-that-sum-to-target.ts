function numSubmatrixSumTarget(matrix, target) {
    let rows = matrix.length;
    let cols = matrix[0].length;
    let count = 0;

    for (let i = 0; i < rows; i++) {
        for (let j = 1; j < cols; j++) {
            matrix[i][j] += matrix[i][j - 1];
        }
    }

    for (let colStart = 0; colStart < cols; colStart++) {
        for (let colEnd = colStart; colEnd < cols; colEnd++) {
            let cumulativeSum = 0;
            let sumCounts = new Map([[0, 1]]);

            for (let row = 0; row < rows; row++) {
                cumulativeSum += matrix[row][colEnd] - (colStart > 0 ? matrix[row][colStart - 1] : 0);
                count += (sumCounts.get(cumulativeSum - target) || 0);
                sumCounts.set(cumulativeSum, (sumCounts.get(cumulativeSum) || 0) + 1);
            }
        }
    }

    return count;
}