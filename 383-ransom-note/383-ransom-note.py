class Solution(object):
    def canConstruct(self, ransomNote, magazine):
        x = Counter(ransomNote)
        y = Counter(magazine)
        for i, v in x.items():
            if(x[i] <= y[i]):
                continue
            else:
                return False
        return True
        