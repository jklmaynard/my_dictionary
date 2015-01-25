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

  define_method(:words) do 
    dictionary_words = []
    words = DB.exec("SELECT * FROM words WHERE dictionary_id = #{self.id()};")
    words.each() do |word|
      name = word.fetch("name")
      definition = word.fetch("definition")
      dictionary_id = word.fetch("dictionary_id").to_i()
      dictionary_words.push(Word.new({ :name => name, :definition => definition, :dictionary_id => dictionary_id}))
    end
  dictionary_words
  end

  define_method(:delete) do
    DB.exec("DELETE FROM dictionaries WHERE id = #{self.id()};")
    DB.exec("DELETE FROM words WHERE dictionary_id = #{self.id()};")
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
  
  define_singleton_method(:find) do |id|
    found_dictionary = nil
    Dictionary.all().each() do |dictionary|
      if dictionary.id().==(id)
        found_dictionary = dictionary
        end
    end
      found_dictionary
  end
end