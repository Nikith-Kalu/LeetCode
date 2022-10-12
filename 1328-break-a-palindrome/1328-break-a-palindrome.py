class Solution:
    def breakPalindrome(self, palindrome: str) -> str:
        n = len(palindrome) // 2
        for i in range(n):
            if ord(palindrome[i]) > ord("a"):
                return palindrome[:i] + "a" + palindrome[i + 1 :]
        return palindrome[:-1] + "b" if len(palindrome) > 1 else ""