require "pry"
require_relative '../service/football_service.rb'

module League

  def get_data_from_web
    url="https://en.wikipedia.org/wiki/2015%E2%80%9316_Premier_League#Result_table"
    check = false
    rt=false
    arr_str = []
    open(url).each_line {|line| 
      if line == "<table class=\"wikitable plainrowheaders\" style=\"text-align:center;\">\n"
        rt=true
        check = true
      end
      check = false if line == "</table>\n"
      if check == true
        arr_str.push line
      elsif rt == true
        break
      end
    }
    return arr_str
  end

  def covert_arr_str arr_str
    sub_arr = []
    result = []
    check = false
    arr_str.map{ |line|
      check = true if line == "<tr>\n"
      check = false if line == "</tr>\n"
      if check == true 
        sub_arr.push line
      else
        result.push sub_arr
        sub_arr = []
      end
    }
    result.shift
    return result
  end

  def add_team_name arr_name
    arr_name.shift
    arr_name.shift
    arr_name.each do |i|
      teamname = i.scan(/title=".+"/)[0]
      teamname = teamname.slice(7..teamname.length-2)
      teamname.slice!("A.F.C. ")
      teamname.slice!(" F.C.")
      teamname.slice!(" A.F.C.")
      insert_team(@sqladapter, teamname, arr_name.index(i)+1)
    end 
  end

  def get_score result
    x=1
    result.map{|i|
      y=1
      i.shift
      i.shift
      i.map{|j|
        if x!=y
          c = j.scan(/\d+–\d+/)[0]
          arr_score = c.split("–")
          if arr_score[0] > arr_score[1]
            update_score(@sqladapter, arr_score[0], arr_score[1], 3, x, "W")
            update_score(@sqladapter, arr_score[1], arr_score[0], 0, y, "L")
          elsif arr_score[0] < arr_score[1]
            update_score(@sqladapter, arr_score[0], arr_score[1], 0, x, "L")
            update_score(@sqladapter, arr_score[1], arr_score[0], 3, y, "W")
          else
            update_score(@sqladapter, arr_score[0], arr_score[1], 1, x, "D")
            update_score(@sqladapter, arr_score[1], arr_score[0], 1, y, "D")
          end 
        end
        y+=1
      }
      x+=1
    }   
  end

  def export_file
    arr_teams = get_arr_teams(@sqladapter)
    f = File.new("League_table.txt", "w+")
    f.write("----------------------------------------\n")
    f.write("| Pos |           Team           | Pts |\n")
    f.write("|-----|--------------------------|-----|\n")
    arr_teams.each do |team|
      f.write("| " + (arr_teams.index(team)+1).to_s.ljust(4) + "| " + team["name"].ljust(25) + "| " +
        team["Pts"].to_s.ljust(4) + "|\n")
      f.write("----------------------------------------\n")
   end
 end
end
