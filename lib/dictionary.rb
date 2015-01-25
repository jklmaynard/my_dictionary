class Dictionary
  attr_reader(:name, :id)
  
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end
  
  define_method(:save) do
    result = DB.exec("INSERT INTO DICTIONARIES (name) VALUES ('#{@name}') RETURNING id")
    @id = result.first().fetch("id").to_i()
  end
  
  define_method(:==) do |another_dictionary|
    self.name() == another_dictionary.name()
  end
  
  define_singleton_method(:all) do
    returned_dictionaries = DB.exec("SELECT * FROM dictionaries;")
    dictionaries = []
    returned_dictionaries.each() do |dictionary|
      name = dictionary.fetch("name")
      id = dictionary.fetch("id").to_i()
      dictionaries.push(Dictionary.new({ :name => name, :id => id }))
    end
    dictionaries
  end    
end