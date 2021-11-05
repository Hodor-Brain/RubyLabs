
$EPS = 1e-5

def factorial(n)
  (1..(n.zero? ? 1 : n)).inject(:*).to_f
end

#Variant 8

def first_series
  n = 2
  result = ((factorial(n - 1) / factorial(n + 1)) ** (n * (n + 1)))
  begin
    n += 1
    previous = result
    result += ((factorial(n - 1) / factorial(n + 1)) ** (n * (n + 1)))
  end while result - previous >= $EPS
  result
end

def second_series(x)
  n = 0
  result = x ** n / factorial(n)
  begin
    n += 1
    previous = result
    result += x ** n / factorial(n)
  end while result - previous >= $EPS
  result
end

def third_series
  n = 1
  result = (factorial(4*n-1)*factorial(2*n-1))/(factorial(3*n)*(3**(2*n))*factorial(n))
  begin
    n+=1
    previous = result
    result += (factorial(4*n-1)*factorial(2*n-1))/(factorial(3*n)*(3**(2*n))*factorial(n))
  end while result - previous >= $EPS
  result
end

printf("First series: #{first_series}\n")

$X = 5
printf("\nSecond series (e^#{$X}): #{second_series($X)}\nWhile Math.exp(#{$X}) returns #{Math.exp($X)}\n")

printf("\nThird series: #{third_series}\n")