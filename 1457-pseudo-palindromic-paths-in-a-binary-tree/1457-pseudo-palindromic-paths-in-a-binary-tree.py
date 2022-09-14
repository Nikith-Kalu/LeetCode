class Solution:
    def pseudoPalindromicPaths (self, root: Optional[TreeNode]) -> int:
        ans=[0]
        def solve(root,path):
            if not root:
                return
            if root.val in path:
                path[root.val]+=1
            else:
                path[root.val]=1
            
            if not root.left and not root.right:
                o=0
                for i in path:
                    if path[i]%2!=0:
                        o+=1
                if o in [0,1]:
                    ans[0]+=1
                    
            else:
                
                solve(root.left,path.copy())
                solve(root.right,path.copy())
        solve(root,{})
        return ans[0]