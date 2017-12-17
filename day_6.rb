class Day6
  attr_accessor :banks, :configs, :steps

  def initialize(input)
    @banks = input.split(" ").map(&:to_i)
    @configs = [banks.join]
    @steps = 0
  end

  def redistribute
    val = banks.max
    index = banks.index(val)
    banks[index] = 0

    while val > 0
      index += 1
      index = 0 if index >= banks.length
      banks[index] += 1
      val -= 1
    end
  end

  def cycles
    steps - configs.index(banks.join)
  end

  def run
    loop do
      @steps += 1
      redistribute
      return steps if configs.include? banks.join
      configs.push banks.join
    end
  end
end

m = Day6.new(ARGV[0])
m.run
puts "Number of cycles before loop: #{m.steps}"
puts "Cycles in the infinite loop: #{m.cycles}"
