Point = Struct.new(:x, :y)

$points_array = Array.new

$points_array.push((Point.new 150, 49),
                   (Point.new 221, 78),
                   (Point.new 219, 121),
                   (Point.new 208, 158),
                   (Point.new 167, 182),
                   (Point.new 108, 192),
                   (Point.new 72, 171),
                   (Point.new 59, 133),
                   (Point.new 76, 115),
                   (Point.new 91, 97),
                   (Point.new 75, 78),
                   (Point.new 67, 58),
                   (Point.new 79, 47),
                   (Point.new 98, 30),
                   (Point.new 118, 22),
                   (Point.new 136, 30),
                   (Point.new 143, 37))

def square(array)
  result = 0
  for i in 0...array.length do
    unless i == array.length-1
      result += (array[i].x + array[i + 1].x) * (array[i].y - array[i + 1].y)
    else
      result += (array[i].x + array[0].x) * (array[i].y - array[0].y)
    end
  end

  0.5 * (result).abs
end

puts "Square is: #{square($points_array)}"
