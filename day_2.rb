def read_row(input)
  input.split(" ").map(&:to_i)
end

def diff_max_min(input)
  arr = read_row(input)
  arr.max - arr.min
end

def divider(input)
  arr = read_row(input)
  arr.sort! { |x, y| y <=> x }

  while arr.any?
    num = arr.shift
    arr.each do |num_2|
      return num / num_2 if num % num_2 == 0
    end
  end
end

def checksum(input, method)
  arr = input.split("\n").map { |str| send(method, str) }
  arr.sum
end

puts "Checksum 1 is: #{checksum ARGV[0], :diff_max_min}"
puts "Checksum 2 is: #{checksum ARGV[0], :divider}"
