require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)

get '/' do
  guess = params[:guess].to_i if params[:guess]
  message, css_color = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :css_color => css_color}
end

def check_guess(guess)
  case
  when guess == SECRET_NUMBER
    ["You got it right!\nThe Secret number is #{SECRET_NUMBER}", "green"]
  when guess > SECRET_NUMBER + 5
    ["Way too high!", "#E74C3C"]
  when guess > SECRET_NUMBER
    ["Too high", "#EC7063"]
  when guess < SECRET_NUMBER - 5
    ["Way too low!", "#E74C3C"]
  when guess < SECRET_NUMBER
    ["Too low", "#EC7063"]
  end
end

# if guess.to_i > number
#   require 'pry' ; binding.pry
#   get '/' do
#     erb :too_high, :locals => {:number => number}
#   end
# end
