require "pry"
require 'time'
require 'benchmark'
# # time = Time.now.strftime("%d/%m/%Y %H:%M")
# # puts time.class
# # a = "18/04/2017 18:05"
# # puts Time.parse(a)
# # # teams= [{"teams_id" => 1},{"teams_id" => 2},{"teams_id" => 4}]
# # # id_team = 4
# # #  #teams = @@client.query("select * from football_teams").to_a
# # #  puts teams.detect{|team|
# # #   team["teams_id"] == id_team 
# # # }
# # # puts Benchmark.measure {
# # #   [1,2,3,4].detect{|d| 
# # #    puts d 
# # #    d == 1

# # #  }
# # # }
# # có 3 trường hợp
# # (có 2 đội nhất nhì cụ thể)

# # (1 đội nhất bảng và các đội nhì bảng(sẽ có 2 trường hợp là 2 đội nhì = điểm hoặc 3 đội  nhì = điểm))

# # ( có >=2 đội nhất bảng = điểm)(sẽ có 3 trường hợp là 2 hoặc 3 hoặc 4 đội cùng = điểm)

# a = [{"teams_id"=>3, "name"=>"tin", "is_seed"=>0, "groups"=>"A", "GF"=>12, "GA"=>7, "GD"=>5, "points"=>7},
#   {"teams_id"=>11, "name"=>"cyong", "is_seed"=>0, "groups"=>"A", "GF"=>9, "GA"=>7, "GD"=>2, "points"=>6},
#   {"teams_id"=>1, "name"=>"A", "is_seed"=>1, "groups"=>"A", "GF"=>10, "GA"=>10, "GD"=>0, "points"=>3},
#   {"teams_id"=>8, "name"=>"tai", "is_seed"=>0, "groups"=>"A", "GF"=>6, "GA"=>10, "GD"=>-4, "points"=>3}]

#   if a[0]["points"] > a[1]["points"] && a[1]["points"] > a[2]["points"] # có 1 đội nhất, 1 đội nhì
#     puts "a ,b"
#   elsif a[0]["points"] > a[1]["points"] && a[1]["points"] = a[2]["points"] # có 1 đội nhất, có >=2 đội nhì = điểm 
#     if a[2]["points"] = a[3]["points"] #có 3 đội nhì = điểm
#       puts "a1 = a2 = a3"
#     else #có 2 đội nhì = điểm
#       puts "a2 = a1"
#     end
#   else #có >=2 đội điểm cao nhất = điểm nhau
#     if a[0]["points"] == a[1]["points"] && a[1]["points"] == a[2]["points"] && a[2]["points"] == a[3]["points"] #4 đội nhất bằng điểm

#     elsif a[0]["points"] == a[1]["points"] && a[1]["points"] == a[2]["points"] && a[2]["points"] > a[3]["points"] #3 đội nhất bằng điểm

#     else #có 2 đội nhất = điểm

#     end


#   end
#   puts teams = results.to_a
#     if (teams[0]["points"] > teams[1]["points"] && teams[1]["points"] >teams[2]["points"])
#       print "| ", i.ljust(4),"|  ",teams[0]["name"].ljust(15),"| ",teams[0]["points"].to_s.ljust(5),"|  ",
#       teams[1]["name"].ljust(15),"| ",teams[1]["points"].to_s.ljust(5), "|\n"
#       puts "---------------------------------------------------------"    
#     end
#     matchs_history = get_score(teams[1]["teams_id"],teams[2]["teams_id"])
#         score =  matchs_history["score"]
#         arr_score = score.split(' - ')
#         second_team_id = arr_score[0].to_i > arr_score[1].to_i ? matchs_history["teams_A_id"] : matchs_history["teams_B_id"]
# h1 = { "a" => 100, "b" => 200,"e" => "abc" }
# h2 = { "b" => 254, "c" => 300, "d" => "xyz" }
# h1.delete("z") { |el| "#{el} not found" }
# h = { "a" => 100, "b" => 200 }                             #=> nil
# h.delete("a") { |el| puts h["el"] } 
# puts h
# print "|","aaa".rjust(6),"|"

#for string
# Why it is? The reason is hidden in the hash implementation.
#  Hash uses a hashing function for the lookup ( ted mI agree that it is little confusing to name in ruby Map as Hash).
#   Symbols have this value “precomputed”, but for string you need to compute it again for whole string. 
#   For symbol its hash value is simple object_id which never changes,
#    but string have different object for each instance ( string is not immutable like in java ), 
#    so to compare if two strings have same hash you need to compute it. 

h1 = { "a" => 100, "b" => 200,"e" => "abc" ,"c" => 100, "c" => 250}
h2 = { a: 100, b: 200,e: "abc" ,c: 100, c: 200}
puts Benchmark.measure {
  h1.each { |k, v| 
    puts "Key: #{k.object_id}, Value: #{v}" }
  }
  puts Benchmark.measure {
    h2.each { |k, v| 
      puts "Key: #{k.object_id}, Value: #{v}" }
    }
    def method_lambda
      lam = lambda { return puts "xin chao" }
      lam.call
      puts "cac ban"
    end

    # 2. return trong proc
    def method_proc
      proc = Proc.new { return puts "xin chao" }
      proc.call
      puts "cac ban"
    end
    method_proc