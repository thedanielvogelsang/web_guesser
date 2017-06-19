require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)
@@counter = 6
@@game_over = false

get '/' do
  cheat_mode = params[:cheat]
  message, css_color = check_guess(params[:guess].to_i) if params[:guess]
  if @@counter == 1 && @@game_over == false
    SECRET_NUMBER = rand(101)
    @@counter = 5
    message = "You lost!"
    css_color = "red"
  elsif @@game_over
    SECRET_NUMBER = rand(101)
    @@game_over = false
    @@counter = 6
  else
    @@counter -= 1
  end
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :css_color => css_color, :counter => @@counter, cheat: cheat_mode}
end

def check_guess(guess)
  case
  when guess == SECRET_NUMBER
    @@game_over = true
    ["You got it right!\nThe Secret number is #{SECRET_NUMBER}. Let's play again!", "green"]
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
