require_relative ('../models/continent.rb')
require_relative ('../models/country.rb')
require_relative ('../models/city.rb')
require_relative ('../models/sight.rb')
require ('pry')

# Sight.delete_all()
# City.delete_all()
# Country.delete_all()
# Continent.delete_all()

continent1 = Continent.new({
  'name' => 'North America',
  'visited' => 't'
  })
  continent1.save

country1 = Country.new({
  'name' => 'United States of America',
  'visited' => 't',
  'continent_id' => continent1.id
  })
  country1.save

city1 = City.new({
  'name' => 'New York City',
  'visited' => 't',
  'country_id' => country1.id
  })
  city1.save

sight1 = Sight.new({
  'name' => 'Empire State Building',
  'visited' => 't',
  'type' => 'Building',
  'city_id' => city1.id,
  })
  sight1.save

  binding.pry
  nil
