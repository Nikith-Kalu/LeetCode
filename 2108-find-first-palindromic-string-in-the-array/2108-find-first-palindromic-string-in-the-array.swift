class Solution {
    func firstPalindrome(_ words: [String]) -> String {
    for word in words {
        if word == String(word.reversed()) {
            return word
        }
    }
    return ""
}

}