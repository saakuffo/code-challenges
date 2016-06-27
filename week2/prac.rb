puts "\n\nRuby program that uses flatten method"

gems = [["ruby", 10], ["sapphire", 20]]
p gems

# Call flatten to change a 2D array into one dimension
gems.flatten!
p gems

puts "\n\nRuby program that uses each_index"

# This is an irregular 2D array (a jagged array).
values = [["A", "B", "C"],["D","E","F"],["G", "H"]]

# Loop over indexes.
values.each_index do |i|

  # Get subarray and loop over its indexes also
  subarray = values[i]
  subarray.each_index do |x|
    # Display the cell
    puts String(i) << " " << String(x) << "... " << values[i][x]
  end

end

puts "\n\nRuby program that uses 2D array"
# This 2D array contains two sub-arrays
values = Array[[10, 20, 30], [40, 50, 60]]

# Loop over each row array
values.each do |x|

  # Loop over each cell in the row
  x.each do |cell|
    puts cell
  end

  # End of row.
  puts "--"
end

puts "\n\nRuby program that uses 2D array, push"

values = []

# Create first row
subarray = []
subarray.push(1)
subarray.push(2)
subarray.push(3)

# Add first row
values.push(subarray)

# Create second row
subarray = []
subarray.push(10)
subarray.push(20)
subarray.push(30)

# Add second row
values.push(subarray)

# Load an element
puts "Third element in first row is: " << String(values[0][2])

# Change this element
values[1][1] = 500

# Display all elements
values.each do |x|
  x.each do |y|
    puts y
  end
  puts "--"
end

life = [1, 2, 3, 4]
life2 = life.clone
life2[1] = "BABIES"

print life
puts ''
print life2
puts ''
life = []
print life
puts ''
print life2
puts ''

