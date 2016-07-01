require 'uri'
require 'net/http'
require 'json'
get "/" do
  erb :"/index"
end

get "/vimeodata" do
  uri = URI.parse("https://api.vimeo.com/videos/172972658/?fields=stats")
  params = {:access_token => "1c3f9c7249cfaab1a8d1254aee7690a2", :Accept => "application/vnd.vimeo.*+json;version=3.2", :scope => "public" }
  
  uri.query = URI.encode_www_form(params)

  res = Net::HTTP.get_response(uri)
  content_type :json
  res.body.to_json if res.is_a?(Net::HTTPSuccess)

end

