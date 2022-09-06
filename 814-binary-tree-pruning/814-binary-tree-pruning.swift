class Solution {
    func pruneTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        
        return dfs(node: root) ? root : nil
    }
    
    private func dfs(node: TreeNode) -> Bool {
        if node.left == nil, node.right == nil {
            return node.val == 1
        }
        
        var hasOne = node.val == 1
        if let left = node.left, dfs(node: left) {
            hasOne = true
        } else {
            node.left = nil
        }
        
        if let right = node.right, dfs(node: right) {
            hasOne = true
        } else {
            node.right = nil
        }
        
        return hasOne
    }
}