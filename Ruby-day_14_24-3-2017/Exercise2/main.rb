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
#====================old way
#data = m.get_data_from_web
#arr = m.covert_arr_str data
#m.add_team_name arr[0]
#arr.shift
#m.get_score arr
#=================new way
m.creat_database

data = m.get_data_from_web_by_nokogiri

arr_name = m.get_arr_name_from_data data
m.add_team_name_by_nokogiri arr_name

arr_score = m.get_arr_score_from_data data
m.get_score_by_nokogiri arr_score

arr_teams = m.export_file
