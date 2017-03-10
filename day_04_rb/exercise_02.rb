require 'active_support/all'
class Report
  def initialize(path)
    @path = path
  end

  def read_file
    @name_of_report_file = Time.now.to_i
    @report_file = File.new("#{@name_of_report_file}.txt","w")
    f = File.open(@path)
    f.each do |line|
      @report_file.write(line + "\n")
    end
  end

  def input_report
    read_file
    line = 1
    check = true
    while check do
      write_report_to_file(line,@path)
      line += 1
      select = gets.chomp
      case select
      when 'n'
        puts "Please check your input file in this path: #{@name_of_report_file}.txt"
        check = false
      else
      end
    end
  end

  def write_report_to_file(line, file_name)
    title = "Please input your line #{line.ordinalize}: "
    puts title
    report_string = gets.chomp
    @report_file.write(title + "\n")
    @report_file.write(report_string + "\n")
    puts "Do you want to input #{(line+1).ordinalize}?"
  end
end
puts "Input your info file path: "
path = gets.chomp
Report.new(path).input_report
