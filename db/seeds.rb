require_relative("../models/animal.rb")
require_relative("../models/owner.rb")
require("pry-byebug")

Animal.delete_all()
Owner.delete_all()

animal1 =Animal.new({
  "name" => "Jasper",
  "age" => 9,
  "species" => "Cat",
  "breed" => "Maine Coon",
  "adopt_status" => true,
  "admittion_date" => "20/01/2018"
})

animal1.save
animal1.update

animal2 =Animal.new({
  "name" => "Angel",
  "age" => 2,
  "species" => "Dog",
  "breed" => "Yorkshire Terrier",
  "adopt_status" => false,
  "admittion_date" => "04/02/2018"
})

animal2.save

animal3 =Animal.new({
  "name" => "Jaffar",
  "age" => 5,
  "species" => "Snake",
  "breed" => "Corn Snake",
  "adopt_status" => true,
  "admittion_date" => "21/10/2017"
})

animal3.save

animal4 =Animal.new({
  "name" => "Lilly",
  "age" => 6,
  "species" => "Cat",
  "breed" => "Tabby",
  "adopt_status" => true,
  "admittion_date" => "25/12/2017"
})

animal4.save

owner1 = Owner.new({
  "animal" => animal1.id,
  "first_name" => "Roy",
  "second_name" => "Cuthbertson",
  "dob" => "27/02/1979",
  "address" => "41 Cadder Way, Bishopbriggs",
  "city" => "Glasgow",
  "post_code" => "G64 3JP",
  "email_address" => "oggieoggieoggieroyroyroy@gmail.com",
  "phone_number" => "07883654910"
})

owner1.save
owner1.update

owner2 = Owner.new({
  "animal" => animal3.id,
  "first_name" => "Kathleen",
  "second_name" => "Evans",
  "dob" => "1/09/1989",
  "address" => "153 Southview Ave, Clarkston",
  "city" => "Glasgow",
  "post_code" => "G76 8QE",
  "email_address" => "Kathy501@gmail.com",
  "phone_number" => "07979800602"
})

owner2.save

binding.pry
nil
