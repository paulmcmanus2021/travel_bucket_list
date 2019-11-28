require_relative ('../models/continent.rb')
require_relative ('../models/country.rb')
require_relative ('../models/city.rb')
require_relative ('../models/sight.rb')
require ('pry')

Sight.delete_all()
City.delete_all()
Country.delete_all()
Continent.delete_all()

#Continents
continent1 = Continent.new({
  'name' => 'North America',
  'visited' => 't'
  })
  continent1.save

continent2 = Continent.new({
  'name' => 'South America',
  'visited' => 'f'
  })
  continent2.save

#Countries
country1 = Country.new({
  'name' => 'United States of America',
  'visited' => 't',
  'continent_id' => continent1.id
  })
  country1.save

country2 = Country.new({
  'name' => 'Brazil',
  'visited' => 'f',
  'continent_id' => continent2.id
  })
  country2.save

#Cities
city1 = City.new({
  'name' => 'New York City',
  'visited' => 't',
  'country_id' => country1.id
  })
  city1.save

city2 = City.new({
  'name' => 'Rio de Janeiro',
  'visited' => 'f',
  'country_id' => country2.id
  })
  city2.save

#Sights
sight1 = Sight.new({
  'name' => 'Empire State Building',
  'visited' => 't',
  'type' => 'Architecture',
  'city_id' => city1.id,
  })
  sight1.save

sight2 = Sight.new({
  'name' => 'Times Square',
  'visited' => 't',
  'type' => 'Area',
  'city_id' => city1.id,
  })
  sight2.save

sight3 = Sight.new({
  'name' => 'Christ the Redeemer',
  'visited' => 'f',
  'type' => 'Statue',
  'city_id' => city2.id,
  })
  sight3.save

  binding.pry
  nil
