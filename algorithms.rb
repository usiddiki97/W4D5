# Execution Time Difference

# Learning Goals

# Be able to determine the time and space complexity of a method
# Be able to compare the time complexity of one method to another
# Be able to recognize when time or space complexity can be improved
# my_min

# Given a list of integers find the smallest number in the list.


# Phase I

# First, write a function that compares each element to every other element of the list.
# Return the element if all other elements in the array are larger.
# What is the time complexity for this function?

def my_min1(list)
    list.each_with_index do |num1, idx1| 
        min = num1 
        list.each_with_index do |num2, idx2|
            if idx2 > idx1
                min = num2 if num2 < num1
            end
        end
        return min
    end
end
# O(n^2) 

# Example:

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min1(list)  # =>  -5


# Phase II

# Now rewrite the function to iterate through the list just once while keeping track of
# the minimum. What is the time complexity?

def my_min2(list)
    list.inject {|accum, num| accum < num ? accum : num }
end
# O(n)

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min2(list)  # =>  -5

# Largest Contiguous Sub-sum

# You have an array of integers and you want to find the largest contiguous (together
# in sequence) sub-sum. Find the sums of all contiguous sub-arrays and return the max.


# Phase I

# Write a function that iterates through the array and finds all sub-arrays using
# nested loops. First make an array to hold all sub-arrays. Then find the sums of
# each sub-array and return the max.

def largest_contiguous_subsum1(list)
    subs = []
    
    (0...list.length).each do |idx1| #O(n) | 
        (idx1...list.length).each do |idx2| #O(n)
            subs << list[idx1..idx2]#O(n)
        end
    end
    #lines 66-70  O(n*n*n) => n^3
    subs.map {|sub| sub.sum }.max #O(n^2)
end
# O(n^3 + n^2) => O(n^3)


# Example:

# list = [5, 3, -7]
# p largest_contiguous_subsum1(list) # => 8

#     # possible sub-sums
#     [5]           # => 5
#     [5, 3]        # => 8 --> we want this one
#     [5, 3, -7]    # => 1
#     [3]           # => 3
#     [3, -7]       # => -4
#     [-7]          # => -7

# Example 2:

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum1(list) # => 8 (from [7, -6, 7])

# Example 3:

# list = [-5, -1, -3]
# p largest_contiguous_subsum1(list) # => -1 (from [-1])


# Discuss the time complexity of this solution.

# Phase II

# Let's make a better version. Write a new function using O(n) time with O(1) memory.
# Keep a running tally of the largest sum. To accomplish this efficient space complexity,
# consider using two variables. One variable should track the largest sum so far and
# another to track the current sum. We'll leave the rest to you.


def largest_contiguous_subsum2(list)
    largest = list.first #O(1)
    current = list.first #O(1)

    (1...list.length).each do |idx| #O(n)
        current = 0 if current < 0 #O(1)
        current += list[idx] #O(1)
        largest = current if current > largest #O(1)
    end
    largest #O(1)
end
# O(n)

# Example:

# list = [5, 3, -7]
# p largest_contiguous_subsum2(list) # => 8

#     # possible sub-sums
#     [5]           # => 5
#     [5, 3]        # => 8 --> we want this one
#     [5, 3, -7]    # => 1
#     [3]           # => 3
#     [3, -7]       # => -4
#     [-7]          # => -7

# Example 2:

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum2(list) # => 8 (from [7, -6, 7])

# Example 3:

list = [-5, -1, -3]
p largest_contiguous_subsum2(list) # => -1 (from [-1])

# Get your story straight, and then explain your solution's time complexity to your TA.