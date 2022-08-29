class Solution {
    
    func isMatch(_ s: String,_ p: String)->Bool {
        
        let s = Array(s)
        let p = Array(p)
        var result = Array(repeating: Array(repeating: false, count: p.count+1), count: s.count+1)
    
        result[0][0] = true
        
        for j in 1...p.count {
            result[0][j] = j>1 && p[j-1] == "*" && result[0][j-2]
        }
        if s.count == 0 {
            return result[s.count][p.count]
        }
        for i in 1...s.count {
            for j in 1...p.count {
                if p[j-1] == "*" {
                    result[i][j] = result[i][j-2] ||
                        (result[i-1][j] && (p[j-2] == s[i-1] || p[j-2] == "."))
                }
                else {
                    result[i][j] = result[i-1][j-1] && (s[i-1] == p[j-1] || p[j-1] == ".")
                }
            }
        }
        return result[s.count][p.count]
    }
}