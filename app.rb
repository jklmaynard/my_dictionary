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
  "Hello world!"
end