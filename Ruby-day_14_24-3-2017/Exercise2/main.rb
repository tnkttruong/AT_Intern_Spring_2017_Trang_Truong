require 'open-uri'
require_relative 'lib/mysql_adapter.rb'
require_relative 'service/football_service.rb'
require_relative 'model/league.rb'

class Main
  attr_accessor :sqladapter
  include FootballService, League

  def initialize
    @sqladapter = FootballSQL.new
  end
end

m = Main.new
data = m.get_data_from_web
arr = m.covert_arr_str data
m.add_team_name arr[0]
arr.shift
m.get_score arr
arr_teams = m.export_file
