require_relative("../db/sql_runner")

class Owner

  attr_reader :id
  attr_accessor :first_name, :second_name, :dob, :address, :city,
  :post_code, :email_address, :phone_number

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @animal = options['animal']
    @first_name = options['first_name']
    @second_name = options['second_name']
    @dob = options['dob']
    @address = options['address']
    @city = options['city']
    @post_code = options['post_code']
    @email_address = options['email_address']
    @phone_number = options['phone_number']
  end

  #remember to test all functions
  def save()
    sql = "INSERT INTO owners(animal, first_name, second_name, dob, address,
     city, post_code, email_address, phone_number)
    VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9)
    RETURNING id"
    values = [@animal, @first_name, @second_name, @dob, @address,
       @city, @post_code, @email_address, @phone_number]
    owner = SqlRunner.run(sql, values)
    @id = owner.first['id'].to_i
  end

  def self.all()
    sql = "SELECT *
    FROM owners"
    values = []
    owners = SqlRunner.run(sql, values)
    result = owners.map {|owner| Owner.new(owner)}
    return result
  end

  def self.delete_all
    sql = "DELETE FROM owners"
    SqlRunner.run( sql )
  end

  def self.delete_by_id
    sql = "DELETE FROM owners WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, id)
  end

end
