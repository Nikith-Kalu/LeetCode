function lowestCommonAncestor(root: TreeNode | null, p: TreeNode | null, q: TreeNode | null): TreeNode | null {
    const helper = (node: TreeNode | null): TreeNode | null => {
        if(p.val > node.val && q.val > node.val) return helper(node.right);
        if(p.val < node.val && q.val < node.val) return helper(node.left);
        return node;
    }
	return helper(root);
};