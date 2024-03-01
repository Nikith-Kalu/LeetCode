class Solution {
    func maximumOddBinaryNumber(_ s: String) -> String {
    let onesCount = s.filter { $0 == "1" }.count
    let zerosCount = s.count - onesCount
    if onesCount > 1 {
        return String(repeating: "1", count: onesCount - 1) + String(repeating: "0", count: zerosCount) + "1"
    } else {
        return String(repeating: "0", count: zerosCount) + "1"
    }
}
}