class Solution {
    public ListNode reverseList(ListNode head) {
        ListNode prevHead = null;
        while(head != null) {
            ListNode recordNext = head.next;
            head.next = prevHead;
            prevHead = head;
            head = recordNext;
        }
        return prevHead;
    }
}