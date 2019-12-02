require_relative ('../db/sql_runner')
require_relative ('country.rb')

class Continent

  attr_reader :id
  attr_accessor :name

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
  end

  def save()
    sql = "INSERT INTO continents (name) VALUES ($1) RETURNING id;"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM continents"
    results = SqlRunner.run(sql)
    return results.map {|continent|Continent.new(continent)}
  end

  def update()
    sql = "UPDATE continents SET (name) = ($1) WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM continents"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM continents WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM continents WHERE id = $1"
    values = [id]
    continent = SqlRunner.run(sql, values).first
    return Continent.new(continent)
  end

  #find all countries in a continent
  def countries()
    sql = "SELECT * FROM countries WHERE continent_id = $1"
    values = [@id]
    countries = SqlRunner.run(sql, values)
    return countries.map {|country|Country.new(country)}
  end

  # continents visited
  def self.been_there
    sql = "SELECT * FROM continents WHERE visited = 't';"
    visited = SqlRunner.run(sql)
    return visited.map {|continent|Continent.new(continent)}
  end

  def self.not_been_there
    sql = "SELECT * FROM continents WHERE visited = 'f';"
    visited = SqlRunner.run(sql)
    return visited.map {|continent|Continent.new(continent)}
  end




end
