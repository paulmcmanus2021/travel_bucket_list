require_relative ('../db/sql_runner')

class City

  attr_reader :id
  attr_accessor :name, :visited, :country_id

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @visited = details['visited']
    @country_id = details['country_id'].to_i
  end

  def save()
    sql = "INSERT INTO cities (name, visited, country_id) VALUES ($1, $2, $3) RETURNING id;"
    values = [@name, @visited, @country_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM cities"
    results = SqlRunner.run(sql)
    return results.map {|city|Cities.new(city)}
  end

  def update()
    sql = "UPDATE cities SET (name, visited, country_id) = ($1, $2, $3) WHERE id = $4"
    values = [@name, @visited, @country_id, @id]
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
    city = SqlRunner.run(sql, values)[0]
    return City.new(city)
  end

  #find all sights in a city
  def sights()
    sql = "SELECT * FROM sights WHERE city_id = $1"
    values = [@id]
    sights = SqlRunner.run(sql, values)
    return sights.map {|sight|Sight.new(sight)}
  end

  #cities visited
  def self.been_there
    sql = "SELECT * FROM cities WHERE visited = 't';"
    visited = SqlRunner.run(sql)
    return visited.map {|city|City.new(city)}
  end

  def self.not_been_there
    sql = "SELECT * FROM cities WHERE visited = 'f';"
    visited = SqlRunner.run(sql)
    return visited.map {|city|City.new(city)}
  end



end
