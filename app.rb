require_relative 'config/environment'

class App < Sinatra::Base

get '/models/new' do
  erb :new
end

end
