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

country3 = Country.new({
  'name' => 'Canada',
  'visited' => 'f',
  'continent_id' => continent1.id
  })
  country3.save

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

city3 = City.new({
  'name' => 'Los Angeles',
  'visited' => 'f',
  'country_id' => country1.id
  })
  city3.save

city4 = City.new({
  'name' => 'Toronto',
  'visited' => 'f',
  'country_id' => country3.id
  })
  city4.save

#Sights
sight1 = Sight.new({
  'name' => 'Empire State Building',
  'visited' => 't',
  'type' => 'Architecture',
  'country_id' => country1.id,
  'city_id' => city1.id
  })
  sight1.save

sight2 = Sight.new({
  'name' => 'Times Square',
  'visited' => 't',
  'type' => 'Area',
  'country_id' => country1.id,
  'city_id' => city1.id
  })
  sight2.save

sight3 = Sight.new({
  'name' => 'Christ the Redeemer',
  'visited' => 'f',
  'type' => 'Statue',
  'country_id' => country2.id,
  'city_id' => city2.id
  })
  sight3.save

sight4 = Sight.new({
  'name' => 'Griffith Park Observatory',
  'visited' => 'f',
  'type' => 'Architecture',
  'country_id' => country1.id,
  'city_id' => city3.id
  })
  sight4.save

sight5 = Sight.new({
  'name' => 'CN Tower',
  'visited' => 'f',
  'type' => 'Architecture',
  'country_id' => country3.id,
  'city_id' => city4.id
  })
  sight5.save



  binding.pry
  nil
