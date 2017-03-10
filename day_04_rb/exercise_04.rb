class Century  

	def input_number
		puts "Input the year"
		@year = gets.chomp.to_i

	end

	def return_century
		input_number
		if  @year%100 > 0
			centuryFromYear = @year/100 + 1
		else
			centuryFromYear = @year/100
		end
		puts "centuryFromYear(#{@year}) = #{centuryFromYear}."
	end
end

century = Century.new()
century.return_century()

