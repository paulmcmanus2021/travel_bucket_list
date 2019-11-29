require_relative('../models/continent.rb')
require_relative('../models/country.rb')
require_relative('../models/city.rb')
require_relative('../models/sight.rb')

#INDEX
get '/visited' do
  @continents = Continent.been_there()
  @countries = Country.been_there()
  @cities = City.been_there()
  @sights = Sight.been_there()
  erb(:"visited/index")
end

# NEW
get '/visited/new' do
  erb(:"visited/new")
end
#
# # CREATE
# post '/customers' do
#   customer = Customer.new(params)
#   customer.save()
#   redirect "/customers"
# end
#
# # SHOW
# get '/customers/:id' do
#   id = params[:id].to_i()
#   @customer = Customer.find(id)
#   erb(:"customers/show")
# end
#
# # DELETE
# post '/customers/:id/delete' do
#   id = params[:id].to_i()
#   customer = Customer.find(id)
#   customer.delete()
#   redirect '/customers'
# end
#
# # EDIT
# get '/customers/:id/edit' do
#   id = params[:id].to_i()
#   @customer = Customer.find(id)
#   erb(:"customers/edit")
# end
#
# #UPDATE
# post '/customers/:id' do
#   customer = Customer.new(params)
#   customer.update()
#   redirect '/customers'
# end
