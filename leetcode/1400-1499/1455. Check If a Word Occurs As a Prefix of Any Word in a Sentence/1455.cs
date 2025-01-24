public class Solution
{
    public int IsPrefixOfWord(string sentence, string searchWord)
    {
        string[] words = sentence.Split(" ");
        int searchLength = searchWord.Length;
        for (int i = 0; i < words.Length; i++)
        {
            string word = words[i];
            int wordLength = word.Length;
            if (wordLength >= searchLength)
            {
                bool isPrefix = true;
                for (int j = 0; j < searchLength; j++)
                {
                    if (word[j] != searchWord[j])
                    {
                        isPrefix = false;
                        break;
                    }
                }
                if (isPrefix)
                    return i + 1;
            }
        }
        return -1;
    }
}