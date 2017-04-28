require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  color = background(message)
  erb :index, :locals => {:number => NUMBER, :message => message, :color => color}
end

def check_guess(guess)
  if guess > NUMBER
    guess > NUMBER + 5 ? "Way too high!" : "Too high!"
  elsif guess < NUMBER
    guess < NUMBER - 5 ? "Way too low!" : "Too low!"
  elsif guess == NUMBER
    "You got it right! The SECRET NUMBER is #{NUMBER}"
  end
end

def background(message)
  if message == "Way too high!" || message == "Way too low!"
    "red"
  elsif message == "Too high!"  || message == "Too low!"
    "#F75D59" # Bean Red
  elsif message == "You got it right! The SECRET NUMBER is #{NUMBER}"
    "green"
  end
end
