require_relative('../models/continent.rb')
require_relative('../models/country.rb')
require_relative('../models/city.rb')
require_relative('../models/sight.rb')

#INDEX
get '/destinations' do
  @continents = Continent.not_been_there()
  @countries = Country.not_been_there()
  @cities = City.not_been_there()
  @sights = Sight.not_been_there()
  erb(:"destinations/index")
end

# NEW
get '/destinations/new' do
  redirect "/new"
  erb(:"/new")
end
