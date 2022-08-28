class Solution {
public:
    string convert(string s, int numRows) {
        string ans = "";
        if(s.size() <= numRows || numRows == 1) return s;
    for(int i = 1; i <= numRows; i++) {
        int j = i;
        ans += s[j - 1];
        bool check = false;
        
        while(j <= s.size()) {
            if((!check || i == 1) && i != numRows) {
                j += (2 * numRows - 2 * i);
                check = true;
            }
            else {
                j += (i - 1) * 2;
                check = false;
            }
            if(j <= s.size()) {
                ans += s[j - 1];
            }
        }
    }
        return ans;
    }
};