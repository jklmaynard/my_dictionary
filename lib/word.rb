class Word
  attr_reader(:name, :definition)
  
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @definition = attributes.fetch(:definition)
  end
  
  define_method(:save) do
    result = DB.exec("INSERT INTO words (name, definition) VALUES ('#{@name}', '#{@definition}');")
  end
  
  define_method(:==) do |another_word|
    self.name() == another_word.name() && self.definition() == another_word.definition()
  end
  
  define_singleton_method(:all) do
    returned_words = DB.exec("SELECT * FROM words")
    words = []
    returned_words.each() do |word|
      name = word.fetch("name")
      definition = word.fetch("definition")
      words.push(Word.new({ :name => name, :definition => definition }))
    end
    words
  end
  
end