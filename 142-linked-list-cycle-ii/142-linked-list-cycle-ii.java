/**
 * Definition for singly-linked list.
 * class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) {
 *         val = x;
 *         next = null;
 *     }
 * }
 */
public class Solution {
    public ListNode detectCycle(ListNode head) {
        // Action plan: 
        // find if the cycle exists using tortoise and hare method (slow and fast pointers)
        ListNode slow = head, fast = head;
        while(fast != null && fast.next != null) {
            slow = slow.next;
            fast = fast.next.next;
            if(slow == fast)
                break;
        }
        if(fast == null || fast.next == null) return null;
            ListNode entry = head;
            while(slow != entry) {
                entry = entry.next;
                slow = slow.next;
            }
        return entry;
    }
}