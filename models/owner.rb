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
    @phone_number = options['phone_number'].to_i
  end

end
