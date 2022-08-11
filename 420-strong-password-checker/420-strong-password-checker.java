class Solution {
        public int strongPasswordChecker(String s)
        {
            int requiredChar = GetRequiredChar(s);
            if (s.length() < 6) return Math.max(requiredChar, 6 - s.length());
            
            int replace = 0; 
            int oned = 0;
            int twod = 0;

            for (int i = 0; i < s.length();) {
                int len = 1;
                    while (i + len < s.length() && s.charAt(i + len) == s.charAt(i + len - 1)) {
                        len++;
                        }
                if (len >= 3) {
                    replace += len / 3;
                    if (len % 3 == 0) oned += 1;
                    if (len % 3 == 1) twod += 2;
                }
                i += len;
            }
                 
            if (s.length() <= 20) return Math.max(requiredChar, replace);
            int deleteCount = s.length() - 20;
            replace -= Math.min(deleteCount, oned);
            replace -= Math.min(Math.max(deleteCount - oned, 0), twod) / 2;
            replace -= Math.max(deleteCount - oned - twod, 0) / 3;
            return deleteCount + Math.max(requiredChar, replace);
        }

        int GetRequiredChar(String s)
        {
            int lowercase = 1, uppercase = 1, digit = 1;
            for (var c : s.toCharArray())
            {
                if (Character.isLowerCase(c)) 
                    lowercase = 0;
                else if (Character.isUpperCase(c)) 
                    uppercase = 0;
                else if (Character.isDigit(c)) 
                    digit = 0;
            }
            return lowercase + uppercase + digit;
        }
}