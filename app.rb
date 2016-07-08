require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')

get('/') do
  @words = Word.all()
  erb(:index)
end

get('/words/new') do
  erb(:words_form)
end

post('/words') do
  Word.new(params.inject({}){|param,(k,v)| param[k.to_sym] = v; param}).save()
  @words = Word.all()
  erb(:success)
end

get('/words/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end
