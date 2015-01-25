require('sinatra')
require('sinatra/reloader')
require('pry')
also_reload('lib/**/*.rb')
require('./lib/dictionary')
require('./lib/word')
require('pg')

configure :development do
  set :bind, '0.0.0.0'
  set :port, 3000
end

DB = PG.connect({ :dbname => "dictionary" })

get("/") do
  @dictionaries = Dictionary.all()
  erb(:index)
end

post("/dictionaries") do 
  dictionary_name = params.fetch("dictionary_name")
  dictionary = Dictionary.new({ :name => dictionary_name, :id => nil })
  dictionary.save()
  @dictionaries = Dictionary.all()
  erb(:index)
end

get("/dictionaries/:id") do
  @dictionary = Dictionary.find(params.fetch("id").to_i())
  erb(:dictionary)
end