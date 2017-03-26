require 'pry'
module FootballService

	def get_num_of_team adapter
		return @sqladapter.client.query("SELECT count(teams_id) FROM football_teams").to_a[0].values[0]
	end

	def get_num_of_seed_team adapter
		return @sqladapter.client.query("SELECT count(teams_id) FROM football_teams where is_seed = 1").to_a[0].values[0]
	end

	def get_match_by_id(adapter, match_id)
		return matchs = @sqladapter.client.query("select * from matchs where matchs_id = '#{match_id}'").to_a[0]
	end

	def get_score(adapter, teamA_id,teamB_id)
		rs = @sqladapter.client.query("select * from matchs where teams_A_id = '#{teamA_id}' && teams_B_id = '#{teamB_id}'").to_a[0]
		return rs
	end

	def get_team_by_id(adapter, id_team)
		return teams = @sqladapter.client.query("select * from football_teams where teams_id = '#{id_team}'").to_a[0]
	end

	def check_full_teams adapter
		num_of_team = get_num_of_team adapter
		if num_of_team < 16
			puts "Missing #{16-num_of_team} team to enough all teams please input the remaining teams"
			return false
		end
	end

	def check_number(number,num_current)
		return ((number.match /^[0-9]+$/) && number.to_i > 0 && number.to_i <= 16 - num_current) ? true : false
	end

	def check_achievement(adapter, teamA_id,teams_B_id)
		matchs_history = get_score(@sqladapter, teamA_id, teams_B_id)
		score = matchs_history["score"]
		arr_score = score.split(' - ')
		second_team_id = arr_score[0].to_i > arr_score[1].to_i ? matchs_history["teams_A_id"] : matchs_history["teams_B_id"]
		return second_team_id
	end

	def check_input(input,type)
		case type
		when "day"
			return ((input.match /^[0-9]+$/) && (input.to_i > 0 && input.to_i < 32)) ? true : false
		when "month"
			return ((input.match /^[0-9]+$/) && (input.to_i > 0 && input.to_i < 13)) ? true : false
		when "hour"
			return ((input.match /^[0-9]+$/) && (input.to_i >= 0 && input.to_i < 25)) ? true : false
		when "minute"
			return ((input.match /^[0-9]+$/) && (input.to_i >= 0 && input.to_i < 60)) ? true : false
		when "score_of_team_A","score_of_team_B"
			return (input.match /^[0-9]+$/) ? true : false
		else
			return false
		end
	end

	def check_exist_team(adapter, condition)
		if condition.is_a?(Integer)
			return @sqladapter.client.query("select count(teams_id) from football_teams where teams_id = '#{condition}';").to_a[0].values[0] > 0 ? true : false
		else
			return @sqladapter.client.query("select count(teams_id) from football_teams where name = '#{condition}';").to_a[0].values[0] > 0 ? false : true
		end
	end

	def check_match(adapter, match_id)
		@sqladapter.client.query("select count(matchs_id) from matchs where matchs_id = '#{match_id}';").to_a[0].values[0] > 0 ? true : false
	end

	def input_data(type)
		result = ""
		puts "input #{type}"
		result = gets.chomp
		until check_input(result,type) do
			print "Input is incorrect format please input again: "
			result = gets.chomp
		end
		return result.to_i
	end
end
