class Solution {
    func reverse(_ x: Int) -> Int {
        let absolute = abs(x)
        let string = String(absolute)
        let reversedString = String(string.reversed())
        let int = Int32(reversedString)
        guard var result = int else { return 0 }
        if x < 0 {
            result = result * -1
        }
        return Int(result)
    }
}