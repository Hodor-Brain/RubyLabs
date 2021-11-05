$N = 50
$c = 5
$PI = 3.141

#Variant 8

def func_y(x)
  numerator = (2 * (1 + (1.0 / x) * ((1.0 / x - x ** (1.0 / 2)) ** (1.0 / 2)) ** 2) ** (1.0 / 2))
  denominator = ((1 + 1.0 / $N * (1.0 / x - x ** (1.0 / 2)) ** (1.0 / 2)) ** (1.0 / 2) - 1.0 / 2 * (1.0 / x - $N ** (1.0 / 2)) ** (1.0 / 2))
  numerator / denominator
end

def func_z(x)
  numerator = ((Math.sin(x) ** 2 + Math.tan(x) ** 2) ** $c + 1) * (Math.cos(x) ** 2 - (1.0 / Math.tan(x)) ** 2 + 1)
  denominator = ((Math.cos(x) ** 2 + (1.0 / Math.tan(x)) ** 2 + 1) * (Math.sin(x) ** 2 + Math.tan(x) ** 2 - 1))
  numerator / denominator
end

def first_task
  step = ($N - 1).to_f / ($N + $c)
  arguments_array = (1..$N).step(step).to_a
  arguments_array.each { |argument| printf("x = #{'%.2f' % argument}, y = #{func_y(argument)}\n") }
end

def second_task
  step = ($PI - $PI / $N).to_f / (3.0 * $N / 2 + $c)
  arguments_array = ($PI / $N..$PI).step(step).to_a
  arguments_array.each { |argument| printf("x = #{'%.2f' % argument}, z = #{'%.2f' % func_z(argument)}\n") }
end

def third_task
  step = ($c - 2).to_f / (2 * $N)
  arguments_array = (2..$c).step(step).to_a
  arguments_array.each do |argument|
    output = "x = #{'%.2f' % argument}, "
    case argument
    when 3...$N
      output += "f = #{func_y(argument)}\n"
    when ($N + 1)...($N * 2)
      output += "f = #{'%.2f' % func_z(argument)}\n"
    else
      output += "f = #{func_y(argument) + func_z(argument)}\n"
    end
    print(output)
  end
end

print("First task result:\n")
first_task
print("\nSecond task result:\n")
second_task
print("\nThird task result:\n")
third_task
