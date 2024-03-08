require_relative "calculator"
puts "Enter the string"
str = eval('"' + gets.chomp + '"')
puts Calculator.new.add(str)
