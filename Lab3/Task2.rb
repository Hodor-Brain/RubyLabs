def if_statement(x)
  if x >= -4 && x <= 0
    ((x - 2).abs / (x ** 2 * Math.cos(x)))**(1.0 / 7)
  elsif x > 0 && x <= 12
    1 / (Math.tan(x + 1 / Math.exp(x)) / (Math.sin(x) ** 2)) ** (2.0/7)
  elsif x < -4 || x > 12
    1 / (1 + (x / (1 + (x / (1 + x)))))
  end
end

def case_statement(x)
  case x
  when -4..0
    ((x - 2).abs / (x ** 2 * Math.cos(x)))**(1.0 / 7)
  when 1..12
    1 / (Math.tan(x + 1 / Math.exp(x)) / (Math.sin(x) ** 2)) ** (2.0/7)
  else
    1 / (1 + (x / (1 + (x / (1 + x)))))
  end
end

printf("Enter x:")
x = gets.chomp.to_s
printf("If statement with x = #{x}: #{if_statement(x.to_f)}\n")
printf("Case statement with x = #{x}: #{case_statement(x.to_f)}\n")
