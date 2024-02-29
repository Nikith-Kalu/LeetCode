/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     val: number
 *     left: TreeNode | null
 *     right: TreeNode | null
 *     constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.left = (left===undefined ? null : left)
 *         this.right = (right===undefined ? null : right)
 *     }
 * }
 */


function isEvenOddTree(root: TreeNode | null): boolean {
    if (!root) return false;

    let level = 0;
    let queue: TreeNode[] = [root];

    while (queue.length > 0) {
        let levelSize = queue.length;
        let prevValue = level % 2 === 0 ? Number.MIN_SAFE_INTEGER : Number.MAX_SAFE_INTEGER;

        for (let i = 0; i < levelSize; i++) {
            let currentNode = queue.shift();
            if (level % 2 === 0) {
                if (currentNode.val % 2 === 0 || currentNode.val <= prevValue) return false;
            } else {
                if (currentNode.val % 2 !== 0 || currentNode.val >= prevValue) return false;
            }
            prevValue = currentNode.val;

            if (currentNode.left) queue.push(currentNode.left);
            if (currentNode.right) queue.push(currentNode.right);
        }
        level++;
    }

    return true;
}