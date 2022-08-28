class Solution:
    def findMedianSortedArrays(self, nums1: List[int], nums2: List[int]) -> float:
        n = len(nums1 + nums2)
        a = n/2
         
        if n % 2 == 0:
            a = round(a)
            num = sorted(nums1 + nums2)
            sum_n = (num[a - 1] + num[a]) / 2
            return(sum_n)
        else:
            a = int(a)
            num = sorted(nums1 + nums2)
            sum_n = (num[a])
            return(sum_n)