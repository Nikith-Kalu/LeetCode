class Solution:
    def minCost(self, colors: str, neededTime: List[int]) -> int:
        ans = 0
        prvcolor = ""
        prvtime = 0
        for color, time in zip(colors, neededTime):
            if color==prvcolor:
                ans += min(time, prvtime)
                prvtime = max(time, prvtime)
            else:
                prvcolor = color
                prvtime = time
        return ans