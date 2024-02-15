class Solution {
public:
    long long largestPerimeter(vector<int>& nums) {
        sort(nums.begin(), nums.end());
        
        long long psum = accumulate(nums.begin(), nums.end(), 0LL);
        
        for (int i = nums.size()-1; i >= 0; i--) {
            long long lsum = psum - nums[i];
            if (lsum <= nums[i])
                psum -= nums[i];
        }
        
        return psum ? psum : -1;
    }
};