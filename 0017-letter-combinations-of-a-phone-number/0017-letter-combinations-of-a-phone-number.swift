class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else { return [] }

        let phoneMap: [Character: [Character]] = [
            "2": ["a", "b", "c"], "3": ["d", "e", "f"],
            "4": ["g", "h", "i"], "5": ["j", "k", "l"],
            "6": ["m", "n", "o"], "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"], "9": ["w", "x", "y", "z"]
        ]

        // Pre-calculate the size of the result array
        var combinationSize = 1
        for digit in digits {
            combinationSize *= phoneMap[digit]!.count
        }

        var result = [String]()
        result.reserveCapacity(combinationSize)

        var current = Array(repeating: Character(" "), count: digits.count)

        func backtrack(_ index: Int) {
            if index == digits.count {
                result.append(String(current))
                return
            }

            let digit = digits[digits.index(digits.startIndex, offsetBy: index)]
            for letter in phoneMap[digit]! {
                current[index] = letter
                backtrack(index + 1)
            }
        }

        backtrack(0)
        return result
    }
}
