require "sinatra"
require "sinatra/activerecord"
require "pry"

  set :database, {adapter: "sqlite3", database: "noteapp.sqlite3"}

  get "/" do
    erb :layout
  end
