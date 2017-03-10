class AddNumber  

  def input_number(index)
    puts "Input number #{index}"
    number = gets.chomp
    while !checkInteger(number) do
      puts "Please input a Integer"
      number = gets.chomp
    end
    return number.to_i
  end

  def add_two_numbers(number1,number2)
    return number1 + number2
  end
  def checkInteger(number)
    if number.match /^[0-9]+$/
      return true
    else false
    end
  end
end

add_number = AddNumber.new()
number1 = add_number.input_number(1)
number2 = add_number.input_number(2)
result = add_number.add_two_numbers(number1, number2)
puts "add(#{number1}, #{number2}) = #{result}."

