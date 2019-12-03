require_relative('../models/continent.rb')
require_relative('../models/country.rb')
require_relative('../models/city.rb')
require_relative('../models/sight.rb')
require ('pry')


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

# DELETE
post '/cities/:id/delete' do
  id = params[:id].to_i()
  city = City.find(id)
  city.delete()
  redirect "/countries"
end

# EDIT
get '/cities/:id/edit' do
  id = params[:id].to_i()
  @city = City.find(id)
  @country_id = @city.country_id
  erb(:"cities/edit")
end

#UPDATE
post '/cities/:id' do
  city = City.new(params)
  city.update()
    redirect "/countries/" + params['country_id']
end
