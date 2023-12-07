#include <string>
#include <format>
#include <iostream>
#include <vector>

int lengthOfLongestSubstring(const std::string &s)
{
    std::vector<char> substring {};
    char current {};
    char compared {};

    size_t s_size = s.size();

    for (int i = 0; i < s_size; ++i)
    {
        current = s[i];
        if (substring.size() == 0)
        {
            substring.push_back(current);
            continue;
        }

        for (int j = 0; j < i; ++j) {
            compared = substring[j];

            if (current == compared) {
                substring.clear();
                substring.push_back(current);
            }
            else {
                if (s[i + 1] == '\000') {
                    substring.push_back(current);
                    break;
                }
            }
        }
        substring.push_back(current);
    }
    return substring.size();
};

int main()
{
    std::string s{"bb"}; // abcabcbb
    int length = lengthOfLongestSubstring(s);

    std::string output = std::format("Length: {}", length);
    std::cout << output << std::endl;
    return 0;
}
