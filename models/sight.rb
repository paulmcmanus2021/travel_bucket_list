require_relative ('../db/sql_runner')

class Sight

  attr_reader :id
  attr_accessor :name, :visited, :type, :country_id, :city_id

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @type = details['type']
    @country_id = details['country_id'].to_i
    @city_id = details['city_id'].to_i
  end

  def save()
    sql = "INSERT INTO sights (name, type, country_id, city_id) VALUES ($1, $2, $3, $4) RETURNING id;"
    values = [@name, @type, @country_id, @city_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM sights"
    results = SqlRunner.run(sql)
    return results.map {|sight|Sight.new(sight)}
  end

  def update()
    sql = "UPDATE sights SET (name, type, country_id, city_id) = ($1, $2, $3, $4) WHERE id = $6"
    values = [@name, @type, @country_id, @city_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM sights"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM sights WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM sights WHERE id = $1"
    values = [id]
    sight = SqlRunner.run(sql, values).find
    return Sight.new(sight)
  end

  #sights visited
  def self.been_there
    sql = "SELECT * FROM sights WHERE visited = 't';"
    visited = SqlRunner.run(sql)
    return visited.map {|sight|Sight.new(sight)}
  end

  def self.not_been_there
    sql = "SELECT * FROM sights WHERE visited = 'f';"
    visited = SqlRunner.run(sql)
    return visited.map {|sight|Sight.new(sight)}
  end


end
