require_relative("../db/sql_runner")

class Animal

  attr_reader :id
  attr_accessor :name, :age, :species, :breed, :adopt_status, :admittion_date

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @age = options['age'].to_i
    @species = options['species']
    @breed = options['breed']
    @adopt_status = options['adopt_status']
    @admittion_date = options['admittion_date']
  end

  #remember to test relevant functions
  def save()
    sql = "INSERT INTO animals(name, age, species, breed, adopt_status, admittion_date)
    VALUES($1, $2, $3, $4, $5, $6)
    RETURNING id"
    values = [@name, @age, @species, @breed, @adopt_status, @admittion_date]
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

  def self.delete_all
    sql = "DELETE FROM animals"
    SqlRunner.run( sql )
  end

end
