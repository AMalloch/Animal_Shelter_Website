require_relative( '../models/animal.rb' )

get "/adopt" do
  @animals = Animals.all()
  erb(:"adoption/index")
end
