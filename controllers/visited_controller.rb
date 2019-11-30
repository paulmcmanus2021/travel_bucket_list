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
get '/visited/new' do
  redirect "/new"
end
