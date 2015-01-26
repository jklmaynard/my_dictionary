class Definition 
  
  attr_reader(:definition, :word_id)
  
  define_method(:initialize) do |attributes|
    @definition = attributes.fetch(:definition)
    @word_id = attributes.fetch(:word_id)
  end
  
  define_method(:save) do
    DB.exec("INSERT INTO definitions (definition, word_id) VALUES ('#{@definition}', #{@word_id});")
  end
  
  define_method(:==) do |another_definition|
    self.definition() == another_definition.definition() && self.word_id() == another_definition.word_id()
  end
  
  define_singleton_method(:all) do
    returned_definitions = DB.exec("SELECT * FROM definitions;")
    definitions = []
    returned_definitions.each() do |definition|
      found_definition = definition.fetch("definition")
      word_id = definition.fetch("word_id").to_i()
      definitions.push(Definition.new({ :definition => found_definition, :word_id => word_id }))
    end
    definitions
  end
  
end