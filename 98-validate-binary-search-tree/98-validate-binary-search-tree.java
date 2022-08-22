class Solution {
    public boolean isValidBST(TreeNode root) {
			return isValidBST(root,Integer.MIN_VALUE,Integer.MAX_VALUE);
    }
    public boolean isValidBST(TreeNode root,long min, long max) {
    if(root == null) return true;
    if(root.val < min || root.val > max) return false;
        return (
			isValidBST(root.right,(long)root.val + 1,max) && 
			isValidBST(root.left,min,(long)root.val - 1)
                        );
    }
}