require_relative 'lib/error.rb'
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
			main_menu_template
			while true
				choice = gets.chomp
				break if choice == 'e'
				yield choice
			end
		rescue => e
			puts e.message
			retry
		end
	end

	private

	def main_menu_template
		puts '****************************************'
		puts '* FOOTBALL AUTO CREATE SCHEDULE SYSTEM *'
		puts '****************************************'
		puts '1. Show Teams'
		puts '2. Add Teams'
		puts '3. Create Tournament'
		puts '4. Show Tournaments'
		puts '0. Back'
		puts 'e. Exit'
	end

	def add_team
		print 'Team name: '
		name = gets.chomp
		team = add_team_sql(sqladapter, name)
		if team
			system "clear"
			puts "Inserted #{name} to Football Team"
			show_menu
		else
			add_team
		end
	end
end
