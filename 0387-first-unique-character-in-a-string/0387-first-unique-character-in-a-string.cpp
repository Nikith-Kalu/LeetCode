class Solution {
public:
    #include <vector>
    #include <string>

    int firstUniqChar(string s) {
        vector<int> charCount(26, 0);
        for (char c : s) {
        charCount[c - 'a']++;
        }
        for (int i = 0; i < s.length(); i++) {
            if (charCount[s[i] - 'a'] == 1) {
                return i; 
            }
        }
        return -1;
    }

};