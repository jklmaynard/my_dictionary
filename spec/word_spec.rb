require('spec_buddy')

describe(Word) do 
  
  describe('#name') do
    it('returns the name of a word') do
      word1 = Word.new({ :name => "your mom", :definition => "Priscilla"  })  
      expect(word1.name()).to eq("your mom")
    end
  end
  
  describe('#definition') do
    it('returns the definition of a word') do
      word1 = Word.new({ :name => "your mom", :definition => "Priscilla"  })  
      expect(word1.definition()).to eq("Priscilla")
    end
  end
  
  describe('#save') do
    it("saves the word into an array") do
      word1 = Word.new({ :name => "your mom", :definition => "Priscilla"  })  
      word1.save()
      expect(Word.all()).to eq([word1])
    end
  end
  
  describe('#==') do
    it('is the same word if it has the same name and definition') do
      word1 = Word.new({ :name => "your mom", :definition => "Priscilla"  })
      word1.save()
      word2 = Word.new({ :name => "your mom", :definition => "Priscilla"  })
      word2.save()
      expect(word1).to eq(word2)
    end
  end
  
  describe('.all') do
    it('is empty at first') do
      expect(Word.all()).to (eq([]))
    end
  end 
end