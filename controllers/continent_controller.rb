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

# # EDIT
# get '/continents/:id/edit' do
#   id = params[:id].to_i()
#   @continent = Continent.find(id)
#   erb(:"continents/edit")
# end

#UPDATE
post '/continents' do
  #have all the continents

  #target the chosen continent

  #update that continents 'visited' value
  # continent.update
  #redirect to continents page
  redirect "/continents"
end
