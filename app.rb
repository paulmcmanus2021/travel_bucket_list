require('sinatra')
require('sinatra/contrib/all')
require('pry')
also_reload('./models/*')

require_relative("controllers/country_controller.rb")
require_relative("controllers/city_controller.rb")


get '/' do
  erb(:home)
end
