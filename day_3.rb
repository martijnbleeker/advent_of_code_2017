class SpiralNode
  attr_reader :num, :x, :y, :dir

  def initialize(num, x, y, dir)
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
  attr_reader :list

  def initialize(num)
    @list = [SpiralNode.new(1, 0, 0, :r)]
    while @list.last.num < num
      add_next_node
    end
  end

  def last_node
    @list.last
  end

  def add_next_node
    num = @list.last.num + 1
    x = @list.last.x
    y = @list.last.y
    dir = @list.last.dir

    case @list.last.dir
    when :r
      x += 1
      dir = :u if x > max_x
    when :u
      y += 1
      dir = :l if y > max_y
    when :l
      x -= 1
      dir = :d if x < min_x
    when :d
      y -= 1
      dir = :r if y < min_y
    else
      raise "Cannot compute!"
    end

    @list.push SpiralNode.new(num, x, y, dir)
  end

  def max_x
    max_min_prop(:x, :max)
  end

  def max_y
    max_min_prop(:y, :max)
  end

  def min_x
    max_min_prop(:x, :min)
  end

  def min_y
    max_min_prop(:y, :min)
  end

  private

  def max_min_prop(prop, method)
    @list.map(&prop).send(method)
  end
end

puts Spiral.new(ARGV[0].to_i).last_node.to_s

