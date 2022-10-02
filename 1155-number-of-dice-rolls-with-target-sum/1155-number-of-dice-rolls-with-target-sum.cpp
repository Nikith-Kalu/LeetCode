class Solution {
public:
    int mod=1000000007;
    int solve(int n,int k,int target,vector<vector<int>>&dp)
    {
        if(n==0 and target==0)
        {
            return 1;
        }
        if(n==0 and target>0)
            return 0;
        if(n==0 and target<0)
            return 0;
        if(n>0 and target<=0)
            return 0;
        if(dp[n][target]!=-1)
            return dp[n][target];
        int count=0;
        for(int i=1;i<=k;i++)
        {
            count=(count%mod+solve(n-1,k,target-i,dp)%mod)%mod;
        }
        dp[n][target]=count;
        return count;
    }
    int numRollsToTarget(int n, int k, int target) {
        vector<vector<int>>dp(n+1,vector<int>(target+1,-1));
        return solve(n,k,target,dp);
    }
};