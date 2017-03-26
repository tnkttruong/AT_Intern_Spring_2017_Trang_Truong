class FootballError < StandardError
	attr_reader :message

	def initialize(dfl_msg="There are something wrong here!", message)
		@message = message
  end
end
