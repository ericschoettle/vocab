require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('capybara')
require('pry')
require('./lib/words')
require('./lib/definitions')

get('/') do
  @words = Words.all()
  erb(:index)
end
