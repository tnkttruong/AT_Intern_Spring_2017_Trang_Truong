class Info
  attr_accessor :name, :mentor, :team, :github

  def input_info
    input_attribute
  end

  def input_attribute
    puts "Input your name: "
    @name = gets.chomp
    puts "Input your mentor"
    @menter = gets.chomp
    puts "Input your team"
    @team = gets.chomp
    puts "Input your link github"
    @github = gets.chomp
  end

  def create_info_file
    f = File.new("#{name}.txt", "w+")
    self.instance_variables.each_with_index {|attribute, index|
      f.write(set_file_template[index] + (self.instance_variable_get attribute)+"\n")}
    end

    def set_file_template
      ["My name is ", "My team is ", "My mentor is ", "My link github is "]
    end
  end

  info = Info.new()
  info.input_info
  info.create_info_file