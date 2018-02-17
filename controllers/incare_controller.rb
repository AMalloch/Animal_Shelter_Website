require_relative( '../models/animal.rb' )

get "/incare" do
  @animals = Animal.all()
  erb(:"/incare/index")
end
