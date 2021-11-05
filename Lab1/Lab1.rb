print "Enter x:"
x = gets.chomp.to_s.to_f

print "Enter gamma:"
gamma = gets.chomp.to_s.to_f

print "Enter b:"
b = gets.chomp.to_s.to_f

F = Math.acos(Math.sin(x/2)/(b-1)**(1/3))+Math.log(Math::E**gamma+4.1*10**2.1)/Math.tan(Math::PI/4+x/2)

printf "F = %f" % [F]
