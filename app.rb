require('sinatra')
require('sinatra/reloader')
require('./lib/festival')
require('pry')
also_reload('lib/**/*.rb')

get('/alb') do
  erb(:festival)
end