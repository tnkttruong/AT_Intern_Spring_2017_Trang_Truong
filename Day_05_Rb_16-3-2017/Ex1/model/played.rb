require "pry"
class Player
  attr_accessor :name, :total
  @@people = [] 
  def initialize(name, total)
    @name = name
    @total = total
    @@people.push name
  end
  def self.people
    #binding.pry
    puts @@people
  end
  #binding.pry
  def gretting
  #  binding.pry
    puts "name is #{name}"
  end
end
play =  Player.new('dy',50)
play.gretting()
Player.people()
