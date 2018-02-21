require_relative("../db/sql_runner")

class Animal

  attr_reader :id
  attr_accessor :name, :age, :type, :breed, :adopt_status, :admittion_date

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @age = options['age'].to_i
    @type = options['type']
    @breed = options['breed']
    @adopt_status = options['adopt_status']
    @admittion_date = options['admittion_date']
  end

  #remember to test relevant functions
  def save()
    sql = "INSERT INTO animals(name, age, type, breed, adopt_status, admittion_date)
    VALUES($1, $2, $3, $4, $5, $6)
    RETURNING id"
    values = [@name, @age, @type, @breed, @adopt_status, @admittion_date]
    animal = SqlRunner.run(sql, values)
    @id = animal.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT *
    FROM animals"
    values = []
    animals = SqlRunner.run(sql, values)
    result = animals.map {|animal| Animal.new(animal)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM animals WHERE id = $1"
    values = [id]
    animal = SqlRunner.run(sql, values)
    return Animal.new(animal.first)
  end

  def update()
    sql = "UPDATE animals
    SET (name, age, type, breed, adopt_status, admittion_date)
    = ($1, $2, $3, $4, $5, $6) WHERE id = $7"
    values = [@name, @age, @type, @breed, @adopt_status, @admittion_date, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM animals"
    SqlRunner.run( sql )
  end

  def delete_by_id()
    sql = "DELETE FROM animals WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.search(search)
    if search == nil
      return []
    end
    search_with_wildcards = "#{search}"
    sql = "select * from animals where LOWER(type) = LOWER($1)"
    values = [search_with_wildcards]
    animals = SqlRunner.run(sql, values)
    animals = animals.map {|animal| Animal.new(animal)}
    return animals
  end
  # select * from animals where LOWER(name) like LOWER('%ja%')
  def status_to_b()
    if @adopt_status == 't'
      return "True"
    end
    return "False"
  end

  def owners()
  sql = "SELECT o.* FROM owners o INNER JOIN adoptions a ON a.owner_id = o.id WHERE a.animal_id = $1;"
  values = [@id]
  results = SqlRunner.run(sql, values)
  return results.map { |owner| Owner.new(owner) }
end

end
