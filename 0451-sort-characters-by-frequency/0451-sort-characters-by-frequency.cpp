#include <iostream>
#include <unordered_map>
#include <vector>
#include <algorithm>
#include <string>

class Solution {
public:
    std::string frequencySort(std::string s) {
    std::unordered_map<char, int> freqMap;
    for (char c : s) {
        freqMap[c]++;
    }
        
    std::vector<std::pair<char, int>> chars;
    for (auto& p : freqMap) {
        chars.push_back(p);
    }

    std::sort(chars.begin(), chars.end(), [](const std::pair<char, int>& a, const std::pair<char, int>& b) {
        return a.second > b.second;
    });

    std::string result;
    for (auto& p : chars) {
        result += std::string(p.second, p.first);
    }

    return result;
}
};