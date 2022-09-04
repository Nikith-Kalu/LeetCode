class Solution {
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
	var result: [[Int]] = []
	var queue: [(node: TreeNode?, column: Int)] = []
	var hash: [Int: [Int]] = [:]

	queue.append((node: root, column: 0))
	while !queue.isEmpty {
		var count = queue.count - 1
		var temp: [Int: [Int]] = [:]
		while count >= 0 {
			let value = queue.removeFirst()
			if let root = value.node {
				if let left = root.left { queue.append((node: left, column: value.column - 1)) }
				if let right = root.right { queue.append((node: right, column: value.column + 1))}

				if var isInHash = temp[value.column] {
					isInHash.append(root.val)
					temp[value.column] = isInHash
				} else {
					temp[value.column] = [root.val]
				}

			}
			count -= 1
		}
		if !temp.isEmpty {
			for (key, value) in temp {
				if var isInHash = hash[key] {
					isInHash.append(contentsOf: value.sorted())
					hash[key] = isInHash
				} else {
					hash[key] = value.sorted()
				}
			}
		}
	}

	for key in hash.keys.sorted() {
		if let value = hash[key] {
			result.append(value)
		}
	}

	return result
}

}