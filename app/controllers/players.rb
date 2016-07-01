get "/players/sign-up" do 
  @teams = Team.all
  erb :"/players/sign-up"
end