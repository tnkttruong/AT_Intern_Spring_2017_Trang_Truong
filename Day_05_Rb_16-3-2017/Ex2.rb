require 'pry'

class Exercise1

  def input_number
    puts "Please the last number of series"
    number = gets.chomp
    while !checkInteger(number) do
      puts "Please input an Integer"
      number = gets.chomp
    end
    return number.to_i
  end

  def checkInteger(number)
    return (number.match /^[-+]{0,1}[0-9]+$/) ? true : false
  end

  def print_series(last_number)
    if last_number == 0
      puts "0=0"
    elsif last_number < 0
      puts "#{last_number}<0"
    else
      sum=0
      puts (0..last_number).map{ |i|
        print i == last_number ? "#{i} = " : "#{i}+"
        sum += i
        }[-1]
      end
    end
  end

  ex1 = Exercise1.new()
  ex1.print_series(ex1.input_number)