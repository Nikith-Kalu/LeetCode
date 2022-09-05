function threeSum(nums: number[]): number[][] {
  nums.sort((a, b) => a - b)

  const ans: number[][] = []

  const target = 0

  for (let i = 0; i < nums.length - 2; i++) {
    if (nums[i] > target) continue

    if (i > 0 && nums[i] === nums[i - 1]) continue

    let start = i + 1
    let end = nums.length - 1

    while (start < end) {
      const sum = nums[i] + nums[start] + nums[end]

      if (sum === target) {
        ans.push([nums[i], nums[start], nums[end]])

        while (nums[start] === nums[start + 1]) start++
        while (nums[end] === nums[end - 1]) end--

        start++
        end--
      } else if (sum < target) {
        start++
      } else {
        end--
      }
    }
  }

  return ans
}