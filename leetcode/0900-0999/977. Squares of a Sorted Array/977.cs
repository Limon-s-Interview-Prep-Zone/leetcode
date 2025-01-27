public class Solution
{
    public int[] SortedSquares(int[] nums)
    {
        int n = nums.Length, l = 0, r = n - 1, idx = r;
        int[] res = new int[n];

        while (l <= r)
        {
            int lSqure = nums[l] * nums[l];
            int rSqure = nums[r] * nums[r];
            if (lSqure > rSqure)
            {
                res[idx] = lSqure;
                l++;
            }
            else
            {
                res[idx] = rSqure;
                r--;
            }
            idx--;
        }
        return res;
    }
}
// TC: O(N)
// SC: O(N)