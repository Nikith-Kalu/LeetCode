class Solution {
    public int fib(int n) {
        if (n==0) return 0;
        else if (n==1) return 1;
        int first = 0;
        int second = 1;
        int currIndex = 2;
        int curr = 0;
        while (currIndex <= n ) {
            curr = first + second;
            first = second;
            second = curr;
            currIndex++;
        }
        return curr;
    }
}