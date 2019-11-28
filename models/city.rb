require_relative ('../db/sql_runner')

class City

  attr_reader :id
  attr_accessor :name, :country_id, :visited

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @visited = details['visited']
    @country_id = details['country_id'].to_i()
  end

  def save()
    sql = "INSERT INTO cities (name, visited, country_id) VALUES ($1, $2, $3) RETURNING id;"
    values = [@name, @visited, @country_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

end
