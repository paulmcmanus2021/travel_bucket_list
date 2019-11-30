require_relative ('../db/sql_runner')

class Country

  attr_reader :id
  attr_accessor :name, :visited, :continent_id

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @visited = details['visited']
    @continent_id = details['continent_id'].to_i()
  end

  def save()
    sql = "INSERT INTO countries (name) VALUES ($1) RETURNING id;"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM countries"
    results = SqlRunner.run(sql)
    return results.map {|country|Country.new(country)}
  end

  def update()
    sql = "UPDATE countries SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM countries"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM countries WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM countries WHERE id = $1"
    values = [id]
    country = SqlRunner.run(sql, values).first
    return Country.new(country)
  end

  #find all cities in a country
  def cities()
    sql = "SELECT * FROM cities WHERE country_id = $1"
    values = [@id]
    cities = SqlRunner.run(sql, values)
    return cities.map {|city|City.new(city)}
  end

  #find all sights in a country
  def sights()
    sql = "SELECT sights.* FROM sights WHERE country_id = $1;"
    values = [@id]
    sights = SqlRunner.run(sql, values)
    return sights.map {|sight|Sight.new(sight)}
  end

  #countries visited
  def self.been_there
    sql = "SELECT * FROM countries WHERE visited = 't';"
    visited = SqlRunner.run(sql)
    return visited.map {|country|Country.new(country)}
  end

  def self.not_been_there
    sql = "SELECT * FROM countries WHERE visited = 'f';"
    visited = SqlRunner.run(sql)
    return visited.map {|country|Country.new(country)}
  end


#
end
