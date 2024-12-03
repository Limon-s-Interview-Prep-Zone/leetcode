public class Solution
{
    public string AddSpaces(string s, int[] spaces)
    {
        int i = 0, j = 0, k = 0;
        int n = s.Length, m = spaces.Length;
        var res = new char[n + m];
        while (i < n)
        {
            if (j < m && i == spaces[j])
            {
                res[k++] = ' ';
                j++;
            }
            res[k++] = s[i++];
        }

        return new String(res);
    }
}

// TC:O(n+m) && SC:O(n+m)