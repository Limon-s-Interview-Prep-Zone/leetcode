class Solution:
    def transpose(self, matrix: List[List[int]]) -> List[List[int]]:
        m, n = len(matrix), len(matrix[0])
        result = [[0] * m for _ in range(n)]
        for i in range(m):
            for j in range(n):
                result[j][i] = matrix[i][j]
        return result
        # return [[matrix[i][j] for i in range(m)] for j in range(n)]

# TC=O(M*n)
# SC: O(m*n)