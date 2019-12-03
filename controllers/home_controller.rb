require_relative('../models/continent.rb')
require_relative('../models/country.rb')
require_relative('../models/city.rb')
require_relative('../models/sight.rb')
require('pry')


# INDEX
get '/home2' do
  erb(:"/home/index")
end
