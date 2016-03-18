require 'byebug'
require_relative 'sandq.rb'
def my_min(list)
  min = list.first
  i = 1
  while i < list.length
    if list[i] < min
      min = list[i]
    end
    i += 1
  end
  min
end

def continuous_sum(arr)
  i = 0
  subarrs = []
  while i < arr.length-1
    j = i + 1
    while j < arr.length
      subs = arr[i..j]
      subarrs << subs
      j += 1
    end
    i += 1
  end
  max = 0
  max_arr = []
  subarrs.each do |subs|
    sum = 0
    subs.each do |el|
      sum += el
    end
    if sum > max
      max = sum
      max_arr = subs
    end
  end
  max_arr

end

def continuous_sum2(arr)
  max_sum = arr.first
  current_sum = arr.first
  arr.each_with_index do |el, i|
    next if i == arr.length-1
    current_sum += arr[i+1]
    if current_sum > max_sum
      max_sum = current_sum
    elsif current_sum < 0
      current_sum = 0
    end
  end
  max_sum
end

def first_anagram?(str, str2)
  str1_arr = str.split('')
  anagrams_arr = str1_arr.permutation.to_a
  a = []
  anagrams_arr.aech do |arr|
    a << arr.join('')
  end
  p a
  return a.include?(str2)
end

def second_anagram?(str1, str2)
  return false if str1.length != str2.length
  str1.each_char do |char|
    if str2.include?(char)
      str2.delete!(char)
      str1.delete!(char)
    end
  end

  return true if str1.length == 0 && str2.length == 0
  false
end

def third_anagram?(str1, str2)
  arr1 = str1.split('').sort
  arr2 = str2.split('').sort
  return arr1 == arr2
end

def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  str1.each_char do |char|
    hash1[char] += 1
  end
  str2.each_char do |char|
    hash2[char] += 1
  end

  return hash1 == hash2
end

def bonus_anagram?(str1, str2)
  hash1 = Hash.new(0)
  str1.each_char do |char|
    hash1[char] += 1
  end
  str2.each_char do |char|
    hash1[char] -= 1
  end

  return hash1.values.all? {|val| val == 0}
end

def bad_two_sum?(arr, target)
  #time complexity: O(n**2)
  i = 0
  while i < arr.length-1
    j = i + 1
    while j < arr.length
      if arr[i] + arr[j] == target
        return true
      end
      j += 1
    end

    i += 1
  end
  false
end

def okay_two_sum?(arr, target)
  arr.sort.each_with_index do |num, idx|
    second_target = target - num
    return false if num > second_target
    return false if idx == arr.length-1
    subs = arr[idx+1..-1]
    return true if subs.bsearch(second_target)
  end
end

def pair_sum?(arr, target)
  numbers = Hash.new(0)
  arr.each do |num|
    numbers[num] += 1
  end

  arr.each do |num|
    search = target - num
    if search == num
      return true if numbers[num] > 1
    else
      return true if numbers.has_key?(search)
    end
  end
  false
end

def windowed_max_range(arr, w)
  current_max = 0

  subarr = []
  iterations = arr.length - w + 1
  iterations.times do |i|
    subarr = arr[i...i+w]
    sorted = subarr.sort
    range = sorted.last - sorted.first
    p range
    if range > current_max
      current_max = range
    end
  end
  current_max
end
