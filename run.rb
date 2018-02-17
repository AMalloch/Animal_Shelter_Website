require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/adoption_controller')
require_relative('controllers/incare_controller')

get '/' do
  erb( :index )
end
