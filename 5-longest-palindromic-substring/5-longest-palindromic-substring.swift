class Solution {
    func longestPalindrome(_ s: String) -> String {
        var candidate: ArraySlice<Character> = []
        let array = Array(s)
        
        for i in (1...array.count).reversed() {
            let cutFront = array.suffix(i)
            
            for j in 1...i {
                let substring = cutFront.prefix(j)
                
                if isPalindrome(substring) {
                    if substring.count > candidate.count {
                        candidate = substring
                    }
                }
            }
        }
        
        return String(candidate)
    }
    
    func isPalindrome(_ s: ArraySlice<Character>) -> Bool {
        var pointerL: Int = s.startIndex
        var pointerR: Int = s.endIndex - 1
        
        while pointerL < pointerR {
            if s[pointerL] != s[pointerR] {
                return false
            }
            pointerL += 1
            pointerR -= 1
        }
        return true
    }
}