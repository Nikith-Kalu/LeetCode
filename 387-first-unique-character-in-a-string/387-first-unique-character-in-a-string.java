class Solution {
    public int firstUniqChar(String s) {
        int[] pos = new int[26]; 
        Arrays.fill(pos, -1);
        Set<Character> occurence = new HashSet<>(); 
        
        for(int i = 0; i < s.length(); i++) {
            char ch = s.charAt(i);
            if(!occurence.contains(ch)) {
                occurence.add(ch);
                pos[ch - 'a'] = i;
            } else {
                pos[ch - 'a'] = -1;
            }
        }
        
        int minIndex = Integer.MAX_VALUE;
        for(int i = 0; i < 26; i++) {
            if(pos[i] != -1) minIndex = Math.min(minIndex, pos[i]);
        }
        
        return minIndex == Integer.MAX_VALUE ? -1 : minIndex;
    }
}