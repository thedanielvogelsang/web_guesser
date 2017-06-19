require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)

get '/' do
  guess = params[:guess].to_i if params[:guess]
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

def check_guess(guess)
  case
  when guess == SECRET_NUMBER
    "You got it right!\nThe Secret number is #{SECRET_NUMBER}"
  when guess > SECRET_NUMBER + 5
    "Way too high!"
  when guess > SECRET_NUMBER
    "Too high"
  when guess < SECRET_NUMBER - 5
    "Way too low!"
  when guess < SECRET_NUMBER
    "Too low"
  end
end

# if guess.to_i > number
#   require 'pry' ; binding.pry
#   get '/' do
#     erb :too_high, :locals => {:number => number}
#   end
# end
