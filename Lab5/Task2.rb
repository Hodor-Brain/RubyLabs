#Variant 9

def series(x, n = Float::INFINITY, eps = 1e-4)
  summand = yield(x, 0)
  previous_summand = summand
  sum = summand

  (1..n).each do |i|
    summand = yield(x, i)
    sum += summand

    if n == Float::INFINITY && (summand - previous_summand).abs < eps
      break
    end

    previous_summand = summand
  end
  sum
end

def a_n(x, i)
  x ** (4 * i + 1) / (4 * i + 1)
end

arg = 0.5
n = 25
printf("Series evaluation with x = #{arg} and n = #{n}\n#{series(arg, n) { |x, i| a_n(x, i)} }\n")