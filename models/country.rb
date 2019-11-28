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
    sql = "INSERT INTO countries (name, visited, continent_id) VALUES ($1, $2, $3) RETURNING id;"
    values = [@name, @visited, @continent_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end









#
end
