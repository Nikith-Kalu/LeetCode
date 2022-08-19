class Solution {
    public boolean isPossible(int[] nums) {
        
        int pre = Integer.MIN_VALUE;
        int p1 = 0;
        int p2 = 0;
        int p3 = 0;
        
        int cur = 0;
        int i = 0;
        while (i < nums.length) {
            int count = 0;
            cur = nums[i];
            while (i < nums.length && nums[i] == cur) {
                i++;
                count++;
            }
            int c1 = 0;
	        int c2 = 0;
	        int c3 = 0;
            if (cur == pre + 1) {
                while (p1 > 0 && count > 0) {
                    p1--;
                    c2++;
                    count--;
                }
                while (p2 > 0 && count > 0) {
                    p2--;
                    c3++;
                    count--;
                }
                while (p3 > 0 && count > 0) {
                    p3--;
                    c3++;
                    count--;
                }
            }
            if (p1 > 0 || p2 > 0) {
                return false;
            }
            while (count > 0) {
                c1++;
                count--;
            }
            pre = cur;
            p1 = c1;
            p2 = c2;
            p3 = c3;            
        }
        return (p1 == 0 && p2 == 0);
    }
}
