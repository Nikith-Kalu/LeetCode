public class Solution extends VersionControl {
    public int firstBadVersion(int n) {
        int l = 0;
        int r = n;
        while (l <= r) {
            int mid = l + (r - l) / 2;
            if (!isBadVersion(mid))
                l = mid + 1;
            else 
                r = mid - 1;
        }
        return l;
    }
}