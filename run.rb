require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/owners_controller')
require_relative('controllers/animals_controller')

get '/' do
  erb( :index )
end
