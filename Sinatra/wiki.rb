require 'sinatra'
require 'pry'


set :bind, "0.0.0.0"

get ("/") do
  erb :welcome
end