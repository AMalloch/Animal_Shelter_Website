require_relative('../models/animal.rb')
require_relative('../models/adoption.rb')
require_relative('../models/owner.rb')

get '/adopt' do
  @animals = Animal.all
  @adoptions = Adoption.all
  erb(:'/adoption/index')
end

get '/adopt/search' do
  @animals = Animal.search(params[:search_name])
  erb(:'adoption/search')
end

get '/assign' do
  @owners = Owner.all()
  @animals = Animal.all()
  erb(:"/assign/new")
end

post '/adopt/:id' do
  animal = Animal.new(params)
  animal.update
  redirect to '/adopt'
end
