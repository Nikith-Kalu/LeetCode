class Solution {
    func halvesAreAlike(_ s: String) -> Bool {
        let vowels: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        var firstHalfVowelCount = 0, secondHalfVowelCount = 0
        let midIndex = s.index(s.startIndex, offsetBy: s.count / 2)
        var leftIndex = s.startIndex
        var rightIndex = midIndex

        while leftIndex < midIndex && rightIndex < s.endIndex {
            if vowels.contains(s[leftIndex]) {
                firstHalfVowelCount += 1
            }
            if vowels.contains(s[rightIndex]) {
                secondHalfVowelCount += 1
            }

            leftIndex = s.index(after: leftIndex)
            rightIndex = s.index(after: rightIndex)

            // Early exit if difference in counts exceeds remaining characters
            if abs(firstHalfVowelCount - secondHalfVowelCount) > s.distance(from: rightIndex, to: s.endIndex) {
                return false
            }
        }

        return firstHalfVowelCount == secondHalfVowelCount
    }
}

