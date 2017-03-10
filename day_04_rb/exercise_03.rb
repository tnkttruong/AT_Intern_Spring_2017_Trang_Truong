class Add_numbers  

  def input_number
    puts "Input number1"
    @number1 = gets.chomp.to_i
    puts "Input number2"
    @number2 = gets.chomp.to_i
  end

  def add_two_numbers
    input_number
    puts "add(#{@number1}, #{@number2}) = #{(@number1+@number2)}."
  end
end

add_number = Add_numbers.new()
add_number.add_two_numbers()
