public class Solution {
    public int[] RearrangeArray(int[] nums) {
        List<int> positives = new List<int>();
        List<int> negatives = new List<int>();
        
        // Separate positive and negative numbers
        foreach (var num in nums) {
            if (num > 0) {
                positives.Add(num);
            } else {
                negatives.Add(num);
            }
        }
        
        int[] result = new int[nums.Length];
        int posIndex = 0, negIndex = 0;
        
        // Alternate between positive and negative, preserving order
        for (int i = 0; i < nums.Length; i += 2) {
            result[i] = positives[posIndex++];
            result[i + 1] = negatives[negIndex++];
        }
        
        return result;
    }
}