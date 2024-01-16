import Foundation

class RandomizedSet {
    private var valueToIndexMap: [Int: Int]
    private var values: [Int]

    init() {
        valueToIndexMap = [Int: Int]()
        values = [Int]()
    }

    func insert(_ val: Int) -> Bool {
        if valueToIndexMap[val] != nil {
            return false
        }
        values.append(val)
        valueToIndexMap[val] = values.count - 1
        return true
    }

    func remove(_ val: Int) -> Bool {
        guard let index = valueToIndexMap[val] else {
            return false
        }
        let lastIndex = values.count - 1
        if index < lastIndex {
            values.swapAt(index, lastIndex)
            valueToIndexMap[values[index]] = index
        }
        values.removeLast()
        valueToIndexMap.removeValue(forKey: val)
        return true
    }

    func getRandom() -> Int {
        guard !values.isEmpty else {
            fatalError("Set is empty")
        }
        let randomIndex = Int.random(in: 0..<values.count)
        return values[randomIndex]
    }
}
