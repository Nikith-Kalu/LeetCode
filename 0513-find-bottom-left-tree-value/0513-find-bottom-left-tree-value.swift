/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
    guard let root = root else {
        return -1
    }

    var queue: [TreeNode] = [root] 
    var current: TreeNode?
    while !queue.isEmpty {
        let size = queue.count

        for i in 0..<size {
            let node = queue.removeFirst()
            
            if i == 0 {
                current = node
            }
            
            if let leftNode = node.left {
                queue.append(leftNode)
            }
            if let rightNode = node.right {
                queue.append(rightNode)
            }
        }
    }
    
    return current?.val ?? -1 
}

}

