require_relative('../models/continent.rb')
require_relative('../models/country.rb')
require_relative('../models/city.rb')
require_relative('../models/sight.rb')
require('pry')

# INDEX
get '/continents' do
  @continents = Continent.all()
  erb(:"/continents/index")
end
