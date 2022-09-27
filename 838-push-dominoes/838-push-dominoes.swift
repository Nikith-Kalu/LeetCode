class Solution {
    func pushDominoes(_ dominoes: String) -> String {
        var sts = [Int](repeating: 0, count: dominoes.count)
        var force = 0
        for (i, d) in dominoes.enumerated().reversed() {
            guard d != "." else {
                sts[i] = force
                continue
            }
            force = d == "L" ? 1 : 0
        }
        //print(sts)
        force = 0
        for (i, d) in dominoes.enumerated() {
            guard d == "." else {
                force = d == "R" ? -2 : 0
                continue
            }
            sts[i] += force           
        }
        //print(sts)
        var p = -1
        for i in 1 ..< sts.count {
            if sts[i] == -1, sts[i-1] != -1 {
                p = i
            }
            if sts[i] != -1, sts[i-1] == -1 {
                var r = i - p
                for j in 0 ..< r {
                    sts[p + j] = j < (r / 2) ? -2 : 1  
                }
                if r % 2 == 1 {
                    sts[p + r/2] = 5
                }
                p = -1
            }
        }
        if p != -1 {
            var r = sts.count - p
            for j in 0 ..< r {
                sts[p + j] = j < (r / 2) ? -2 : 1  
            }
            if r % 2 == 1 {
                sts[p + r/2] = 5
            }
        }
        let ref = Array(dominoes)
        let s = sts.enumerated().map {t in
            return t.1 == 1 ? "L" : t.1 == -2 ? "R" : t.1 == 5 ? "." : ref[t.0]
        }
        return String(s)
    }
}