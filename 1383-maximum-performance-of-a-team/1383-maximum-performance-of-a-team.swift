public struct Heap<T> {
  var nodes = [T]()
  private var orderCriteria: (T, T) -> Bool

  public init(sort: @escaping (T, T) -> Bool) {
    self.orderCriteria = sort
  }

  public init(array: [T], sort: @escaping (T, T) -> Bool) {
    self.orderCriteria = sort
    configureHeap(from: array)
  }

  private mutating func configureHeap(from array: [T]) {
    nodes = array
    for i in stride(from: (nodes.count/2-1), through: 0, by: -1) {
      shiftDown(i)
    }
  }
  
  public var isEmpty: Bool {
    return nodes.isEmpty
  }
  
  public var count: Int {
    return nodes.count
  }

  @inline(__always) internal func parentIndex(ofIndex i: Int) -> Int {
    return (i - 1) / 2
  }

  @inline(__always) internal func leftChildIndex(ofIndex i: Int) -> Int {
    return 2*i + 1
  }

  @inline(__always) internal func rightChildIndex(ofIndex i: Int) -> Int {
    return 2*i + 2
  }

  public mutating func push(_ value: T) {
    nodes.append(value)
    shiftUp(nodes.count - 1)
  }
    
  public func peek() -> T? {
    return nodes.first
  }    

  @discardableResult public mutating func pop() -> T? {
    guard !nodes.isEmpty else { return nil }
    
    if nodes.count == 1 {
      return nodes.removeLast()
    } else {
      // Use the last node to replace the first one, then fix the heap by
      // shifting this new first node into its proper position.
      let value = nodes[0]
      nodes[0] = nodes.removeLast()
      shiftDown(0)
      return value
    }
  }

  internal mutating func shiftUp(_ index: Int) {
    var childIndex = index
    let child = nodes[childIndex]
    var parentIndex = self.parentIndex(ofIndex: childIndex)
    
    while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
      nodes[childIndex] = nodes[parentIndex]
      childIndex = parentIndex
      parentIndex = self.parentIndex(ofIndex: childIndex)
    }
    
    nodes[childIndex] = child
  }

  internal mutating func shiftDown(from index: Int, until endIndex: Int) {
    let leftChildIndex = self.leftChildIndex(ofIndex: index)
    let rightChildIndex = leftChildIndex + 1

    var first = index
    if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
      first = leftChildIndex
    }
    if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
      first = rightChildIndex
    }
    if first == index { return }
    
    nodes.swapAt(index, first)
    shiftDown(from: first, until: endIndex)
  }
  
  internal mutating func shiftDown(_ index: Int) {
    shiftDown(from: index, until: nodes.count)
  } 
}

class Solution {
    func maxPerformance(_ n: Int, _ speed: [Int], _ efficiency: [Int], _ k: Int) -> Int {
        var performance = [[Int]]()
        for i in 0..<n {
            performance.append([efficiency[i], speed[i]])
        }
        performance.sort(by: {$0[0] > $1[0]})
        var minHeap = Heap<Int>{ $0 < $1 }
        var speedSum = 0, result = 0
        for p in performance {
            let e = p[0], s = p[1]
            speedSum += s
            minHeap.push(s)
            if minHeap.count > k {
                speedSum -= minHeap.pop()!
            }
            result = max(result, speedSum*e)
        }        
        return result % (1000000007)
    }
}