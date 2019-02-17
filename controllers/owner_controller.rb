require_relative('../models/owner.rb')

get '/all_owners' do
  @owners = Owner.all
  erb(:'/allowners/index')
end

get '/all_owners/new' do
  @owners = Owner.all
  erb(:'/allowners/new')
end

get '/all_owners/:id/edit' do
  @owner = Owner.find(params[:id])
  erb(:'/allowners/update')
end

post '/all_owners' do
  owner = Owner.new(params)
  owner.save
  redirect to '/all_owners'
end

post '/all_owners/:id' do
  owner = Owner.new(params)
  owner.update
  redirect to '/all_owners'
end

post '/all_owners/:id/delete' do
  owner = Owner.find(params[:id])
  owner.delete_by_id
  redirect to '/all_owners'
end
