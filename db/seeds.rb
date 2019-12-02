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
  })
  continent1.save
continent2 = Continent.new({
  'name' => 'South America',
  })
  continent2.save
continent3 = Continent.new({
  'name' => 'Europe',
  })
  continent3.save
continent4 = Continent.new({
  'name' => 'Africa',
  })
  continent4.save
continent5 = Continent.new({
  'name' => 'Asia',
  })
  continent5.save
continent6 = Continent.new({
  'name' => 'Australia',
  })
  continent6.save
continent7 = Continent.new({
  'name' => 'Antarctica',
  })
  continent7.save

#Countries
country1 = Country.new({
  'name' => 'United States of America',
  'continent_id' => continent1.id,
  'visited' => 't'
  })
  country1.save

country2 = Country.new({
  'name' => 'Brazil',
  'continent_id' => continent2.id,
  'visited' => 'f'
  })
  country2.save

country3 = Country.new({
  'name' => 'Canada',
  'continent_id' => continent1.id,
  'visited' => 't'
  })
  country3.save

#Cities
city1 = City.new({
  'name' => 'New York City',
  'country_id' => country1.id,
  'visited' => 't'
  })
  city1.save

city2 = City.new({
  'name' => 'Rio de Janeiro',
  'country_id' => country2.id,
  'visited' => 'f'
  })
  city2.save

city3 = City.new({
  'name' => 'Los Angeles',
  'country_id' => country1.id,
  'visited' => 'f'
  })
  city3.save

city4 = City.new({
  'name' => 'Toronto',
  'country_id' => country3.id,
  'visited' => 'f'
  })
  city4.save

#Sights
sight1 = Sight.new({
  'name' => 'Empire State Building',
  'type' => 'Architecture',
  'country_id' => country1.id,
  'city_id' => city1.id
  })
  sight1.save

sight2 = Sight.new({
  'name' => 'Times Square',
  'type' => 'Area',
  'country_id' => country1.id,
  'city_id' => city1.id
  })
  sight2.save

sight3 = Sight.new({
  'name' => 'Christ the Redeemer',
  'type' => 'Statue',
  'country_id' => country2.id,
  'city_id' => city2.id
  })
  sight3.save

sight4 = Sight.new({
  'name' => 'Griffith Park Observatory',
  'type' => 'Architecture',
  'country_id' => country1.id,
  'city_id' => city3.id
  })
  sight4.save

sight5 = Sight.new({
  'name' => 'CN Tower',
  'type' => 'Architecture',
  'country_id' => country3.id,
  'city_id' => city4.id
  })
  sight5.save



  binding.pry
  nil
