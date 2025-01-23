class Solution:
    def countPrefixes(self, words: List[str], s: str) -> int:
        count = 0
        for word in words:
            isPrefix = True
            for i in range(len(word)):
                if i >= len(s) or s[i] != word[i]:
                    isPrefix = False
                    break
            if isPrefix:
                count += 1
        return count
# TC: O(n*m)
# SC: O(1)