class Term
  @@terms = []
  
  define_singleton_method(:all) do
    @@terms
  end
  
  define_method(:initialize) do
    @words = []
    @definitions = []
  end

  define_method(:word) do
    @words
  end
  
  define_method(:save) do
    @@terms.push(self)
  end
  
  define_singleton_method(:clear) do
    @@terms = []
  end
  
  define_method(:store) do |word, definition|
    @words.push(word)
    @definitions.push(definition)


#   define_method(:store) do |word, definition|
#     @words.push(word)
#     @definitions_inner.push(definition)
#     @definitions.push(@definitions_inner)
#   end


#   define_method(:retrieve) do |word|
#     @words.each_with_index() do |key, num|
#       if key == word
#         return @definitions[num]
#       end
#     end
#   end

#   define_method(:add_def) do |word, definition_extra|
#     @words.each_with_index() do |key, num|
#       if key == word
#         @definitions_inner.push(definition_extra)
#       end
#     end
#   end

#   # define_method(:post_word) do
#   #   @words.join()
#   # end

#   define_singleton_method(:post_word) do |word|
#     found_word = nil
#     @@terms.each() do |word|
#       if word.
#       found_word = word
#     end
#   end

#   # define_method(:post_definition) do
#   #   @definitions_inner.join()
#   # end

#   define_method(:post_definition) do |definition|
#     found_definition = nil
#     @@terms.each() do |definition|
#       found_definition = definition
#     end
#   end

#   define_singleton_method(:all) do
#     @@terms
#   end



end
end

