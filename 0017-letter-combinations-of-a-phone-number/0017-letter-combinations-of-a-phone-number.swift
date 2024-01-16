class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else {
            return []
        }

        let phoneMap: [Character: String] = [
            "2": "abc", "3": "def", "4": "ghi", "5": "jkl",
            "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"
        ]

        var result = [String]()
        var current = ""

        func backtrack(_ index: Int) {
            if index == digits.count {
                result.append(current)
                return
            }

            let digit = digits[digits.index(digits.startIndex, offsetBy: index)]
            let letters = phoneMap[digit]!

            for letter in letters {
                current.append(letter)
                backtrack(index + 1)
                current.removeLast()
            }
        }

        backtrack(0)
        return result
    }
}
