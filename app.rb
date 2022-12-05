require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path(__dir__)
end

Choices = {
  'HAM' => 'Hamburger',
  'PIZ' => 'Pizza',
  'CUR' => 'Curry',
  'NOO' => 'Noodles',
}

get "/" do
  erb :index
end

get "/about" do
  erb :about
end

get "/team/:username" do
  puts params[:username]
  "The username is #{params[:username]}"
  erb :team
end
