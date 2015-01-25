class Word
  attr_reader(:name, :definition, :dictionary_id)
  
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @definition = attributes.fetch(:definition)
    @dictionary_id = attributes.fetch(:dictionary_id)
  end
  
  define_method(:save) do
    result = DB.exec("INSERT INTO words (name, definition, dictionary_id) VALUES ('#{@name}', '#{@definition}', #{@dictionary_id});")
  end
  
  define_method(:==) do |another_word|
    self.name() == another_word.name() && self.definition() == another_word.definition() && self.dictionary_id == another_word.dictionary_id()
  end
  
  define_singleton_method(:all) do
    returned_words = DB.exec("SELECT * FROM words")
    words = []
    returned_words.each() do |word|
      name = word.fetch("name")
      definition = word.fetch("definition")
      dictionary_id = word.fetch("dictionary_id").to_i()
      words.push(Word.new({ :name => name, :definition => definition, :dictionary_id => dictionary_id}))
    end
    words
  end
  
end