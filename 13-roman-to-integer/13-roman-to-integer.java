class Solution {
    public int romanToInt(String s) {
        int res = 0;
        int l = s.length();
        int last = 1000;
        for (int i = 0; i < l; i++){
            int v = getValue(s.charAt(i));
            if (v > last) res = res - last * 2;
            res = res + v;
            last = v;
        }
        return res;
    }
    private int getValue(char c) { 
        switch(c) {
            case 'I' : return 1;
            case 'V' : return 5;
            case 'X' : return 10;
            case 'L' : return 50;
            case 'C' : return 100;
            case 'D' : return 500;
            case 'M' : return 1000;
            default : return 0;
        }
    }
}