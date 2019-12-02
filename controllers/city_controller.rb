require_relative('../models/continent.rb')
require_relative('../models/country.rb')
require_relative('../models/city.rb')
require_relative('../models/sight.rb')


# INDEX
get '/cities' do
  @cities = City.all()
  erb(:"/cities/index")
end

# NEW
get '/cities/new' do
  @cities = City.all()
  erb(:"cities/new")
end

# CREATE
post '/cities' do
  binding.pry
  city_hash = params
  city = City.new(city_hash)
  city.save()
  redirect "/countries/" + params['country_id']
end

# SHOW
get '/cities/:id' do
  id = params[:id].to_i()
  @city = City.find(id)
  erb(:"cities/show")
end

# ADD CITY TO COUNTRY
post '/countries/:id/' do


end

# DELETE
post '/cities/:id/delete' do
  id = params[:id].to_i()
  city = City.find(id)
  city.delete()
  redirect '/cities'
end

# EDIT
get '/cities/:id/edit' do
  id = params[:id].to_i()
  @city = City.find(id)
  erb(:"cities/edit")
end

#UPDATE
post '/cities/:id' do
  city = City.new(params)
  city.update()
  redirect '/cities'
end
