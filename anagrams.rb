# Anagrams

# Our goal today is to write a method that determines if two given words are anagrams.
# This means that the letters in one word can be rearranged to form the other word.
# For example:

# Assume that there is no whitespace or punctuation in the given strings.

# Learning Goals

# Be able to determine the time and space complexity of a method
# Be able to recognize when and how time or space complexity can be improved
# Be able to compare different methods and discuss how changing inputs affects each
# one's overall runtime

# Phase I:

# Write a method #first_anagram? that will generate and store all the possible anagrams
# of the first string. Check if the second string is one of these.

def first_anagram?(str1, str2)
    all_anagrams1 = str1.split("").permutation.to_a.map(&:join) #O(n! + n^2)
    all_anagrams1.include?(str2) #(n)
end
# O(n!)

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true

# Hints:

# For testing your method, start with small input strings, otherwise you might wait a while
# If you're having trouble generating the possible anagrams, look into this method.
# What is the time complexity of this solution? What happens if you increase the size of
# the strings?

# Phase II:

# Write a method #second_anagram? that iterates over the first string. For each letter
# in the first string, find the index of that letter in the second string (hint: use
# Array#find_index) and delete at that index. The two strings are anagrams if an index
# is found for every letter and the second string is empty at the end of the iteration.

# Try varying the length of the input strings. What are the differences between 
# #first_anagram? and #second_anagram??

def second_anagram?(str1, str2)
    arr1 = str1.split("") #O(n)
    arr2 = str2.split("") #O(n)

    arr1.each do |char| #O(n)
        idx = arr2.index(char) #O(n)
        idx.nil? ? (return false) : arr2.delete_at(idx) #O(1)
    end
    arr2.empty? #O(1)
end
# O(n^2)

p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true



# Phase III:

# Write a method #third_anagram? that solves the problem by sorting both strings
# alphabetically. The strings are then anagrams if and only if the sorted versions are
# the identical.

# What is the time complexity of this solution? Is it better or worse than #second_anagram??

def third_anagram?(str1, str2)
    sorted1 = str1.split("").sort.join #O(n + nlogn + n) => O(nlogn)
    sorted2 = str2.split("").sort.join #O(n + nlogn + n) => O(nlogn)

    sorted1 == sorted2 #O(1)
end
#(nlogn)

p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true

# Phase IV:

# Write one more method #fourth_anagram?. This time, use two Hashes to store the number
# of times each letter appears in both words. Compare the resulting hashes.

# What is the time complexity?

def fourth_anagram?(str1, str2)
    count1 = Hash.new(0) 
    count2 = Hash.new(0)

    str1.each_char {|char| count1[char] += 1} 
    str2.each_char {|char| count2[char] += 1}
    
    count1 == count2
end
#O(n)

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true

# Bonus: Do it with only one hash.

def fifth_anagram?(str1, str2)
    count = Hash.new(0)
    str1.each_char {|char| count[char] += 1}
    str2.each_char {|char| count[char] -= 1}

    count.all? {|k,v| v.zero? }
end
#O(n)

p fifth_anagram?("gizmo", "sally")    #=> false
p fifth_anagram?("elvis", "lives")    #=> true

# Discuss the time complexity of your solutions together, then call over your TA to look
# at them.