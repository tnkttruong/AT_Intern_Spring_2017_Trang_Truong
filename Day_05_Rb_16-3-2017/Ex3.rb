require 'pry'

class Exercise2

  def input_number()
    number = gets.chomp
      while !checkInteger(number) do
        puts "Please input an Positive number"
        number = gets.chomp
      end
    return number.to_i
  end

  def checkInteger(number)
    return (number.match /^[0-9]+$/) ? true : false
  end

  def print_array_perfect_square(a, b)
    print "get_squares(#{a}..#{b}) # => "
    puts (a..b).select{|i|
     Math.sqrt(i) %1 == 0
     }.inspect
   end
 end

 ex2 = Exercise2.new
 puts "input first number"
 first_number = ex2.input_number()
 puts "input last number"
 last_number = ex2.input_number()
 ex2.print_array_perfect_square(first_number,last_number)