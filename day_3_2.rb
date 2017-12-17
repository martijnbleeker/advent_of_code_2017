class SpiralNode
  attr_reader :index, :num, :x, :y, :dir

  def initialize(index, num, x, y, dir)
    @index = index
    @num = num
    @x = x
    @y = y
    @dir = dir
  end

  def to_s
    "SpiralNode:\n  num: #{num}\n  dir: #{dir}\n  x: #{x}\n  y: #{y}\n  Steps to origin: #{x.abs + y.abs}"
  end
end

class Spiral
  attr_reader :list, :max_x, :min_x, :max_y, :min_y

  def initialize(num)
    @list = [SpiralNode.new(1, 1, 0, 0, :r)]
    @max_x = 0
    @min_x = 0
    @max_y = 0
    @min_y = 0

    while last_node.num < num
      next_node
    end
  end

  def last_node
    list.last
  end

  def new_num(x, y)
    @list.select do |node|
      node.x >= x - 1 && node.x <= x + 1 && node.y >= y - 1 && node.y <= y + 1
    end.map(&:num).sum
  end

  def next_node
    index = last_node.index + 1
    x = last_node.x
    y = last_node.y
    dir = last_node.dir

    case dir
    when :r
      x += 1

      if x > max_x
        dir = :u
        @max_x = x
      end
    when :u
      y += 1

      if y > max_y
        dir = :l
        @max_y = y
      end
    when :l
      x -= 1

      if x < min_x
        dir = :d
        @min_x = x
      end
    when :d
      y -= 1

      if y < min_y
        dir = :r
        @min_y = y
      end
    else
      raise "Cannot compute!"
    end

    num = new_num(x, y)
    @list.push SpiralNode.new(index, num, x, y, dir)
  end
end

puts Spiral.new(ARGV[0].to_i).last_node.to_s

