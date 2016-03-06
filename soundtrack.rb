require 'dm-core'
require 'dm-migrations'

class Soundtrack
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :songt, String
  property :artist, String
  property :descrip, Text
end

DataMapper.finalize
#DataMapper.auto_upgrade!



get '/soundtrack' do
  @soundtrack = Soundtrack.all
  slim :soundtrack
end

get '/soundtrack/new' do
  @soundtrack = Soundtrack.new
  slim :new_soundtrack
end

get '/soundtrack/:id' do
  @soundtrack = Soundtrack.get(params[:id])
  slim :show_soundtrack
end

get '/soundtrack/:id/edit' do
  @soundtrack = Soundtrack.get(params[:id])
  slim :edit_soundtrack
end

post '/soundtrack' do
  @soundtrack = Soundtrack.create(params[:soundtrack])
  redirect to("/soundtrack/#{@soundtrack.id}")
end

put '/soundtrack/:id' do
    soundtrack = Soundtrack.get(params[:id])
    soundtrack.update(params[:soundtrack])
    redirect to("/soundtrack/#{soundtrack.id}")
end


delete '/soundtrack/:id' do
    Soundtrack.get(params[:id]).destroy
  redirect to('/soundtrack')
end