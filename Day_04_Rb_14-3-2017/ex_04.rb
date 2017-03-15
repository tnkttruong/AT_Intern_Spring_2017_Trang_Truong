require 'mysql2'

begin
  client = Mysql2::Client.new(:host => 'localhost', :database => 'football', :username => "root", :password => "858140858140")
  no = 1
  puts "Input name of team#{no} to team5"
  name_of_team = gets.chomp
  while no < 6 do  
   client.query("insert into football_names (name) values ('#{name_of_team}#{no}');")
   no+=1
 end
 puts "Input name of team#{no} to team10"
 name_of_team = gets.chomp
 for no in 6...11 do
   client.query("insert into football_names (name) values ('#{name_of_team}#{no}');")
 end
 puts "Input name of team#{no+1} to team15"
 name_of_team = gets.chomp
 until no>14
   client.query("insert into football_names (name) values ('#{name_of_team}#{no+1}');")
   no+=1  
 end
 results = client.query("SELECT * FROM football_names")
 results.each do |a| 
  puts a.inspect
end

rescue Mysql2::Error => e
  puts e.errno
  puts e.error 
ensure
  client.close if client
end