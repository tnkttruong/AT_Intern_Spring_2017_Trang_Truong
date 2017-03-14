require 'pry'

class Fibonacci

  def input_number
    puts "Input an integer number"
    number = gets.chomp
    while !checkInteger(number) do
      puts "Please input an Integer number"
      number = gets.chomp
    end
    return number.to_i
  end

  def checkInteger(number)
    if number.match /^[0-9]+$/
      return true
    else false
    end
  end

  def print_fibonacci(n)
    if n<2
      print "0 1 "
    else
      print "0 1 "
      n1=0
      n2=1
      n3=0
      while true do 
        n3=n1+n2;
        break if n3>=n  
        print "#{n3} "
        n1=n2  
        n2=n3
      end
    end
  end
end

fi = Fibonacci.new
fi.print_fibonacci(fi.input_number)
