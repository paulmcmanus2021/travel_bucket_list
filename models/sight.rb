require_relative ('../db/sql_runner')

class Sight

  attr_reader :id
  attr_accessor :name, :country_id, :city_id, :type, :visited

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @visited = details['visited']
    @type = details['type']
    @city_id = details['city_id'].to_i
  end

  def save()
    sql = "INSERT INTO sights (name, visited, type, city_id) VALUES ($1, $2, $3, $4) RETURNING id;"
    values = [@name, @visited, @type, @city_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM sights"
    results = SqlRunner.run(sql)
    return results.map {|sight|Sight.new(sight)}
  end

  def self.delete_all()
    sql = "DELETE FROM sights"
    SqlRunner.run(sql)
  end

end
