require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')

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

get('/words/:id/definitions/new') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:definitions_form)
end

post('/words/:id') do
  @word = Word.find(params.fetch('id').to_i())
  new_definition = Definition.new(params.inject({}){|param,(k,v)| param[k.to_sym] = v; param})
  @word.add_definition(new_definition)
  erb(:success)
end
