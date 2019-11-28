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

end
