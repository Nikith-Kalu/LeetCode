class Solution {
    public List<Integer> preorder(Node root) {
        List<Integer> res = new ArrayList<>();
        preOrder(res, root);
        return res;
    }

    private static void preOrder(List<Integer> res, Node root) {
        if (root == null) {
            return;
        }
        res.add(root.val);
        for (Node child : root.children) {
            preOrder(res, child);
        }
    }
}