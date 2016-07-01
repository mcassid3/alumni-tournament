require 'uri'
require 'net/http'
require 'json'
get "/" do
  erb :"/index"
end

get "/vimeodata" do
  uri = URI('https://api.vimeo.com/videos/172972658?fields=stats')
  p uri
  response = Net::HTTP.get(uri,'token' => '1b4fdf5260916dbe7f8d710a6230f25b')
  p response
end

# https://api.vimeo.com/oauth/authorize?client_id=XXXXX&response_type=code&redirect_uri=XXXX.YYY/ZZZZZ&state=XXXXXX
