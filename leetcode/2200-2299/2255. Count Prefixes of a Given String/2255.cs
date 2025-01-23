public class Solution {
    public int CountPrefixes(string[] words, string s) {
        int count = 0;
        for(int i=0; i<words.Length; i++){
            if(s.StartsWith(words[i])){
                count++;
            }
        }
        return count;
    }
}
// TC: O(N*M)
// SC: O(1)