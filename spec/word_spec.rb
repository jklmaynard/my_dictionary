require('spec_buddy')

describe(Word) do 
  
  describe('#name') do
    it('returns the name of a word') do
      word1 = Word.new({ :name => "your mom", :definition => "Priscilla", :dictionary_id => 1  })  
      expect(word1.name()).to eq("your mom")
    end
  end
  
  describe('#definition') do
    it('returns the definition of a word') do
      word1 = Word.new({ :name => "your mom", :definition => "Priscilla", :dictionary_id => 1  })  
      expect(word1.definition()).to eq("Priscilla")
    end
  end
  
  describe('#save') do
    it("saves the word into an array") do
      word1 = Word.new({ :name => "your mom", :definition => "Priscilla", :dictionary_id => 1  })  
      word1.save()
      expect(Word.all()).to eq([word1])
    end
  end
  
  describe('#==') do
    it('is the same word if it has the same name and definition') do
      word1 = Word.new({ :name => "your mom", :definition => "Priscilla", :dictionary_id => 1  })
      word1.save()
      word2 = Word.new({ :name => "your mom", :definition => "Priscilla", :dictionary_id => 1  })
      word2.save()
      expect(word1).to eq(word2)
    end
  end
  
  describe('#dictionary_id') do
    it('lets you get the dictionary id from the word') do
      word1 = Word.new({ :name => "apple", :definition => "a fruit", :dictionary_id => 1})
      expect(word1.dictionary_id()).to eq(1)
    end
  end
  
  describe('.all') do
    it('is empty at first') do
      expect(Word.all()).to (eq([]))
    end
  end 
end