class Solution(object):
    def isPowerOfThree(self, n):
        return (n > 0) and (3486784401 % n == 0)
        