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

#<form action="/models/<%= @model.id %>" method="post">
    #<input id="hidden" type="hidden" name="_method" value="patch">
    #<input type="text" ...>
#</form

#the method override mdidleware will
#intercept ever request send and received by the app#if it finds a request
#with the name="_method" then it will set the request type
#based on what is set in the value attribute which in this case is patch

#delete is implemented via a delete button which is actually a form
#form should send delete request to delete '/models/:id' and should only
#contain a submit button with a value of delete like this:
#<form method="post" action="/models/<%= @model.id %>">
  #<input id="hidden" type="hidden" name="_method" value="DELETE">
  #<input type="submit" value="delete">
#</form>
end
