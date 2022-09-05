class Solution {
	func levelOrder(_ root: Node?) -> [[Int]] {
		guard let root = root else { return [] }

		var layer = [root]
		var result = [[Int]]()

		while !layer.isEmpty {
			result.append(layer.map { $0.val })
			var newLayer = [Node]()
			for node in layer {
				newLayer.append(contentsOf: node.children)
			}
			layer = newLayer
		}

		return result
	}
}