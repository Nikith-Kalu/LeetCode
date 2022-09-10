class Solution {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        let count = prices.count
        if count <= 1 || k <= 0 { return 0 }
        
        var profit = 0
        if k >= count / 2 {
            for i in 0..<count - 1 {
                if prices[i] < prices[i + 1] { profit += prices[i + 1] - prices[i] }
            }
            return profit
        }
        
        var buy = Array(repeating: Int.min, count: k)
        var sell = Array(repeating: 0, count: k)

        for i in 0..<count {
            for j in 0..<k {
                buy[j] = max(buy[j], j == 0 ? 0 - prices[i] : sell[j - 1] - prices[i])
                sell[j] = max(sell[j], buy[j] + prices[i])
            }
        }
        return sell[k - 1]
    }
}