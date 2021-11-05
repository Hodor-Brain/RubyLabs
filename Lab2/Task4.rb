$input = 123

def to_binary
  binary = []
  temp = $input
  while temp > 0
    binary << temp % 2
    temp /= 2
  end
  binary.reverse.join
end

puts "#{$input} in decimal is #{to_binary} in binary"
