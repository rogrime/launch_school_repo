=begin
START
SET stringy = a list of strings
SET combined_strings = nothing

iterate over strings and ADD to combined_strings each iteration

PRINT combined_strings
END
=end
stringy = ["blaa","yass","nahh","fun"]

def combine(strings)
  combined_strings = ""
  strings.each do |s|
    combined_strings += s + " "
  end
  return combined_strings
end

combined_strings = combine(stringy)
puts combined_strings
