public class Solution {
    private TreeNode r = null;
    
    public bool FindTarget(TreeNode root, int k) {
        if (root == null)
            return false;
        
        if (r == null)
            r = root;
        
        return DFS(r, k, root.val) || FindTarget(root.left, k) || FindTarget(root.right, k);
    }
    
    private bool DFS(TreeNode node, int k, int i)
    {
        if (node == null)
            return false;
        
        if (node.val + i == k && node.val * 2 != k)
            return true;
        else if (node.val > k - i)
            return DFS(node.left, k, i);
        else
            return DFS(node.right, k, i);
    }
}