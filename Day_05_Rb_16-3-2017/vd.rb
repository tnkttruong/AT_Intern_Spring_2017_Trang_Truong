require "pry"
require 'time'
require 'benchmark'
  time = Time.now.strftime("%d/%m/%Y %H:%M")
puts time.class
a = "18/04/2017 18:05"
puts Time.parse(a)
# teams= [{"teams_id" => 1},{"teams_id" => 2},{"teams_id" => 4}]
# id_team = 4
#  #teams = @@client.query("select * from football_teams").to_a
#  puts teams.detect{|team|
#   team["teams_id"] == id_team 
# }
# puts Benchmark.measure {
#   [1,2,3,4].detect{|d| 
#    puts d 
#    d == 1

#  }
# }



