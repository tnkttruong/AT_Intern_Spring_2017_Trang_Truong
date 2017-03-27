require "pry"
require 'open-uri'
require 'nokogiri'
require_relative '../service/football_service.rb'

module League

  def creat_database
    creat_table @sqladapter
  end

  def get_data_from_web
    #get source code html of Result table from web with url
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
    #Convert Result table's html to array, each row is a sub array
    sub_arr = []
    result = []
    check = false
    arr_str.each do |line|
      check = true if line == "<tr>\n"
      check = false if line == "</tr>\n"
      if check == true 
        sub_arr.push line
      else
        result.push sub_arr
        sub_arr = []
      end
    end
    result.shift
    return result
  end

  def add_team_name arr_name
    #add name to database
    arr_name.shift
    arr_name.shift
    arr_name.each do |i|
      teamname = i.scan(/title=".+"/)[0]
      teamname = teamname.slice(7..teamname.length-2)
      teamname.gsub!(/( F.C.)|(A.F.C. )| ( A.F.C.)/, '')
      insert_team(@sqladapter, teamname, arr_name.index(i)+1)
    end 
  end

  def get_score result
    #get score and handle then update database
    x=1
    result.each do |i|
      y=1
      i.shift
      i.shift
      i.each do |j|
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
      end
      x+=1
    end  
  end

  def get_data_from_web_by_nokogiri
    html = open('https://en.wikipedia.org/wiki/2015-16_Premier_League#League_table_60')
    doc = Nokogiri::HTML(html.read)
    doc.encoding = 'utf-8'
    return doc
  end

  def get_arr_name_from_data data
    return data.css("table.wikitable.plainrowheaders th[scope='row'] a").to_a
  end

  def get_arr_score_from_data data
    return data.css("table.wikitable.plainrowheaders td").to_a
  end

  def add_team_name_by_nokogiri arr_name
    arr_name.each do |i|
      teamname = i.children.text
      insert_team(@sqladapter, teamname, arr_name.index(i)+1)
    end
  end

  def get_score_by_nokogiri arr_score
    x=1
    y=1
    arr_score.map { |i|
      if x!=y
        score = i.children.text
        arr_score = score.split("–")
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
      if y < 20
        y+=1
      else
        y=1
        x+=1
      end
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
