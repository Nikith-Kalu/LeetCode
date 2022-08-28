class Solution {

    public int[][] diagonalSort(int[][] mat) {
        final int totalRows = mat.length;
        final int totalCols = mat[0].length;

        List<Integer> diagonalElements;
        for (int r = 0; r < totalRows; r++) {
            int i = r;
            int j = 0;

            diagonalElements = new ArrayList<>();
            while (i < totalRows && j < totalCols) diagonalElements.add(mat[i++][j++]);
            Collections.sort(diagonalElements);

            i = r;
            j = 0;
            int k = 0;

            while (i < totalRows && j < totalCols) mat[i++][j++] = diagonalElements.get(k++);
        }

        for (int c = 0; c < totalCols; c++) {
            int i = 0;
            int j = c;

            diagonalElements = new ArrayList<>();
            while (i < totalRows && j < totalCols) diagonalElements.add(mat[i++][j++]);
            Collections.sort(diagonalElements);

            i = 0;
            j = c;
            int k = 0;

            while (i < totalRows && j < totalCols) mat[i++][j++] = diagonalElements.get(k++);
        }

        return mat;
    }
}