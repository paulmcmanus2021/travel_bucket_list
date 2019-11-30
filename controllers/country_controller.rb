require_relative('../models/continent.rb')
require_relative('../models/country.rb')
require_relative('../models/city.rb')
require_relative('../models/sight.rb')


# INDEX
get '/countries' do
  @countries = Country.all()
  erb(:"/countries/index")
end

# NEW
get '/countries/new' do
  @countries = Country.all()
  erb(:"countries/new")
end
#
# CREATE
post '/countries' do
  country_hash = params
  country = Country.new(country_hash)
  country.save()
  redirect "/countries"
end

# EDIT
get '/countries/:id/edit' do
  id = params[:id].to_i()
  @country = Country.find(id)
  erb(:"countries/edit")
end

#UPDATE
post '/countries/:id' do
  country = Country.new(params)
  country.update()
  redirect '/countries'
end
#
# # SHOW
# get '/pizzas/:id' do
#   id = params[:id].to_i()
#   @order = PizzaOrder.find(id)
#   erb(:"pizzas/show")
# end
#
# # DELETE
# post '/pizzas/:id/delete' do
#   id = params[:id].to_i()
#   order = PizzaOrder.find(id)
#   order.delete()
#   redirect '/pizzas'
# end
#
