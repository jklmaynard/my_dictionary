require('rspec')
require('dictionary')
require('word')
require('pg')
require('pry')

DB = PG.connect({ :dbname => 'dictionary_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec('DELETE FROM dictionaries *;')
    DB.exec("DELETE FROM words *;")
  end
end