require "mysql2"

class FootballSQL
	attr_accessor :client

	def initialize(host='localhost', port=3306, database='premier_league', username='root', password='858140858140', reconnect=true)
		creat_database
    @client = Mysql2::Client.new(
      :host => host, 
      :port => port, 
      :database => database,
      :username => username, 
      :password => password,
      :reconnect => reconnect
      )
	end

  def creat_database
    
  end
end
