require 'sinatra'
require 'sinatra/reloader'
require 'net/http'
require 'json'

get "/" do
  erb :index
end

get "/info" do
  erb :info
end

post "/save_form" do
  uri = URI("https://www.google.com/recaptcha/api/siteverify")
  res = Net::HTTP.post_form(uri, {'secret' => "6LeIxAcTAAAAAGG-vFI1TnRWxMZNFuojJ4WifJWe", 'response' => params["g-recaptcha-response"]})

  passed = JSON.parse(res.body)
  @params = params
  if passed["success"]
    erb :passed
  else
    erb :failed
  end
end
