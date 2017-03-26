module MenuBlock
	
	def main_menu_block
		proc = Proc.new { |choice|
			case choice
			when '1'
				show_teams sqladapter
			when '2'
				add_team
			when '3'
				create_tournament
			when '4'
				show_tournament
			when '0'
				break
			else
				raise FootballError.new(nil, "Please input again")
			end
		}
	end

	def add_team_block
		proc = Proc.new { |choice|
			case choice
			when '1'
				print 'Team name: '
				name = gets.chomp
				team = add_team sqladapter, name

			when '2'

			when '0'
				break
			else
				raise FootballError.new(nil, "Please input again")
			end
		}
	end
end
