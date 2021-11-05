#1 + x/1! + x^2/2! + x^3/3! + ... + x^n/n!

def third(n, x)
  if n < 1 || n > 10
    return -1
  end
  result = 1
  for i in 1..n
    result += (x ** n) / (1..(n.zero? ? 1 : n)).inject(:*)
  end
  result
end

printf("Enter n:")
n = gets.chomp.to_s.to_i
printf("Enter x:")
x = gets.chomp.to_s.to_f

printf("Third task result: #{third(n, x)}\n")


#sqrt(2 + sqrt(2 + sqrt(2 + ...)))
n = 5
i = 1
def fifth(n, i)
  if i == n
    Math.sqrt(2)
  else
    Math.sqrt(2 + fifth(n, i + 1))
  end
end

printf("\nFifth task result with n = #{n}: #{fifth(n, i)}")
