require_relative ('../db/sql_runner')
require('pry')

class City

  attr_reader :id
  attr_accessor :name, :country_id, :visited

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @country_id = details['country_id'].to_i
    @visited = details['visited'] == "t" ? true : false
  end

  def save()
    sql = "INSERT INTO cities (name, country_id, visited) VALUES ($1, $2, $3) RETURNING id;"
    values = [@name, @country_id, @visited]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM cities"
    results = SqlRunner.run(sql)
    return results.map {|city|City.new(city)}
  end

  def update()
    sql = "UPDATE cities SET (name, country_id, visited) = ($1, $2, $3) WHERE id = $4"
    values = [@name, @country_id, @visited, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM cities"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM cities WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM cities WHERE id = $1"
    values = [id]
    city = SqlRunner.run(sql, values).first
    return City.new(city)
  end

  #find all sights in a city
  def sights()
    sql = "SELECT * FROM sights WHERE city_id = $1"
    values = [@id]
    sights = SqlRunner.run(sql, values)
    return sights.map {|sight|Sight.new(sight)}
  end

  # cities visited
  def self.been_there(country_id)
    sql = "SELECT * FROM cities WHERE visited = 't' AND country_id = $1;"
    values = [country_id]
    visited = SqlRunner.run(sql, values)
    return visited.map {|city|City.new(city)}
  end

  def self.not_been_there(country_id)
    sql = "SELECT * FROM cities WHERE visited = 'f' AND country_id = $1;"
    values = [country_id]
    visited = SqlRunner.run(sql, values)
    return visited.map {|city|City.new(city)}
  end

  def country()
    #Get all the Country objects from the countries table where the id matches...
    sql = "SELECT * FROM countries WHERE id = $1;"
    #this value/id.
    values =[@country_id]
    #Perform the sql with the stated values and assign the result to country.
    country = SqlRunner.run(sql, values)
    #Map new Country object with country variable information and assign it to array
    array = country.map {|country|Country.new(country)}
    #return first thing in the array's name property (i.e. the country name)
    return array.first.name
  end




end
