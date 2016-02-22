require 'sinatra'
require 'slim'


configure :development do
  set :bind, '0.0.0.0'
  set :port, 3000
end

class AddressBook < Sinatra::Base

  get '/' do
    slim :home
  end

  get '/login' do
    slim :login
  end

  post '/login' do
    if params[:username] == settings.username && params[:password] == settings.password
      session[:admin] = true
      redirect to('/about')
    else
      slim :login
    end
  end

  get '/about'  do
    @title = "All About This Website"
     slim :about
  end

  not_found do
  	slim :not_found
  end





end
