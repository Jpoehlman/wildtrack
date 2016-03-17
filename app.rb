## Gems
require 'sinatra'
#require 'sinatra/reloader'
require 'slim'
require './soundtrack'
## Configure

configure :development do
  DataMapper.setup(:default, "sqlite3://#{ Dir.pwd}/development.db")
  #DataMapper.auto_upgrade!
end

configure :production do
  DataMapper.setup(:default, ENV['DATABASE_URL'])
end

configure :development do
  set :bind, '0.0.0.0'
  set :port, 3000
end

## Helpers
helpers do
  def current?(path='/')
     (request.path==path || request.path==path+'/') ? "current" : nil
  end
end


## Routes
  get '/' do
    slim :home
  end

  get '/about'  do
     slim :about
  end

  get '/test'  do
     slim :test
  end

  not_found do
  	slim :not_found
  end

  post '/login' do
    if params[:username] == settings.username && params[:password] == settings.password
      session[:admin] = true
      redirect to('/about')
    else
      slim :login
    end
  end


