class Solution {
    public int maximumWealth(int[][] accounts) {
        int max = 0;
        
        for (int[] arr : accounts) {
            int money = 0;
        
            for (int i : arr) {
                money += i; 
            }
            max = Math.max(max, money);
        } 
        return max;
    }
}