require_relative( '../models/animal.rb' )

get "/adopt" do
  @animals = Animal.all()
  erb(:"/adoption/index")
end

get "/adopt/search" do
  @animals = Animal.search(params[:search_name])
  erb(:"adoption/search")
end
