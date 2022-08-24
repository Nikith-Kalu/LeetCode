class Solution(object):
    def isPowerOfThree(self, n):
        if n < 1:
            return False
        elif n == 1:
            return True
        val = 1
        while val < n:
            val *= 3
            if val == n:
                return True
        return False
        