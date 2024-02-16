class Solution {
public:
    int findLeastNumOfUniqueInts(vector<int>& arr, int k) {
    unordered_map<int, int> freqMap;
    // Count the frequency of each element
    for (int num : arr) {
        freqMap[num]++;
    }

    // Sort elements by frequency
    vector<int> frequencies;
    for (auto& it : freqMap) {
        frequencies.push_back(it.second);
    }
    sort(frequencies.begin(), frequencies.end());

    // Remove k elements starting from the lowest frequencies
    int uniqueCount = freqMap.size(); // Start with total unique numbers
    for (int freq : frequencies) {
        if (k >= freq) {
            k -= freq; // Remove this many elements
            uniqueCount--; // One less unique number
        } else {
            // Can't remove more elements, break out
            break;
        }
    }

    return uniqueCount;
}
};