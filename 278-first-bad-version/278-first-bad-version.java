public class Solution extends VersionControl {
    public int firstBadVersion(int n) {
        if (n == 1) return 1;
        return firstBad(0, n);
    }
    
    public int firstBad(int leftGood, int rightBad) {
        if (leftGood + 1 == rightBad) return rightBad;
        int guess = ((rightBad - leftGood) / 2) + leftGood;
        if (isBadVersion(guess)) {
            return firstBad(leftGood, guess);
        } else {
            return firstBad(guess, rightBad);
        }   
    }
}