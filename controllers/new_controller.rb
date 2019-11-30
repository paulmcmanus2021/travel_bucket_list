require_relative('../models/continent.rb')
require_relative('../models/country.rb')
require_relative('../models/city.rb')
require_relative('../models/sight.rb')

get '/new' do
  erb(:"new")
end

#INDEX-Not needed. These are displayed elsewhere
#NEW-/new itself is solely a form

#CREATE-To save to database and display in /visited
# post '/visited' do
#   continent = Continent.new(params)
#   continent.save
#   country = Country.new(params)
#   country.save
#   city = City.new(params)
#   city.save
#   sight = Sight.new(params)
#   sight.save
#   redirect/visited
# end
#SHOW-Not needed. visited/show will show individual continents/countries etc
#DELETE-Not needed. visited/delete controller will handle this
#EDIT-Not needed. Edit button under trips in index will deal with this.
#UPDATE-Not needed. This will happen after the edit form.
