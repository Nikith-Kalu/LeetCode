class Solution {
    func concatenatedBinary(_ n: Int) -> Int {
        let d = 1_000_000_007
        var x = 1
        for i in stride(from: 2, through: n, by: 1) {
            x = ((x << (i.bitWidth - i.leadingZeroBitCount)) + i) % d
        }
        return x
    }
}