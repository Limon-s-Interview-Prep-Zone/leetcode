class Solution:
    def isPrefixOfWord(self, sentence: str, searchWord: str) -> int:
        words = sentence.split(" ")

        for i, word in enumerate(words):
            # if len(word)>=len(searchWord) and searchWord==word[:len(searchWord)]:
            #     return i+1
            if str.startswith(word, searchWord):
                return i + 1
            
        return -1
# TC: O(n*m)
# SC: O(n)