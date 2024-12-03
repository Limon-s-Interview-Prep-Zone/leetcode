class Solution:
    def addSpaces(self, s: str, spaces: List[int]) -> str:
        res = []
        j = 0
        for i, char in enumerate(s):
            if j < len(spaces) and i == spaces[j]:
                res.append(" ")
                j += 1

            res.append(char)

        return "".join(res)

# TC:O(n+m) and SC:O(n+m)