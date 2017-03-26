module MenuBlock

	def main_menu_block
		proc = Proc.new { |choice|
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
				input_score
			when "6"
				display_team_OF_semi_final
			when "7"
				e = ""
				while e != "e" do
					display_teams
					puts "Press e to back menu"
					e = gets.chomp
				end
				system "clear"
				main
			else
				print "Please input choice is an integer from 0 to 6: "
			end
		}
	end
end
