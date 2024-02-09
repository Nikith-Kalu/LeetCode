function largestDivisibleSubset(nums: number[]): number[] {
    nums.sort((a, b) => a - b);
    const dp: number[] = Array(nums.length).fill(1);
    const prev: number[] = Array(nums.length).fill(-1);
    let maxIndex = 0;

    for (let i = 1; i < nums.length; i++) {
        for (let j = 0; j < i; j++) {
            if (nums[i] % nums[j] === 0 || nums[j] % nums[i] === 0) {
                if (dp[j] + 1 > dp[i]) {
                    dp[i] = dp[j] + 1;
                    prev[i] = j;
                }
            }
        }
        if (dp[i] > dp[maxIndex]) {
            maxIndex = i;
        }
    }
    const largestSubset: number[] = [];
    for (let i = maxIndex; i !== -1; i = prev[i]) {
        largestSubset.push(nums[i]);
    }

    return largestSubset.reverse();
}