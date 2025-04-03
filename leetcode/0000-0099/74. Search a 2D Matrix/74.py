class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        n = len(matrix[0])
        low, high = 0, len(matrix) * n - 1
        while low <= high:
            mid = low + ((high - low) >> 1)
            row = mid // n
            col = mid % n
            if matrix[row][col] == target:
                return True
            elif matrix[row][col] < target:
                low = mid + 1
            else:
                high = mid - 1

        return False
    
    # TC: O(log(r*col))
    # SC: O(1)
