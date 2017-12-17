class Day5
  attr_reader :list, :pointer, :step

  def initialize(input)
    @pointer = 0
    @step = 0
    read_list input
  end

  def run
    loop do
      return step if pointer < 0 || pointer >= list.length
      increment = list[pointer]
      list[pointer] += 1
      @pointer += increment
      @step += 1
    end
  end

  def read_list(input)
    @list = input.split("\n").map(&:to_i)
  end
end

m = Day5.new(ARGV[0])
puts "Number of steps: #{m.run}"
