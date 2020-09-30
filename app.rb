require('sinatra')
require('sinatra/reloader')
require('./lib/artist')
require('pry')
also_reload('lib/**/*.rb')

# "This will be our home page. '/' is always the root route in a Sinatra application."
get('/') do
  @stages = Stage.all
  erb(:stage)
end
# "This route will show a list of all stages."
get('/stages') do
  @stages = Stage.all
  erb(:stage)
end

# "This will take us to a page with a form for adding a new stage."
get('/stages/new') do
  erb(:new_stage)
end
#lesson 19
post('/stages') do
  binding.pry
end

post('/stages') do
  name = params[:stage_name]
  stage = Stage.new(name, nil)
  stage.save()
end

post('/stages') do
  name = params[:stage_name]
  stage = Stage.new(name, nil)
  stage.save()
  @stages = Stage.all()
  erb(:stage)
end

# get('/albums/:id') do
#   "This route will show a specific album based on its ID. The value of ID here is #{params[:id]}."
# end

# get('/albums/:id/edit') do
#   "This will take us to a page with a form for updating an album with an ID of #{params[:id]}."
# end

# # Post a new artist. After the artist is added, Sinatra will route to the view for the stage the artist belongs to.
# post('/stages/:id/artists') do
#   @stage = Stage.find(params[:id].to_i())
#   artist = Artist.new(params[:artist_name], @stage.id, nil)
#   artist.save()
#   erb(:stage)
# end

# get('/stages/:id') do
#   @stage = Stages.find(params[:id].to_i())
#   erb(:stage)
# end


# post('/stages') do
#   name = params[:stage_name]
#   stage = Stage.new(name, nil)
#   stage.save()
#   @stage = Stage.all() # Adding this line will fix the error.
#   erb(:stage)
# end

