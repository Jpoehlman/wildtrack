require 'sinatra'
require 'slim'
#require "sass"



class AddressBook < Sinatra::Base

 #get('/styles.css') {css :styles }


  get '/' do
    slim :home
  end
end
