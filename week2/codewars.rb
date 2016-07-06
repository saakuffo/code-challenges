# # Define the unique method that removes duplicates
# def unique(integers)
#   integers.each_with_index do |el, ind|
#     count = 0
#     intLen = integers.length - 1
#     until count == intLen
#       puts "count is: #{count} !! the checked element is: #{integers[count]} !! el is #{el}!!"
#       if count != ind
#         if el == integers[count]
#           puts "The element is: #{el} the checked element is: #{integers[count]}"
#           integers.delete_at(count)
#           puts integers.inspect
#         end
#       else
#         puts "Skipped!"
#       end
#       count += 1
#     end
#   end
# end


# Define the unique method that removes duplicates
def unique(integers)

  if integers.empty?
    return integers
  end

  
  new_ints = []
  count = 0

  until integers.empty?
    if new_ints.include? integers[0]
      integers.shift
    else
      new_ints << integers.shift
    end
    count += 1
  end



  return new_ints
end

test = [1,3,2,5,1,2,3,1,4,5,2,5,8,4,65,3,5,1]
test2 = unique(test)
puts test2.inspect
