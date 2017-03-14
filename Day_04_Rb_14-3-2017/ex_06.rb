require 'pry'

class Check_prime_number

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

  def check_prime(number)
    for i in (2..number-1)
      return false if number%i == 0
    end
    return true
  end
end

check = Check_prime_number.new
number = check.input_number
result = check.check_prime(number)
puts "prime_number?(#{number}) --> #{result}"