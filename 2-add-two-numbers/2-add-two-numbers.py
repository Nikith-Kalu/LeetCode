class Solution:
    def addTwoNumbers(self, l1, l2):
        s1 = ''
        s2 = ''
        while l1 != None:
            s1 += str(l1.val)
            l1 = l1.next
        while l2 != None:
            s2 += str(l2.val)
            l2 = l2.next
        
        sum1 = int(s1[::-1]) + int(s2[::-1])
        sum1 = str(sum1)
        head = ListNode(int(sum1[0]))
        for i in sum1[1:]:
            node = ListNode(int(i))
            node.next = head
            head = node
        return head