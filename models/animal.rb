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

end
