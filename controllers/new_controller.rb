require_relative('../models/continent.rb')
require_relative('../models/country.rb')
require_relative('../models/city.rb')
require_relative('../models/sight.rb')

get '/new' do
  erb(:"/new")
end
