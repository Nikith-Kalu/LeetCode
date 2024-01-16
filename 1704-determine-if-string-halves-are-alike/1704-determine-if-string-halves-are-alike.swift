class Solution {
    func halvesAreAlike(_ s: String) -> Bool {
        let vowels = Set("aeiouAEIOU")
        let midIndex = s.index(s.startIndex, offsetBy: s.count / 2)
        
        let firstHalf = s[s.startIndex..<midIndex]
        let secondHalf = s[midIndex..<s.endIndex]
        
        let firstHalfVowelCount = firstHalf.filter { vowels.contains($0) }.count
        let secondHalfVowelCount = secondHalf.filter { vowels.contains($0) }.count
        
        return firstHalfVowelCount == secondHalfVowelCount
    }
}
