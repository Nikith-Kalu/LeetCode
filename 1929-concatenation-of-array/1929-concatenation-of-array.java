class Solution {
    public int[] getConcatenation(int[] nums) {
        int arr[] = new int[(nums.length * 2)];
        for(int i = 0; i < nums.length; i++){
			//first half of output array
            arr[i] = nums[i];
			//second half of output array
            arr[i + nums.length] = nums[i];
        }
        return arr;
    }
}