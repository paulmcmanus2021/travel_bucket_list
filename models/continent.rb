require_relative ('../db/sql_runner')

class Continent

  attr_reader :id
  attr_accessor :name, :visited

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @visited = details['visited']
  end

  def save()
    sql = "INSERT INTO continents (name, visited) VALUES ($1, $2) RETURNING id;"
    values = [@name, @visited]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end




end
