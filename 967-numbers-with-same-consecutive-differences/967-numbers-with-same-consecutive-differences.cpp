class Solution {
public:
    void solve(vector<int> &x,int i,int n, int k , int c , int res){
        if (c==n){
            if (res>= pow(10,n-1)){
                x.push_back(res);
                return;
            }
            return;
        }
        if (i<10 && i > -1){
            res=res*10+i;
            if (c!=n-1 && k!=0){
                solve(x,i+k,n,k,c+1,res);
                solve(x,i-k,n,k,c+1,res);
            }
            else{
                solve(x,i,n,k,c+1,res);
            }
        }
        return;
    }
    
    vector<int> numsSameConsecDiff(int n, int k) {
        vector<int> x;
        for(int i=0 ; i < 10 ; i++){
            solve(x,i,n,k,0,0);
        }
        return x;
    }
};