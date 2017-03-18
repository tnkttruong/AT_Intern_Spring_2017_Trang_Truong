require 'mysql2'
require "pry"
require 'benchmark'

class Football_management
  @@client

  def connect
    begin
      @@client = Mysql2::Client.new(:host => 'localhost', :database => 'football', :username => "root", :password => "858140858140")
    rescue Mysql2::Error => e
      puts e.errno
      puts e.error 
    ensure
      @@client.close if @client
    end
  end

  def get_num_of_team
    return @@client.query("SELECT count(teams_id) FROM football_teams").to_a[0].values[0]
  end

  def get_num_of_seed_team
    return @@client.query("SELECT count(teams_id) FROM football_teams where is_seed = 1").to_a[0].values[0]
  end

  def check_full_teams
   num_of_team = get_num_of_team
   if num_of_team < 16
    puts "Missing #{16-num_of_team} team to enough all teams please input the remaining teams"
    main
  end
end

def print_menu
  puts "===WELLCOME TO FOOTBALL CHAMPION MANAGEMENT SYSTEM==="
  puts "1. Add teams"
  puts "2. Choose seed teams"
  puts "3. Create groups"
  puts "4. Create schedule"
  puts "5. Input score"
  puts "5. Display teams OF Semi final round"
  puts "0. Exit"
  puts "======================================================"
  print "Please enter your choice: "
end

def display_teams
  results = @@client.query("SELECT * FROM football_teams")
  puts "----------------------------------------------------"
  print "|teams_id".ljust(7), "|", "       name".ljust(20),"|", "is seed".ljust(7),"|",
  "groups".ljust(4), "|","points".ljust(5), "|" "\n"
  puts "----------------------------------------------------"
  results.to_a.map{|team|
   print "|   ", team["teams_id"].to_s.ljust(5), "|  ", team["name"].ljust(18),"|   ", 
   team["is_seed"].to_s.ljust(4),"|  ", team["groups"].ljust(3), "|  ",team["points"].to_s.ljust(4), "|" "\n"
   puts "----------------------------------------------------"
 }
end

def check_number(number,num_current)
  return ((number.match /^[0-9]+$/) && number.to_i > 0 && number.to_i <= 16 - num_current) ? true : false
end
def check_time(input,type)
  case type
  when "day"
    return ((input.match /^[0-9]+$/) && (input.to_i > 0 && input.to_i < 32)) ? true : false
  when "month"
    return ((input.match /^[0-9]+$/) && (input.to_i > 0 && input.to_i < 13)) ? true : false
  when "hour"
    return ((input.match /^[0-9]+$/) && (input.to_i >= 0 && input.to_i < 25)) ? true : false
  when "minute"
    return ((input.match /^[0-9]+$/) && (input.to_i >= 0 && input.to_i < 60)) ? true : false
  else
    return false
  end
end
def check_exist_teams_(condition)
  if condition.is_a?(Integer)
    return @@client.query("select count(teams_id) from football_teams where teams_id = '#{condition}';").to_a[0].values[0] > 0 ? true : false
  else
    return @@client.query("select count(teams_id) from football_teams where name = '#{condition}';").to_a[0].values[0] > 0 ? false : true
  end
end

def check_match(match_id)
  @@client.query("select count(matchs_id) from matchs where matchs_id = '#{match_id}';").to_a[0].values[0] > 0 ? true : false
end

def get_team_by_id(id_team)
  return teams = @@client.query("select * from football_teams where teams_id = '#{id_team}'").to_a[0]
end

def input_time(type)
  result = ""
  puts "input #{type}"
  result = gets.chomp
  until check_time(result,type) do
    print "Input is incorrect format please input again: "
    result = gets.chomp
  end
  return result.to_i
end

def main
  print_menu
  check = true
  while check do
    choice = gets.chomp
    case choice
    when "0"
      puts "THANK YOU! SEE YOU AGAIN!"
      exit
    when "1"
      add_teams
    when "2"
      choose_seed_team
    when "3"
      creat_groups
    when "4"
      input_schedule
    when "5"
    else
      print "Please input choice is an integer from 0 to 5: "
      check == false
    end
  end
end

def add_teams
  system "clear"
  num_current = get_num_of_team
  if num_current >= 16
    puts "number of team is max please choice another operation"
    main
  else
    num_of_team = ""
    while !check_number(num_of_team, num_current) do
      print "Please enter number of teams you want to input( <= #{16-num_current}): "
      num_of_team = gets.chomp
    end
    (1..num_of_team.to_i).map{ |i|
      puts "Enter name of team #{i}"
      name_of_team = gets.chomp
      while !check_exist_team(name_of_team) do
        puts "This name already exists please choose another name"
        name_of_team = gets.chomp
      end
      @@client.query("insert into football_teams (name) values ('#{name_of_team}');")
    }
    puts "You have just successfully added #{num_of_team} team"
    main
  end
end

def choose_seed_team
  system "clear"
  continue = "y"
  while continue == "y"
    check_full_teams
    if get_num_of_seed_team >= 12
      puts "The seed teams are full please choice another operation"
      main
    else
      display_teams
      puts "Please choose id of team you want to set to seed"
      choice = gets.chomp
      while !check_exist_team(choice.to_i) do
        puts "the id is incorrect please choose again"
        choice = gets.chomp
      end
      @@client.query("UPDATE football_teams SET is_seed = 1 WHERE teams_id = #{choice}")
      puts "You have just successfully set a team has id = #{choice} to seed team"
      puts "Do you want to continue(y: to continue/ other: to exit)"
      continue = gets.chomp.downcase
    end
  end
  system "clear"
  main
end

def creat_groups
  check_full_teams
  num_of_seed_teams = get_num_of_seed_team
  if num_of_seed_teams < 4
    system "clear"
    puts "Missing #{4-num_of_seed_teams} seed team please add then creat group"
    main
  else
    results = @@client.query("SELECT * FROM football_teams")
    arr_teams = results.to_a
    groups = []
    ("A".."D").map { |i|
      arr_teams.detect{ |team|
        team["is_seed"] == 1
        @@client.query("UPDATE football_teams set groups = '#{i}' where teams_id = #{team['teams_id']}")
        groups.push team
        arr_teams.delete(team)
      }
      arr_teams.detect{ |team|
        team["is_seed"] == 0
        @@client.query("UPDATE football_teams set groups = '#{i}' where teams_id = #{team['teams_id']}")
        groups.push team
        arr_teams.delete(team)
      }
      (1..2).map{|j|
        rd = Random.new.rand(0..(arr_teams.size-1))
        groups.push arr_teams[rd]
        @@client.query("UPDATE football_teams set groups = '#{i}' where teams_id = #{arr_teams[rd]['teams_id']}")
        arr_teams.delete_at(rd)
      }
    }

    ("A".."D").map{|i|
      teams = groups.select{|team|
        team["groups"] == i
      }
      for x in 0..2
        for y in (x+1..3)
         @@client.query("INSERT INTO matchs (teams_A_id,teams_B_id) VALUES (#{teams[x]['teams_id']}, #{teams[y]['teams_id']})")
       end
     end
   }
   system "clear"
   puts "Create groups successfully"
   main
 end
end

def input_schedule
  system "clear"
  continue = "y"
  while continue.downcase == "y" do 
    results = @@client.query("SELECT * FROM matchs")
    puts "---------------------------------------------------------------------------------------"
    puts "|                                 SCHEDULE                                            |"
    puts "---------------------------------------------------------------------------------------"
    puts "|id_matchs|       Time        |         Team A     -         Team B          | Group  |"
    puts "---------------------------------------------------------------------------------------"
    results.to_a.map{|matchs|
      teamA = get_team_by_id(matchs["teams_A_id"])
      teamB = get_team_by_id(matchs["teams_B_id"])
      print "|   ", matchs["matchs_id"].to_s.ljust(6),"| ", matchs["time"].ljust(18), "|  ", teamA["name"].ljust(18),
      matchs["score"].ljust(8), teamB["name"].ljust(18), "|  ", teamA["groups"].ljust(6), "|\n"
      puts "---------------------------------------------------------------------------------------" 
    }
    puts "Input match's id you want to set time"
    match_id = gets.chomp
    while !check_match(match_id) do
      puts "id is incorrect please input again!"
      match_id = gets.chomp
    end
    matchs = @@client.query("select * from matchs where matchs_id = '#{match_id}'")
    day = input_time("day")
    month = input_time("month")
    hour = input_time("hour")
    minute = input_time("minute")
    time = Time.new(2017,month,day, hour,minute,0).strftime("%H:%M - %d/%m/%Y")
    @@client.query("update matchs set time = '#{time}' where matchs_id = '#{match_id}'")
    puts "You have just successfully set a time a match"
    puts "Do you want to continue(y: to continue/ other: to exit)"
    continue = gets.chomp
  end
end
end

ex1 = Football_management.new
ex1.connect
#puts ex1.get_team_by_id(15)
ex1.main