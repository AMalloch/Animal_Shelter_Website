require_relative( '../models/animal.rb' )

get "/adopt" do
  @animals = Animal.all()
  erb(:"/adoption/index")
end

get "/adopt/search" do                    #perform a paginated query
  @animals = Animal.search(params[:search_name])
  erb(:"adoption/search") #this is our form
end
# 
# get "/adopt/details" do
#   @animals = Animal.


# def index
#   @users = User.search(params[:search]).paginate(page: params[:page])
# end
