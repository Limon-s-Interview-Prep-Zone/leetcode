class Solution:
    def hammingWeight(self, n: int) -> int:
        res = 0
        while n:
            if n & 1:
                res += 1
            n = n >> 1
        return res
# TC: O(log N)