class Solution(object):
    def isPalindrome(self, head):
        if not head or not head.next:
            return True
        slow = head
        fast = head
        
        while fast.next and fast.next.next:
            slow = slow.next
            fast = fast.next.next
            
        if fast.next:
            slow = slow.next
            fast = fast.next
        prev = slow
        curr = prev.next
        
        while curr:
            tmp = curr.next
            curr.next = prev
            prev = curr
            curr = tmp
            
        while head != fast:
            if head.next == fast:
                return head.val == fast.val
            elif head.val != fast.val:
                return False
            else:
                head = head.next
                fast = fast.next
        return True
            