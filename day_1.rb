def advent_of_code_1_2(input)
  sum = 0
  digits = input.chars

  digits.each_with_index do |digit, index|
    prev_digit = digits[index - 1]
    sum += digit.to_i if digit == prev_digit
  end

  sum
end

def advent_of_code_1_2(input)
  sum = 0
  digits = input.chars

  digits.each_with_index do |digit, index|
    prev_digit = digits[index - (digits.length / 2)]
    sum += digit.to_i if digit == prev_digit
  end

  sum
end

puts "Sum is: #{advent_of_code_1_1 ARGV[0]}"
puts "2nd sum is: #{advent_of_code_1_2 ARGV[0]}"
