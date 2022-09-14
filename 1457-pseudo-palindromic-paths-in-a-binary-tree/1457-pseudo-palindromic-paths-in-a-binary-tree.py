class Solution:
    def pseudoPalindromicPaths (self, root: TreeNode) -> int:
        def dfs(root, mask):
            if not root:
                return 0
            mask = mask ^ (1 << root.val)
            if not root.left and not root.right:
                if mask & (mask - 1) == 0:
                    return 1
                return 0
            return dfs(root.left, mask) + dfs(root.right, mask)
        return dfs(root, 0)