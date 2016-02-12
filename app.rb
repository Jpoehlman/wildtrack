require 'sinatra'
require 'slim'

=begin
configure :development do
  set :bind, '0.0.0.0'
  set :port, 3000
end
=end



class AddressBook < Sinatra::Base
  get '/' do
    slim :home
  end
end
