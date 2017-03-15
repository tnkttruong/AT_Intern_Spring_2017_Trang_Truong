require 'pry'

class Fibonacci

  def input_number
    puts "Input an integer number"
    number = gets.chomp
    while !checkInteger(number) do
      puts "Please input an Integer number greater than 0"
      number = gets.chomp
    end
    return number.to_i
  end

  def checkInteger(number)
    return ((number.match /^[0-9]+$/) && number.to_i > 0) ? true : false
  end

  def print_fibonacci(n)
    if n<2
      print "1"
    else
      print "1 "
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

  def print_fibonacci_recursion(n)
    if n < 2
      print "1"
    else
      print "1 "
      i=1
      while rt_fi(i) < n do
        print "#{rt_fi(i)} "
        i+=1
      end
    end
  end

  def rt_fi(s)
    if(s==0||s==1)
     return 1;
   else
    return (rt_fi(s-2)+rt_fi(s-1));
  end
end
end

fi = Fibonacci.new
n = fi.input_number
fi.print_fibonacci(n)


