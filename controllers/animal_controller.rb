require_relative('../models/animal.rb')

get '/all_animals' do
  @animals = Animal.all
  erb(:'/allanimals/index')
end

get '/all_animals/new' do
  @animals = Animal.all
  erb(:'/allanimals/new')
end

get '/all_animals/:id/edit' do
  @animals = Animal.find(params[:id])
  erb(:'/allanimals/update')
end

get '/incare' do
  @animals = Animal.all
  erb(:'/incare/index')
end

post '/all_animals/:id' do
  animal = Animal.new(params)
  animal.update
  redirect to '/all_animals'
end

post '/all_animals' do
  animal = Animal.new(params)
  animal.save
  redirect to '/all_animals'
end

post '/all_animals/:id/delete' do
  animal = Animal.find(params[:id])
  animal.delete_by_id
  redirect to '/all_animals'
end

post '/all_animals/update/:id' do
  animal = Animal.new(params)
  animal.update
  redirect to '/'
end
