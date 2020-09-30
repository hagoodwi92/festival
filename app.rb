require('sinatra')
require('sinatra/reloader')
require('./lib/artist')
require('pry')
also_reload('lib/**/*.rb')


get('/') do
  @stages = Stage.all
  erb(:stage)
end

# Post a new artist. After the artist is added, Sinatra will route to the view for the stage the artist belongs to.
post('/stages/:id/artists') do
  @stage = Stage.find(params[:id].to_i())
  artist = Artist.new(params[:artist_name], @stage.id, nil)
  artist.save()
  erb(:stage)
end

get('/stages/:id') do
  @stage = Stages.find(params[:id].to_i())
  erb(:stage)
end



