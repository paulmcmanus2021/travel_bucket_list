require('sinatra')
require('sinatra/contrib/all')
require('pry')
also_reload('./models/*')

require_relative("./controllers/visited_controller.rb")
require_relative("./controllers/destination_controller.rb")



get '/' do
  erb(:home)
end
