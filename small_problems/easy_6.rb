# Problem 1:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: Write a method that takes a floating point number that represents an angle
# between 0 and 360 degrees and returns a String that represents that angle in
# degrees, minutes and seconds. You should use a degree symbol (°) to represent
# degrees, a single quote (') to represent minutes, and a double quote (") to
# represent seconds. A degree has 60 minutes, while a minute has 60 seconds.
# E:
# dms(30) == %(30°00'00")
# dms(76.73) == %(76°43'48")
# dms(254.6) == %(254°36'00")
# dms(93.034773) == %(93°02'05")
# dms(0) == %(0°00'00")
# dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
# D: Input integer, outpud results
# A:
# Create a method dms that takes one argument integer
# Set minutes equal to integer minus integer.floor times 60
# Set seconds equal to minutes minus minutes.floor times 60
# if minutes.digits length is greater than 0 set minutes equal to
# minutes with a zero added in front as a string
# if seconds.digits length is greather than 0 set seconds equal to
# minutes with a zero added in front as a string
# return the string integer with degree symbol minutes with the minutes symbol
# and seconds with the seconds symbol in round thing with percent symbol
DEGREE = "\xC2\xB0"

def dms(integer)
  minutes = (integer - integer.floor) * 60
  seconds = (minutes - minutes.floor) * 60
  minutes, seconds = (minutes + 1), 0 if seconds.round == 60
  format(%(#{integer.floor}#{DEGREE}%02d'%02d"), minutes, seconds)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# Problem 2:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that takes an array of strings, and returns an array of the
# same string values, except with the vowels (a, e, i, o, u) removed.
# E:
# remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
# D:
# Input array, output array
# A:
# Create a method remove_vowels that takes one argument array
# Set new_array equal to an empty array
# Set vowels equal to all vowels
# Call map method on array
# set word equal to word.chars
# Call map! on word
# remove the current iteration if it is included in vowels
# join the word together without spaces
def remove_vowels(array)
  vowels = "aeiouAEIOU"
  array.map { |word| word.chars.delete_if {|c| vowels.include?(c)}.join('')}
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
