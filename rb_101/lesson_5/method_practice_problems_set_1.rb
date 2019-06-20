# Question 1:
# ===========
arr = ['10', '11', '9', '7', '8']
p arr.sort {|f,s| s.to_i <=> f.to_i}

# Question 2:
# ===========
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

p books.sort_by {|book| book[:published]}

# Question 3:
# ===========
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
p arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
p arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
p arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
p hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
p hsh2[:third].key(0)

# Question 4:
# ===========
arr1 = [1, [2, 3], 4]
p arr1[1][1] = 4


arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
p arr2[2] = 4


hsh1 = {first: [1, 2, [3]]}
p hsh1[:first][2] = 4


hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
p hsh2[['a']][:a][2] = 4

# Question 5:
# ===========
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
male_ages = 0

munsters.values.each do |details|
  male_ages += details["age"] if details["gender"] == "male"
end

p male_ages

# Question 6:
# ===========
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name,details|
  age = details["age"]
  gender = details["gender"]

  puts "#{name} is a #{age}-year-old #{gender}"
end

# Question 7:
# ===========
# => 2
# => [3, 8]

# Question 8:
# ===========
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.values.each do |array|
  array.each do |word|
    letters = word.chars
    puts letters.keep_if {|letter| "aeiou".include?(letter)}
  end
end

# Question 9:
# ===========
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

p arr.map {|array| array.sort {|first, second| second <=> first}}

# Question 10:
# ===========
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr.map do |hash|
  modified_hash = {}

  hash.each do |k,v|
    modified_hash[k] = v + 1
  end

  modified_hash
end

# Question 11:
# ===========
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
new_array = arr.select do |array|
  array.keep_if {|v| v % 3 == 0}
end

p new_array

# Question 12:
# ===========
def to_hash(array)
  new_hash = {}

  array.each do |sub_array|
    key = sub_array[0]
    value = sub_array[1]

    new_hash[key] = value
  end

  new_hash
end

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
p to_hash(arr)

# Question 13:
# ===========
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end

# Question 14:
# ===========
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

new_array = hsh.map do |k, details|
  type = details[:type]

  case type
  when 'fruit'
    details[:colors].map {|v| v.capitalize}
  when 'vegetable'
    details[:size].upcase
  end

end

# Question 15:
# ===========
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
arr.select do |hsh|
  hsh.all? do |_, value|
    value.all? do |num|
      num.even?
    end
  end
end

# Question 16:
# ===========
def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end
