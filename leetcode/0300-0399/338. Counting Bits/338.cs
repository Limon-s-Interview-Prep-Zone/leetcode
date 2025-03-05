public class Solution
{
    public int[] CountBits(int n)
    {
        int[] res = new int[n + 1];
        for (int i = 1; i <= n; i++)
        {
            int j = i, count = 0;

            while (j != 0)
            {
                j = j & (j - 1);
                count++;
            }
            res[i] = count;
        }
        return res;
    }
}