require_relative('../models/continent.rb')
require_relative('../models/country.rb')
require_relative('../models/city.rb')
require_relative('../models/sight.rb')

#INDEX
get '/visited' do
  @continents = Continent.been_there()
  @countries = Country.been_there()
  @cities = City.been_there()
  @sights = Sight.been_there()
  erb(:"visited/index")
end

# NEW
get '/visited/continents/new' do
  erb(:'/new_continent')
end

#CREATE
post '/visited/continents/new' do
  details = {"name" => params["continent"], "visited" => "t"}
  continent = Continent.new(details)
  continent.save
  redirect to "/visited/continents/#{continent.id}"
end

get '/visited/continents/:id' do
  @continent = Continent.find(params['id'])
  erb(:"continent")
end
