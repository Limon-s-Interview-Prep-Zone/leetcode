class Solution:
    def moveZeroes(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        n = len(nums)
        if n == 1:
            return
        l = i = 0
        while l < n:
            if nums[l]:
                nums[i], nums[l] = nums[l], nums[i]
                i += 1

            l += 1
