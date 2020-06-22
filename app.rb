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
  #it will then find the instance of the model with that id number
  #and set it equal to an instance variable
  @model =Model.find(params[:id])
  erb :show
end

get '/models/:id/edit' do
  erb :edit
end

# the edit.erb view page will contain the form for editing
#a given instance of a model to update using the id from params
#it updates and saves the instance

#Also we need to update config.ru to use the sinatra middleware that lets
#our app send patch requests by:
#use Rack::MethodOverride
#run ApplicationController

end
