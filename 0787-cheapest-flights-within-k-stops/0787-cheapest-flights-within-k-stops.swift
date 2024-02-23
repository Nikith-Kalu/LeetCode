class Solution {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
    var cost = Array(repeating: Int.max, count: n)
    cost[src] = 0
    var temp = cost
    for _ in 0...K {
        for flight in flights {
            let current = flight[0], next = flight[1], price = flight[2]
            if cost[current] != Int.max && cost[current] + price < temp[next] {
                temp[next] = cost[current] + price
            }
        }
        cost = temp
    }
    return cost[dst] == Int.max ? -1 : cost[dst]
}

}