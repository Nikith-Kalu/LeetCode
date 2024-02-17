class Solution {
    func furthestBuilding(_ heights: [Int], _ bricks: Int, _ ladders: Int) -> Int {
    var bricks = bricks
    var heap = [Int]()
    let n = heights.count

    for i in 0..<n-1 {
        let diff = heights[i + 1] - heights[i]
        
        if diff > 0 {
            if heap.count < ladders {
                heap.append(diff)
                heap.sort() 
            } else {
                let extraBricksNeeded = heap.count > 0 ? min(diff, heap[0]) : diff
                if bricks >= extraBricksNeeded {
                    if heap.count > 0 && diff > heap[0] {
                        bricks -= heap.removeFirst()
                        heap.append(diff)
                        heap.sort()
                    } else {
                        bricks -= diff
                    }
                } else {
                    return i
                }
            }
        }
    }
    
    return n - 1
}
}