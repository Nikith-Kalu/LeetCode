class Solution {
    public List<List<Integer>> levelOrder(TreeNode root) {
	List<List<Integer>> res = new ArrayList<List<Integer>>();

	getChildren(root, 0, res);

	return res;
}

private void getChildren(TreeNode node, int level, List<List<Integer>> res) {
	if(node == null) return;

	if(res.size() > level)
		res.get(level).add(node.val);
	else {
		List<Integer> lvlNode = new ArrayList<Integer>();
		lvlNode.add(node.val);
		res.add(lvlNode);
	}

	getChildren(node.left, level + 1, res);
	getChildren(node.right, level + 1, res);
}
}