/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    let dummy = ListNode(0, head)
    var start: ListNode? = dummy
    var end: ListNode? = dummy
    for _ in 0..<n+1 {
        end = end?.next
    }
    while end != nil {
        start = start?.next
        end = end?.next
    }
    start?.next = start?.next?.next

    return dummy.next
}
}


