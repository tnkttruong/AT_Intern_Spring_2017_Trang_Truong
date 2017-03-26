# require_relative 'lib/.rb'
require 'pry'
module FootballService

	def show_teams adapter
		teams = @sqladapter.client.query("SELECT * FROM teams")
		puts 'ID     |     NAME'
		teams.map{|team|
			puts "#{team['id']}     |     #{team['name']}"
		}
	end

	def add_team_sql adapter, name
		team = @sqladapter.client.query("INSERT INTO teams (name) VALUES ('#{name}')")
		return true if team.nil?
	end
end

