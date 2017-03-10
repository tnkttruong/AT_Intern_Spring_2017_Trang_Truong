class Century  

  def input_number
    puts "Input the year"
    @year = gets.chomp.to_i
  end

  def return_century
  	input_number
    puts "centuryFromYear(#{@year}) = #{@year/100}."
  end
end

century = Century.new()
century.return_century()
