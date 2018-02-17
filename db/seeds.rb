require_relative("../models/animal.rb")
require_relative("../models/owner.rb")
require("pry-byebug")

owner1 = Owner.new({
  "first_name" => "Roy"
  "second_name" => "Cuthbertson"
  "dob" => "27/02/1979"
  "address" => "41 Cadder Way, Bishopbriggs"
  "city" => "Glasgow"
  "post_code" => "G64 3JP"
  "email_address" => "oggieoggieoggieroyroyroy@gmail.com"
  "phone_number" => 07883654910
})

owner1 = Owner.new({
  "first_name" => "Kathleen"
  "second_name" => "Evans"
  "dob" => "1/09/1989"
  "address" => "153 Southview Ave, Clarkston"
  "city" => "Glasgow"
  "post_code" => "G76 8QE"
  "email_address" => "oggieoggieoggieroyroyroy@gmail.com"
  "phone_number" => 07979800602
})

animal1 =Animal.new({
  "name" => "Jasper"
  "age" => 9
  "species" => "Cat"
  "breed" => "Maine Coon"
  "adopt_status" => true
})

animal2 =Animal.new({
  "name" => "Angel"
  "age" => 2
  "species" => "Dog"
  "breed" => "Yorkshire Terrier"
  "adopt_status" => false
})

binding.pry
nil
