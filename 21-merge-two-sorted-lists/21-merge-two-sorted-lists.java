/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
    public ListNode mergeTwoLists(ListNode l1, ListNode l2) {
        if( l1 == null || l2 == null ) return l2 == null ? l1 : l2;
        ListNode first = (l2.val < l1.val) ? l2 : l1;
        first.next = mergeTwoLists(first.next, first == l1 ? l2 : l1);
        return first;
    }
}