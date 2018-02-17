require_relative( '../models/animal.rb' )

get "/adopt" do
  @animals = Animal.all()
  erb(:"/adoption/index")
end
