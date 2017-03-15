require 'pry'
class Exercise
begin
  puts "choose"
  a = gets.chomp
  raise
rescue
  retry if (!"y".eql?(a ) && !"n".eql?(a))
  case a 
  when "y"
    puts "yes"
  when "n"
    puts "no"
   end 
  end