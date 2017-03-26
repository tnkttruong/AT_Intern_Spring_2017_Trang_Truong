require "pry"
a = "A.F.C. Bournemouth"
#b = a.gsub(/[( F.C.)|(A.F.C. )]/,"k")
a.slice!("A.F.C. ")
a.slice!(" F.C.")
a.slice!(" A.F.C.")
# b = "abc&a=3&c=5"
 #c = b.gsub(/(&a=)|()&c=/,"&abc=")
 arr = [{"leagues_id"=>7, "Pos"=>7, "name"=>"Leicester City", "W"=>23, "D"=>12, "L"=>3, "GF"=>68, "GA"=>36, "GD"=>32, "Pts"=>81},
   {"leagues_id"=>1, "Pos"=>1, "name"=>"Arsenal", "W"=>20, "D"=>11, "L"=>7, "GF"=>65, "GA"=>36, "GD"=>29, "Pts"=>71},
   {"leagues_id"=>17, "Pos"=>17, "name"=>"Tottenham Hotspur", "W"=>19, "D"=>13, "L"=>6, "GF"=>69, "GA"=>35, "GD"=>34, "Pts"=>70},
   {"leagues_id"=>10, "Pos"=>10, "name"=>"Manchester United", "W"=>19, "D"=>9, "L"=>10, "GF"=>49, "GA"=>35, "GD"=>14, "Pts"=>66},
   {"leagues_id"=>9, "Pos"=>9, "name"=>"Manchester City", "W"=>19, "D"=>9, "L"=>10, "GF"=>71, "GA"=>41, "GD"=>30, "Pts"=>66},
   {"leagues_id"=>13, "Pos"=>13, "name"=>"Southampton", "W"=>18, "D"=>9, "L"=>11, "GF"=>59, "GA"=>41, "GD"=>18, "Pts"=>63},
   {"leagues_id"=>20, "Pos"=>20, "name"=>"West Ham United", "W"=>16, "D"=>14, "L"=>8, "GF"=>65, "GA"=>51, "GD"=>14, "Pts"=>62},
   {"leagues_id"=>8, "Pos"=>8, "name"=>"Liverpool", "W"=>16, "D"=>12, "L"=>10, "GF"=>63, "GA"=>50, "GD"=>13, "Pts"=>60},
   {"leagues_id"=>14, "Pos"=>14, "name"=>"Stoke City", "W"=>14, "D"=>9, "L"=>15, "GF"=>41, "GA"=>55, "GD"=>-14, "Pts"=>51},
   {"leagues_id"=>4, "Pos"=>4, "name"=>"Chelsea", "W"=>12, "D"=>14, "L"=>12, "GF"=>59, "GA"=>53, "GD"=>6, "Pts"=>50},
   {"leagues_id"=>6, "Pos"=>6, "name"=>"Everton", "W"=>11, "D"=>14, "L"=>13, "GF"=>59, "GA"=>55, "GD"=>4, "Pts"=>47},
   {"leagues_id"=>16, "Pos"=>16, "name"=>"Swansea City", "W"=>12, "D"=>11, "L"=>15, "GF"=>42, "GA"=>52, "GD"=>-10, "Pts"=>47},
   {"leagues_id"=>18, "Pos"=>18, "name"=>"Watford", "W"=>12, "D"=>9, "L"=>17, "GF"=>40, "GA"=>50, "GD"=>-10, "Pts"=>45},
   {"leagues_id"=>19, "Pos"=>19, "name"=>"West Bromwich Albion", "W"=>10, "D"=>13, "L"=>15, "GF"=>34, "GA"=>48, "GD"=>-14, "Pts"=>43},
   {"leagues_id"=>5, "Pos"=>5, "name"=>"Crystal Palace", "W"=>11, "D"=>9, "L"=>18, "GF"=>39, "GA"=>51, "GD"=>-12, "Pts"=>42},
   {"leagues_id"=>3, "Pos"=>3, "name"=>"Bournemouth", "W"=>11, "D"=>9, "L"=>18, "GF"=>45, "GA"=>67, "GD"=>-22, "Pts"=>42},
   {"leagues_id"=>15, "Pos"=>15, "name"=>"Sunderland", "W"=>9, "D"=>12, "L"=>17, "GF"=>48, "GA"=>62, "GD"=>-14, "Pts"=>39},
   {"leagues_id"=>11, "Pos"=>11, "name"=>"Newcastle United", "W"=>9, "D"=>10, "L"=>19, "GF"=>44, "GA"=>65, "GD"=>-21, "Pts"=>37},
   {"leagues_id"=>12, "Pos"=>12, "name"=>"Norwich City", "W"=>9, "D"=>7, "L"=>22, "GF"=>39, "GA"=>67, "GD"=>-28, "Pts"=>34},
   {"leagues_id"=>2, "Pos"=>2, "name"=>"Aston Villa", "W"=>3, "D"=>8, "L"=>27, "GF"=>27, "GA"=>76, "GD"=>-49, "Pts"=>17}]
   f = File.new("League_table.txt", "w+")
   f.write("----------------------------------------\n")
   f.write("| Pos |           Team           | Pts |\n")
   f.write("|-----|--------------------------|-----|\n")
   arr.each do |team|
   f.write("| " + (arr.index(team)+1).to_s.ljust(4) + "| " + team["name"].ljust(25) + "| " + team["Pts"].to_s.ljust(4) + "|\n")
   f.write("----------------------------------------\n")
   end

