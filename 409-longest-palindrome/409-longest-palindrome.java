class Solution {
    public int longestPalindrome(String s) {
        int[] freq = new int[128];
        for (int i = 0; i < s.length(); i++) {
            freq[s.charAt(i)]++;
        }
        int count = 0;
        boolean one = false;
        for (int i = 0; i < 128; i++) {
            if (freq[i] == 0) {
                continue;
            }
            int ct = freq[i];
            if ((ct & 1) == 1) {
                count += (ct - 1);
                one = true;
            } else {
                count += ct;
            }
        }
        if (one) {
            count++;
        }
        return count;
    }
}