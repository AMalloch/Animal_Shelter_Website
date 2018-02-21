require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/adoption_controller')
require_relative('controllers/incare_controller')
require_relative('models/owner.rb')
require_relative('models/animal.rb')

get '/' do
  erb(:index )
end

get "/all_animals" do
  @animals = Animal.all()
  erb(:"/allanimals/index")
end

get "/all_owners" do
  @owners = Owner.all()
  erb(:"/allowners/index")
end

get "/all_animals/new" do
  @animals = Animal.all()
  erb(:"/allanimals/new")
end

get "/all_owners/new" do
  @owners = Owner.all()
  erb(:"/allowners/new")
end

post "/all_animals" do
  animal = Animal.new(params)
  animal.save
  redirect to ("/all_animals")
end

post "/all_owners" do
  owner = Owner.new(params)
  owner.save
  redirect to ("/all_owners")
end

post "/all_animals/:id/delete" do
  animal = Animal.find(params[:id])
  animal.delete_by_id
  redirect to ("/")
end

post "/all_owners/:id/delete" do
  owner = Owner.find(params[:id])
  owner.delete_by_id
  redirect to ("/")
end

get "/assign" do
  @owners = Owner.all()
  @animals = Animal.all()
  erb(:"/assign/new")
end

post "/assign" do
  adoption = Adoption.new(params)
  adoption.save()
  redirect to ("/")
end

post "/all_animals/:id/update" do
  animal = Animal.new(params)
  animal.update()
  redirect to ("/")
end
