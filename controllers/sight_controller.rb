require_relative('../models/continent.rb')
require_relative('../models/country.rb')
require_relative('../models/city.rb')
require_relative('../models/sight.rb')
require('pry')

# INDEX
get '/sights' do
  @sights = Sight.all()
  erb(:"/sights/index")
end
