class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
    let sArray = Array(s)
    var tCount = [Character: Int]()
    var windowCount = [Character: Int]()
    for char in t {
        tCount[char, default: 0] += 1
    }
    
    var have = 0
    var need = tCount.keys.count
    var result = (index: 0, length: Int.max)
    var left = 0
    
    for right in 0..<sArray.count {
        let char = sArray[right]
        windowCount[char, default: 0] += 1
        
        if let windowCharCount = windowCount[char], let neededCharCount = tCount[char], windowCharCount == neededCharCount {
            have += 1
        }
        
        while have == need {
            if (right - left + 1) < result.length {
                result = (left, right - left + 1)
            }
            
            windowCount[sArray[left]]! -= 1
            if let windowCharCount = windowCount[sArray[left]], let neededCharCount = tCount[sArray[left]], windowCharCount < neededCharCount {
                have -= 1
            }
            left += 1
        }
    }
    
    return result.length == Int.max ? "" : String(sArray[result.index..<(result.index + result.length)])
}
}