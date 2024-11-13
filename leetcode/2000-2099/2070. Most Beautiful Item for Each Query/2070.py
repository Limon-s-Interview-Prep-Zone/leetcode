from typing import List
# [[1,2],[3,2],[2,4],[5,6],[3,5]]  q= [1,2,3,4,5,6]
# Preproces: soerting: [[1, 2], [2, 4], [3, 2], [3, 5], [5, 6]]
class Solution:
    def maximumBeauty(self, items: List[List[int]], queries: List[int]) -> List[int]:
        res = [0] * len(queries)
        items.sort()
        # to track the index
        query_with_indices = sorted([(q, i) for i, q in enumerate(queries)])
        l = 0
        max_beautiful = 0

        for q, i in query_with_indices:
            while l < len(items) and items[l][0] <= q:
                max_beautiful = max(max_beautiful, items[l][1])
                l += 1

            res[i] = max_beautiful

        return res
# [[1,2],[3,2],[2,4],[5,6],[3,5]]  q= [1,2,3,4,5,6]
#  Preprocess: sorting p + compute max upto==> [[1, 2], [2, 4], [3, 4], [3, 5], [5, 6]]
#  Applied: binary search 

class Solution:
    def maximumBeauty(self, items: List[List[int]], queries: List[int]) -> List[int]:
        res = [0] * len(queries)
        items_upto = []
        max_beauty = 0
        items.sort() #mlogm

        for i, b in items:
            max_beauty = max(max_beauty, b)
            items_upto.append([i, max_beauty])

        for i, q in enumerate(queries): #TC: n
            l, r = 0, len(items_upto) - 1
            pos = -1
            while l <= r: # TC: log m
                mid = (l + r) // 2
                if items_upto[mid][0] <= q:
                    pos = mid
                    l = mid + 1
                else:
                    r = mid - 1

            res[i] = items_upto[pos][1] if pos >= 0 else 0
        return res
# TC: O(mLogm)+ O(nlogm)
# SC: O(m)+ O(n)