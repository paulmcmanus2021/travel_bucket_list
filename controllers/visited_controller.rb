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
  redirect "/new"
end

#SHOW
get '/visited/:id' do
  @visit =
  Continent.find(params['id'])
  erb(:"visited/show")
end



# post '/students' do
#   Student.new(params).save
#   redirect to '/students'
# end
#
# get '/students/:id' do
#   @student = Student.find(params['id'])
#   erb(:"students/show")
# end
#
# get '/students/:id/edit' do
#   @houses = House.all
#   @student = Student.find(params['id'])
#   erb(:"students/edit")
# end
#
# post '/students/house' do
#   house_id = params['house_id']
#   @houses = House.all()
#   if house_id == "all"
#     @students = Student.all()
#   else
#   @students = Student.find_students_by_house(house_id)
#   end
#   erb(:"students/index")
# end
#
# post '/students/:id' do
#   student = Student.new(params)
#   student.update
#   redirect to "/students/#{params['id']}"
# end
#
# post '/students/:id/delete' do
#   student = Student.find(params['id'])
#   student.delete
#   redirect to '/students'
# end
