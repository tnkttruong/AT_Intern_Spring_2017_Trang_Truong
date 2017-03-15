require 'pry'

class Check_perfect_number

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
    return number.match /^[0-9]+$/ ? true : false
  end

  def check_perfect(number)
    sum = 0
    for i in (1..number/2)
      sum+=i if number%i == 0
    end
    return sum == number ? true : false
  end
end

check = Check_perfect_number.new
number = check.input_number
result = check.check_perfect(number)
puts "prime_number?(#{number}) --> #{result}"
