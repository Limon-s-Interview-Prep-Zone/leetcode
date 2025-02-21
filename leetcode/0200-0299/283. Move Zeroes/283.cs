public class Solution
{
    public void MoveZeroes(int[] nums)
    {
        int l = 0, i = 0, n = nums.Length;
        while (l < n)
        {
            if (nums[l] != 0)
            {
                int temp = nums[i];
                nums[i] = nums[l];
                nums[l] = temp;
                i++;
            }
            l++;
        }
    }
}