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

post('/word') do
  @definition = Definitions.new(params)
  @definition.attach_to_word()
  @words = Words.all()
  @word = Words.find_by_word(params["word"])
  erb(:index)
end

get('/word/:word') do
  @word = Words.find_by_word(params["word"])
  @words = Words.all()
  erb(:word)
end

post('/definition') do
  definition = Definitions.new(params)
  definition.attach_to_word()
  @word = Words.find_by_word(params["word"])
  erb(:word)
end
