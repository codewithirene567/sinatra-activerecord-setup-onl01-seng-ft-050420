require_relative 'config/environment'

class App < Sinatra::Base

get '/models/new' do
  erb :new
end

post '/models' do
  #extract the form data from the params and uses it to create a new instance
  Model.create(some_attribute: params[:some_attribute])
end

get 'models' do
  #load up all of the instances and set them equal to an instance variable
  @models = Model.all
  erb :index
end
end
