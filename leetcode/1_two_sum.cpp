#include <vector>
#include <iostream>
#include <unordered_map>


// Time complexity: O(n)
std::vector<int> two_sum(std::vector<int> &nums, int target)
{
    std::unordered_map<int, int> umap; // hash table for O(1) access

    for (int i = 0; i < nums.size(); ++i)
    {
        umap[nums[i]] = i;
    }

    for (int i = 0; i < nums.size(); ++i)
    {
        int complement = target - nums[i];
        auto it = umap.find(complement); // Returns key-value pair

        // First, checks if complement exists in the hash table
        // Then, compare the indices of the current loop 
        // with the complements index as not to allow 
        // the same number (e.g if there's only one 3 and target is 6)
        // to be returned
        if (it != umap.end() && it->second != i)
        {
            return {i, it->second};
        }
    }
    return {};
}


int main()
{

    std::vector<int> nums{3, 2, 4};
    int target{6};

    std::vector<int> indices = two_sum(nums, target);
    for (const auto &i : indices)
    {
        std::cout << i << " ";
    }
}


// Time complexity: O(n^2)
std::vector<int> two_sum_with_nested_loop(std::vector<int> &nums, int target)
{
    std::vector<int> indices{};
    for (int i = 0; i < nums.size(); ++i)
    {
        for (int j = i + 1; j < nums.size(); ++j)
        {
            if (nums[i] + nums[j] == target)
            {
                indices.insert(indices.end(), {i, j});
                return indices;
            }
        }
    }
    return indices;
}
