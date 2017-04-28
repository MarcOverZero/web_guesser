require 'sinatra'
require 'sinatra/reloader'

num = rand(100)
also = "a"

get '/' do
  "The SECRET NUMBER is #{num}"
end
