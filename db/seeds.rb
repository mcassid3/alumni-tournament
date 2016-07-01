require 'csv'

#Add 2016 Tournament
Tournament.create!(name: "Illinois Alumni Hockey Tournament", year: 2016, rink: "Seven Bridges Ice Arena", city: "Woodridge", state: "IL")

#Enter 2016 schools
schools = ["Lincoln-Way Central", "Homewood Flossmoor", "Fenwick","Sandburg","Lyons Township","Downers Grove South","Marist","Lincoln-Way East","Lockport","Hinsdale Central","Providence Catholic","Rockford","Brother Rice","Mount Carmel","Andrew","St. Rita","Naperville Central","St. Laurence","Downer's Grove North","Conant","St. Viator","Riverside Brookfield"]

schools.each do |school|
  School.create!(name: school)
end

#Add 2016 Teams (24)
Team.create!(name:"Lincoln-Way Central #1" , school_id: 1, tournament_id: 1, division: "Old Timers" )
Team.create!(name: "Homewood Flossmoor #1" , school_id: 2, tournament_id: 1, division: "Old Timers")
Team.create!(name: "Lincoln-Way Central #2" , school_id: 1 , tournament_id: 1, division: "Old Timers" )
Team.create!(name: "Fenwick" , school_id: 3 , tournament_id: 1, division: "Young Guns")
Team.create!(name: "Sandburg" , school_id: 4, tournament_id: 1, division: "Young Guns" )
Team.create!(name: "Lyons Township" , school_id: 5, tournament_id: 1, division: "Young Guns")
Team.create!(name: "Downer's Grove South", school_id: 6, tournament_id: 1, division: "Old Timers")
Team.create!(name: "Marist", school_id: 7 , tournament_id: 1, division: "Young Guns" )
Team.create!(name: "Lincoln-Way East", school_id: 8, tournament_id: 1, division: "Old Timers")
Team.create!(name: "Lockport" , school_id: 9, tournament_id: 1, division: "Old Timers")
Team.create!(name: "Hinsdale Central" , school_id: 10, tournament_id: 1, division: "Young Guns")
Team.create!(name: "Providence Catholic #1", school_id: 11, tournament_id: 1, division: "Old Timers" )
Team.create!(name: "Rockford", school_id: 12 , tournament_id: 1, division: "Young Guns" )
Team.create!(name: "Brother Rice", school_id: 13 , tournament_id: 1, division: "Old Timers" )
Team.create!(name: "Mount Carmel", school_id: 14, tournament_id: 1, division: "Young Guns" )
Team.create!(name: "Andrew #2" , school_id: 15 , tournament_id: 1, division: "Young Guns"  )
Team.create!(name: "St. Rita", school_id: 16, tournament_id: 1, division: "Young Guns" )
Team.create!(name: "Naperville Central", school_id: 17 , tournament_id: 1, division: "Old Timers")
Team.create!(name: "St. Laurence", school_id: 18, tournament_id: 1, division: "Old Timers")
Team.create!(name: "Downer's Grove North", school_id: 19 , tournament_id: 1, division: "Old Timers")
Team.create!(name: "Conant", school_id: 20 , tournament_id: 1, division: "Old Timers" )
Team.create!(name: "St. Viator", school_id: 21, tournament_id: 1, division: "Young Guns" )
Team.create!(name: "Providence Catholic #2", school_id: 11, tournament_id: 1, division: "Young Guns" )
Team.create!(name: "Riverside Brookfield", school_id: 22, tournament_id: 1, division: "Young Guns" )

#Enter 2016 players
CSV.foreach("./db/players.csv", headers: true, header_converters: :symbol) do |row|
  player = Player.create!(first_name: row[:first_name],
                 last_name: row[:last_name],
                 email: row[:email],
                 password_hash: row[:password],
                 cell: row[:cell],
                 captain: row[:column],
                 school_id: row[:school_id],
                 grad_year: row[:grad_year]
                )
   team = Team.find(row[:team_id])
   RosterSpot.create!(player: player, team: team)
end





