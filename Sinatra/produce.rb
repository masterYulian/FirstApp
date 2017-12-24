require 'sinatra'
require 'pry'

set :bind, "0.0.0.0"

get ("/apple") do
  "<h1>Here's juice apple!<h1>"
end
