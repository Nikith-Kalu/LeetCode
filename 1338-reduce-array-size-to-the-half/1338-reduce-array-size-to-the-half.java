class Solution {
    public int minSetSize(int[] arr) {
        Map<Integer, Integer> map = new HashMap<Integer, Integer>();
        int n = arr.length;
        n /= 2;
        for (int i : arr) 
            map.put(i, map.getOrDefault(i, 0) + 1);
        
        if (arr.length == map.size()) 
            return n;
        
        int c = 0, c1 = 0, k = 0;
        
        while (c == 0) {
            //find most frequent character
            Map.Entry<Integer, Integer> maxEntry = null;
            for(Map.Entry<Integer, Integer> entry : map.entrySet()) {
                if(maxEntry == null || entry.getValue().compareTo(maxEntry.getValue()) > 0) 
                    maxEntry = entry;
            }
            c1 += maxEntry.getValue();
            k++;
            map.replace(maxEntry.getKey(), Integer.MIN_VALUE);
            if(c1 >= n) 
                c = 1;
        }
        return k;
    }
}