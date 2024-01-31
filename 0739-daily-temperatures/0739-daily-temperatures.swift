class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
    var result = Array(repeating: 0, count: temperatures.count)
    var stack: [(index: Int, temperature: Int)] = []

    for (i, temperature) in temperatures.enumerated() {
        while let last = stack.last, temperature > last.temperature {
            stack.removeLast()
            result[last.index] = i - last.index
        }
        stack.append((i, temperature))
    }

    return result
}
}