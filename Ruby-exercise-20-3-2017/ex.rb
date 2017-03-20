require "pry"

class Ex1

  def input_password
    puts "please enter password"
    begin
      password = gets.chomp
      raise "Password must At least six characters long, contains a lowercase letter, an uppercase letter, a number" if !check_pass(password)
      rescue => e
        puts e
      retry
    end
    puts "Enter a successful password"
  end

  def check_pass(pass)
    return (pass.match /(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z\_]{6,}/ ) ? true : false
  end
end

ex1 = Ex1.new
ex1.input_password

