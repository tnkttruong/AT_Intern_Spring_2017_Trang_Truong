require 'mysql2'
require "pry"

module Model
  
  def connect
    begin
      @client = Mysql2::Client.new(:host => 'localhost', :database => 'football', :username => "root", :password => "858140858140")
      
    rescue Mysql2::Error => e
      puts e.errno
      puts e.error 
      @client.close if @client
    end
  end

  def get_num_of_team
    return @client.query("SELECT count(teams_id) FROM football_teams").to_a[0].values[0]
  end

  def get_num_of_seed_team
    return @client.query("SELECT count(teams_id) FROM football_teams where is_seed = 1").to_a[0].values[0]
  end

  def get_match_by_id(match_id)
    return matchs = @client.query("select * from matchs where matchs_id = '#{match_id}'").to_a[0]
  end

  def get_score(teamA_id,teamB_id)
    puts "select * from matchs where teams_A_id = '#{teamA_id}' && teams_B_id = '#{teamB_id}'"
    rs = @client.query("select * from matchs where teams_A_id = '#{teamA_id}' && teams_B_id = '#{teamB_id}'").to_a[0]
    puts rs
    return rs
  end

  def get_team_by_id(id_team)
    return teams = @client.query("select * from football_teams where teams_id = '#{id_team}'").to_a[0]
  end

end

