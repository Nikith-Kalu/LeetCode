public class Solution extends VersionControl {
    public int firstBadVersion(int n) {
        return firstBadVersion(0, n);
    }
    
    private int firstBadVersion(int l, int r) {
        if (l == r) {
            return l;
        }
        int mid = l + (r - l) / 2;
        if (isBadVersion(mid)) {
            r = mid;
        }
        else {
            l = mid + 1;
        }
        return firstBadVersion(l, r);
    }
}