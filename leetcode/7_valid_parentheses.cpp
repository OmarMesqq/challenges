#include <string>
#include <format>
#include <iostream>
#include <vector>
#include <unordered_map>


bool isValidString(const std::string& input) {
    std::unordered_map<int,char> umap {};
    const size_t inputSize = input.size();

    for (int i = 0; i < inputSize; ++i) {
        umap[i] = input[i];
    }


    for (const auto& token: input) {
        switch(token) {
            case '(':
                umap.find(')');
                break;
            case '{':
                umap.find('}');
                break;
            case '[':
                umap.find(']');
                break;
            default:
                throw std::runtime_error("Invalid character!");

        }
    }
}

int main() {
    return 0;
}
