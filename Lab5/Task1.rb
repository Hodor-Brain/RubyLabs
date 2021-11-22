#Variant 8

def prm(a, b, n, h = 1.0 * (b - a) / n)
  sum = 0.0
  x = a + h - h / 2
  loop do
    y = yield(x)
    sum += h * y
    x += h
    break if x > b
  end
  sum
end

def trp(a, b, function, n)
  h = 1.0 * (b - a) / n

  current_argument = a + h
  sum = method(function).call(a) / 2 + method(function).call(b) / 2

  while current_argument <= b - h do
    sum += method(function).call(current_argument)
    current_argument += h
  end

  h * sum
end

def f1(x)
  (x ** 2 - 1) * 10 ** (-2 * x)
end

def f2(x)
  x * Math.atan(x)
end

a = 0.0
b = 0.4
$n = 1e+5

printf("First function integration using rectangles:\na = #{a} b = #{b}\nIntegrate(f1) = #{prm(a, b, $n){|x| f1(x)}}\n\n")

a = 0.0
b = 1.7

printf("Second function integration using trapezium:\na = #{a} b = #{b}\nIntegrate(f1) = #{trp(a, b, :f2, $n)}\n")
