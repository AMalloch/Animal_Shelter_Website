require_relative("../db/sql_runner")

class Owner

  attr_reader :id
  attr_accessor :first_name, :second_name, :dob, :address, :city,
  :post_code, :email_address, :phone_number

  def initialize( options )
    @id = options['id'].to_i if options['id']
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
    sql = "INSERT INTO owners(first_name, second_name, dob, address,
     city, post_code, email_address, phone_number)
    VALUES($1, $2, $3, $4, $5, $6, $7, $8)
    RETURNING id"
    values = [@first_name, @second_name, @dob, @address,
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

  def self.find(id)
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [id]
    owner = SqlRunner.run(sql, values)
    return Owner.new(owner.first)
  end

  def update()
    sql = "UPDATE owners
    SET (first_name, second_name, dob, address,
     city, post_code, email_address, phone_number)
    = ($1, $2, $3, $4, $5, $6, $7, $8) WHERE id = $9"
    values = [@first_name, @second_name, @dob, @address,
       @city, @post_code, @email_address, @phone_number, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM owners"
    SqlRunner.run( sql )
  end

  def delete_by_id
    sql = "DELETE FROM owners WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def animals()
    sql = "SELECT a.* FROM animals v INNER JOIN adoptions a ON a.animal_id = o.id WHERE a.owner_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |animal| Animal.new(animal) }
  end

end
