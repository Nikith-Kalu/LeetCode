class Solution {
    func intToRoman(_ num: Int) -> String {
        var num = num
        return
            extract("M", 1000, &num) +
            extract("CM", 900, &num) +
            extract("D", 500, &num) +
            extract("CD", 400, &num) +
            extract("C", 100, &num) +
            extract("XC", 90, &num) +
            extract("L", 50, &num) +
            extract("XL", 40, &num) +
            extract("X", 10, &num) +
            extract("IX", 9, &num) +
            extract("V", 5, &num) +
            extract("IV", 4, &num) +
            extract("I", 1, &num)
    }

    func extract(_ symbol: String, _ value: Int, _ num: inout Int) -> String {
        let div = num / value
        num = num % value
        var result = ""
        for i in 0..<div {
            result.append(symbol)
        }
        return result
    }
}