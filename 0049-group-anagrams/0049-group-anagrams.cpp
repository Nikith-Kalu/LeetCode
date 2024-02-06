#include <vector>
#include <string>
#include <algorithm>
#include <unordered_map>

class Solution {
public:
    std::vector<std::vector<std::string>> groupAnagrams(std::vector<std::string>& strs) {
        std::unordered_map<std::string, std::vector<std::string>> map;
        for (std::string& str : strs) {
            std::string key = str;
            std::sort(key.begin(), key.end());
            map[key].push_back(str);
        }

        std::vector<std::vector<std::string>> result;
        for (auto& pair : map) {
            result.push_back(pair.second);
        }

        return result;
    }
};