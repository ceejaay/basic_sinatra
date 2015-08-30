require 'sinatra'
require 'sinatra/reloader'

get "/" do
  erb :index
end

get "/info" do
  erb :info
end

post "/save_form" do
  @params = params
  erb :info
end
