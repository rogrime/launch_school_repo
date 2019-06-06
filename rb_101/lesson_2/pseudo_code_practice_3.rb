=begin
START
SET arr = an array of integers

iterate over arr and take every other element and put it into an array
SET new_arr = iteration

PRINT new_arr
=end
arr = [2,8,6,4,2,3,1,1]

def every_other(array)
  counter = 0
  array.select do |v|
    counter += 1
    v if counter.odd?
  end
end

arr_new = every_other(arr)
print arr_new
