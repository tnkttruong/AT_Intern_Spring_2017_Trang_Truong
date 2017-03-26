require "mysql2"

class FootballSQL
	attr_accessor :client

	def initialize(host='localhost', port=3306, database='football', username='root', password='123456', reconnect=true)
		@client = Mysql2::Client.new(
      :host => host, 
      :port => port, 
      :database => database,
      :username => username, 
      :password => password,
      :reconnect => reconnect
		)
	end

end
