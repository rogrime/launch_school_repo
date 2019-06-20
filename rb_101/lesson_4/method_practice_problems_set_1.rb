# Question 1:
# The return value will be [1,2,3] because it returns 'hi'
# 'hi' is not nil or false, so it is truthy. Select selects all the elenents
# returns true from the block and puts them in an array. Thus [1,2,3] is return

# Question 2:
# Count counts the number of elements in an array. When given an argument it
# counts how many elements equal the argument given. When given a block like
# in the example, it counts how many elements in the array evaluate to true
# when put through that block. In the case of the example it will return 2.

# Question 3:
# The return value will be [1,2,3]. This is because reject returns a new array
# containing all the elements that evaluated to not true when ran through the block

# Question 4:
# It returns an updated version of the object that was called in the argument.
# It is updated or not updated through each iteration depending on what you do.

# Question 5:
# It permantly mutates the hash by removing the first key/value pair in the Hash
# it returns the key/value pair it removed in the form of an array.
# You can find out by looking at the Hash page on ruby documentation then
# looking at "shift". You could also test in IRB.

# Question 6:
# Pop removes the last item in the array and returns the value it removed.
# Size when called on a string counts the numbers of letters in the string.
# Thus the return value of the practice problem is: 11

# Question 7:
# The return value of the block in the code is true or false depending on whether
# The number given is odd or not. The return value of any? in the example is
# true because any? will return true if any of the iterations evaluate to true.
# The code will output "1" because the block puts each iteration in array until
# a true value is found.

# Question 8:
# take returns the first (n) amount of elements in the array depending on what
# is specified within the argument. It is not destructive. We can found out by
# looking at the ruby documentation for array and then looking at "take".

# Question 9:
# The return value is [nil, 'bear']. This is because map returns a new Array
# based on the return value of each iteration.

# Question 10
# The return value will be [1,nil,nil]. The first iteration 1 > 1 evaluates to
# false thus the condition moves to else which returns the number 1. Then every
# other iteration returns nil because puts is always nil. 
