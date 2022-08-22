class Solution {
        public boolean isValidBST(TreeNode node) {
        return isValid(node, null, null);
    }
    
    private boolean isValid(TreeNode n, Integer min, Integer max) {
        return  (n == null) ||
                (min == null || n.val > min) && (max == null || n.val < max) &&
                isValid(n.left , min , n.val) && isValid(n.right, n.val, max);
    }
}