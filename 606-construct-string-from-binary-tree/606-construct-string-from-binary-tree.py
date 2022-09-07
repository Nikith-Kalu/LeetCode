class Solution:
    def tree2str(self, root: Optional[TreeNode]) -> str:
        return ''.join([str(root.val), (f'({self.tree2str(root.left)})' if root.left or root.right else ''), (f'({self.tree2str(root.right)})' if root.right else '')]) if root else ''
        