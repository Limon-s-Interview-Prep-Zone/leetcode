class Solution:
    def sortedSquares(self, nums: List[int]) -> List[int]:
        for i, num in enumerate(nums):
            nums[i] = num * num
        nums.sort()
        return nums
## TC: O(nLogn)
## SC: O(1)

class Solution:
    def sortedSquares(self, nums: List[int]) -> List[int]:
        n = len(nums)
        l, r = 0, n - 1
        idx = n - 1
        res = [0] * n
        while l <= r:
            if abs(nums[l]) > abs(nums[r]):
                res[idx] = nums[l] * nums[l]
                l += 1
            else:
                res[idx] = nums[r] * nums[r]
                r -= 1
            idx -= 1
        return res
