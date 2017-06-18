require 'sinatra'
require 'sinatra/reloader'

X = rand(101)

get '/' do
  "The SECRET NUMBER is #{X}"
end