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

get '/models/:id' do
  #for instance if a user types www.website.com models/2 then
  #it will get the id number 2 from paramas
end
