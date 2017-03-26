require_relative 'lib/mysql_adapter.rb'
require_relative 'service/football_service.rb'
require_relative 'menu_block.rb'
class Menu
	attr_accessor :sqladapter
	include FootballService
	include MenuBlock

	def initialize
		@sqladapter = FootballSQL.new
	end

	def show_menu(block=main_menu_block)
		excute_selection &block
	end

	def excute_selection(&block)
		begin
			print_menu
			while true
				choice = gets.chomp
				yield choice
			end
		rescue => e
			puts e.message
			retry
		end
	end

	def print_menu
		puts "===WELLCOME TO FOOTBALL CHAMPION MANAGEMENT SYSTEM==="
		puts "1. Add teams"
		puts "2. Choose seed teams"
		puts "3. Create groups"
		puts "4. Create schedule"
		puts "5. Input score"
		puts "6. Display teams OF Semi final round"
		puts "7. Show list teams"
		puts "0. Exit"
		puts "======================================================"
		print "Please enter your choice: "
	end

	def display_teams
		results = @sqladapter.client.query("SELECT * FROM football_teams order by groups asc")
		puts "--------------------------------------------------------------------"
		print "|teams_id".ljust(7), "|", "       name".ljust(20),"|", "is seed".ljust(7),"|",
		"groups".ljust(4),"| GF | GA | GD |","points".ljust(5), "|" "\n"
		puts "--------------------------------------------------------------------"
		results.to_a.map{|team|
			print "|   ", team["teams_id"].to_s.ljust(5), "|  ", team["name"].ljust(18),"|   ", 
			team["is_seed"].to_s.ljust(4),"|  ", team["groups"].ljust(4),"| ", team["GF"].to_s.ljust(3), "| ",
			team["GA"].to_s.ljust(3),"| ", team["GA"].to_s.ljust(3),"|  ",team["points"].to_s.ljust(4), "|" "\n"
			puts "--------------------------------------------------------------------"
		}
	end
	def display_matchs
		system "clear"
		results = @sqladapter.client.query("SELECT * FROM matchs")
		puts "-------------------------------------------------------------------------------------"
		puts "|                                 SCHEDULE                                           |"
		puts "-------------------------------------------------------------------------------------"
		puts "|id_matchs|       Time        |         Team A     -            Team B      | Group |"
		puts "-------------------------------------------------------------------------------------"
		results.to_a.map{|matchs|
			teamA = get_team_by_id(@sqladapter, matchs["teams_A_id"])
			teamB = get_team_by_id(@sqladapter, matchs["teams_B_id"])
			print "|   ", matchs["matchs_id"].to_s.ljust(6),"| ", matchs["time"].ljust(18), "|  ", teamA["name"].ljust(18),
			matchs["score"].ljust(6),"    ", teamB["name"].ljust(11), "    |  ", teamA["groups"].ljust(5), "|\n"
			puts "-------------------------------------------------------------------------------------"
		}
	end

	def add_teams
		system "clear"
		num_current = get_num_of_team @sqladapter
		if num_current >= 16
			puts "number of team is max please choice another operation"
			excute_selection &block=main_menu_block
		else
			num_of_team = ""
			while !check_number(num_of_team, num_current) do
				print "Please enter number of teams you want to input( <= #{16-num_current}): "
				num_of_team = gets.chomp
			end
			(1..num_of_team.to_i).map{ |i|
				puts "Enter name of team #{i}"
				name_of_team = gets.chomp
				while !check_exist_team(@sqladapter, name_of_team) do
					puts "This name already exists please choose another name"
					name_of_team = gets.chomp
				end
				@sqladapter.client.query("insert into football_teams (name) values ('#{name_of_team}');")
			}
			puts "You have just successfully added #{num_of_team} team"
			excute_selection &block=main_menu_block
		end
	end

	def choose_seed_team
		system "clear"
		continue = "y"
		while continue == "y"
			excute_selection &block=main_menu_block if (check_full_teams @sqladapter) == false
			if (get_num_of_seed_team @sqladapter) >= 12
				puts "The seed teams are full please choice another operation"
				excute_selection &block=main_menu_block
			else
				display_teams
				puts "Please choose id of team you want to set to seed"
				choice = gets.chomp
				while !check_exist_team(@sqladapter, choice.to_i) do
					puts "the id is incorrect please choose again"
					choice = gets.chomp
				end
				@sqladapter.client.query("UPDATE football_teams SET is_seed = 1 WHERE teams_id = #{choice}")
				puts "You have just successfully set a team has id = #{choice} to seed team"
				puts "Do you want to continue(y: to continue/ other: to exit)"
				continue = gets.chomp.downcase
			end
		end
		system "clear"
		excute_selection &block=main_menu_block
	end

	def creat_groups
		check_full_teams
		num_of_seed_teams = get_num_of_seed_team @sqladapter
		if num_of_seed_teams < 4
			system "clear"
			puts "Missing #{4-num_of_seed_teams} seed team please add then creat group"
			excute_selection &block=main_menu_block
		else
			@sqladapter.client.query("delete from matchs")
			results = @sqladapter.client.query("SELECT * FROM football_teams")
			arr_teams = results.to_a
			("A".."D").map { |i|
				seed_team = arr_teams.detect{ |team|
					team["is_seed"] == 1
				}
				@sqladapter.client.query("UPDATE football_teams set groups = '#{i}' where teams_id = #{seed_team['teams_id']}")
				arr_teams.delete(seed_team)
				normal_team = arr_teams.detect{ |team|
					team["is_seed"] == 0
				}
				@sqladapter.client.query("UPDATE football_teams set groups = '#{i}' where teams_id = #{normal_team['teams_id']}")
				arr_teams.delete(normal_team)
			}
			("A".."D").map{|i|
				(1..2).map{|j|
					rd = Random.new.rand(0..(arr_teams.size-1))
					@sqladapter.client.query("UPDATE football_teams set groups = '#{i}' where teams_id = #{arr_teams[rd]['teams_id']}")
					arr_teams.delete_at(rd)
				}
			}
			groups = @sqladapter.client.query("SELECT * FROM football_teams")
			("A".."D").map{|i|
				teams = groups.select{|team|
					team["groups"] == i
				}
				for x in 0..2
					for y in ((x+1)..3)
						@sqladapter.client.query("INSERT INTO matchs (teams_A_id,teams_B_id) VALUES (#{teams[x]['teams_id']}, #{teams[y]['teams_id']})")
					end
				end
			}
			system "clear"
			puts "Create groups successfully"
			excute_selection &block=main_menu_block
		end
	end

	def input_schedule
		system "clear"
		continue = "y"
		while continue.downcase == "y" do 
			display_matchs
			puts "Input match's id you want to set time"
			match_id = gets.chomp
			while !check_match(@sqladapter, match_id) do
				puts "id is incorrect please input again!"
				match_id = gets.chomp
			end
			matchs = @sqladapter.client.query("select * from matchs where matchs_id = '#{match_id}'")
			day = input_data("day")
			month = input_data("month")
			hour = input_data("hour")
			minute = input_data("minute")
			time = Time.new(2017,month,day, hour,minute,0).strftime("%H:%M - %d/%m/%Y")
			@sqladapter.client.query("update matchs set time = '#{time}' where matchs_id = '#{match_id}'")
			puts "You have just successfully set a time a match"
			puts "Do you want to continue(y: to continue/ other: to exit)"
			continue = gets.chomp
		end
		system "clear"
		excute_selection &block=main_menu_block
	end

	def input_score
		continue = "y"
		while continue.downcase == "y" do 
			display_matchs
			puts "Input match's id you want to input score"
			match_id = gets.chomp
			while !check_match(@sqladapter, match_id) do
				puts "id is incorrect please input again!"
				match_id = gets.chomp
			end
			matchs = get_match_by_id(@sqladapter, match_id)
			score_teamA = input_data("score_of_team_A")
			score_teamB = input_data("score_of_team_B")
			@sqladapter.client.query("update football_teams set `GF` = `GF` + #{score_teamA}, `GA` = `GA` + #{score_teamB}, `GD` = `GD` + #{score_teamA - score_teamB} 
				where teams_id  = #{matchs['teams_A_id']}")
			@sqladapter.client.query("update football_teams set `GF` = `GF` + #{score_teamB}, `GA` = `GA` + #{score_teamA}, `GD` = `GD` + #{score_teamB - score_teamA} 
				where teams_id  = #{matchs['teams_B_id']}")
			@sqladapter.client.query("update matchs set score = '#{score_teamA} - #{score_teamB}' where matchs_id = '#{match_id}'")
			if score_teamA == score_teamB
				@sqladapter.client.query("update football_teams set `points` = `points` + 1 where teams_id in (#{matchs['teams_A_id']}, #{matchs['teams_B_id']})")
			elsif score_teamA > score_teamB
				@sqladapter.client.query("update football_teams set `points` = `points` + 3 where teams_id  = #{matchs['teams_A_id']}")
			else
				@sqladapter.client.query("update football_teams set `points` = `points` + 3 where teams_id  = #{matchs['teams_B_id']}")
			end
			puts "You have just successfully input score for a match"
			puts "Do you want to continue(y: to continue/ other: to exit)"
			continue = gets.chomp
		end
		system "clear"
		excute_selection &block=main_menu_block
	end

	def display_team_OF_semi_final
		continue = ""
		while continue != "e"
			puts "---------------------------------------------------------"
			puts "|Group|  Head team      |points|  Second team    |points|"
			puts "---------------------------------------------------------"
			("A".."D").map { |i|
				results = @sqladapter.client.query("select * from football_teams where groups = '#{i}' order by points desc")
				teams = results.to_a
      if ((teams[0]["points"] > teams[1]["points"] && teams[1]["points"] > teams[2]["points"]) || (teams[0]["points"] == teams[1]["points"] && teams[1]["points"] > teams[2]["points"])) # có 1 đội nhất, 1 đội nhì, hoặc 2 đội nhất = điểm
      	print "| ", i.ljust(4),"|  ",teams[0]["name"].ljust(15),"| ",teams[0]["points"].to_s.ljust(5),"|  ",
      	teams[1]["name"].ljust(15),"| ",teams[1]["points"].to_s.ljust(5), "|\n"
      	puts "---------------------------------------------------------"
      elsif teams[0]["points"] > teams[1]["points"] && teams[1]["points"] == teams[2]["points"] # có 1 đội nhất, có >=2 đội nhì = điểm 
        if teams[2]["points"] == teams[3]["points"] #có 3 đội nhì = điểm
        	puts "có 3 đội nhì = điểm"
        else #có 2 đội nhì = điểm
        	second_team_id = check_achievement(teams[1]["teams_id"],teams[2]["teams_id"])
        	puts second_team
        	second_team = get_team_by_id(@sqladapter, second_team_id)
        	print "| ", i.ljust(4),"|  ",teams[0]["name"].ljust(15),"| ",teams[0]["points"].to_s.ljust(5),"|  ",
        	second_team["name"].ljust(15),"| ",second_team["points"].to_s.ljust(5), "|\n"
        	puts "---------------------------------------------------------"
        end
      else #có >=2 đội điểm cao nhất = điểm nhau
        if teams[0]["points"] == teams[1]["points"] && teams[1]["points"] == teams[2]["points"] && teams[2]["points"] == teams[3]["points"] #4 đội cao điểm nhất bằng điểm
        	puts"4 đội cao điểm nhất bằng điểm"
        else teams[0]["points"] == teams[1]["points"] && teams[1]["points"] == teams[2]["points"] #3 đội cao điểm nhất nhất bằng điểm
        	puts"3 đội cao điểm nhất nhất bằng điểm"
        end
      end
    }
    puts "press e to back menu"
    continue = gets.chomp
  end
  system "clear"
  excute_selection &block=main_menu_block
end
end
