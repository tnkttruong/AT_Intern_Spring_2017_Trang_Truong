class Century  

	def input_number
		puts "Input the year"
		year = gets.chomp
		while !checkInteger(year) do
			puts "Please input a Year"
			year = gets.chomp
		end
		return year.to_i
	end

	def return_century(year)
		if year == 0 
			return 1
		elsif  year%100 > 0
			return year/100 + 1
		else
			return year/100
		end
	end

	def checkInteger(number)
		if number.match /^[0-9]+$/
			return true
		else false
		end
	end
end

century = Century.new()
year = century.input_number()
centuryFromYear=century.return_century(year)
puts "centuryFromYear(#{year}) = #{centuryFromYear}."
