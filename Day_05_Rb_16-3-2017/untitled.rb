  no = 1
      puts "Input name of team#{no} to team5"
      name_of_team = gets.chomp
      client.query("insert into football_teams (name) values ('trang');")
      results = client.query("SELECT * FROM football_names")
      client.query("DELETE FROM football_names")
      results.each do |a| 
        puts a.inspect
      end
      @@client.query("insert into football_teams (name) values ('#{name_of_team}');")