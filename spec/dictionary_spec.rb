require('spec_buddy')

describe(Dictionary) do 
  
  describe('#name') do
    it('returns the name of a dictionary') do
      dictionary1 = Dictionary.new({ :name => "my dictionary", :id => nil })  
      expect(dictionary1.name()).to eq("my dictionary")
    end
  end
  
  describe('#id') do
    it('returns the id of a dictionary as an instance of a fixnum') do
      dictionary1 = Dictionary.new({ :name => "my dictionary", :id => nil })  
      dictionary1.save()
      expect(dictionary1.id()).to be_an_instance_of(Fixnum)
    end
  end
  
  describe('#save') do
    it("saves the dictionary into an array") do
      dictionary1 = Dictionary.new({ :name => "my dictionary", :id => nil })  
      dictionary1.save()
      expect(Dictionary.all()).to eq([dictionary1])
    end
  end
  
  describe('#==') do
    it('is the same dictionary if it has the same name') do
      dictionary1 = Dictionary.new({ :name => "my dictionary", :id => nil })
      dictionary1.save()
      dictionary2 = Dictionary.new({ :name => "my dictionary", :id => nil })
      dictionary2.save()
      expect(dictionary1).to eq(dictionary2)
    end
  end
  
  describe('#words') do
    it('returns an array of words for that particular dictionary') do
      dictionary1 = Dictionary.new({ :name => "my dictionary", :id => nil })
      dictionary1.save()
      word1 = Word.new({ :name => "Oxeneed", :definition => "Command to be quiet", :dictionary_id => dictionary1.id(), :id => nil })
      word1.save()
      word2 = Word.new({ :name => "apple", :definition => "a fruit", :dictionary_id => dictionary1.id(), :id => nil })
      word2.save()
      expect(dictionary1.words()).to eq([word1, word2])
    end
  end
  
  describe('#delete') do
    it('deletes a dictionary') do
      dictionary1 = Dictionary.new({ :name => "my dictionary", :id => nil })
      dictionary1.save()
      dictionary1.delete()
      expect(Dictionary.all()).to eq([])
    end
  end
  
  describe('.all') do
    it('is empty at first') do
    expect(Dictionary.all()).to (eq([]))
    end
  end 
  
  describe('.find') do
    it('finds an individual dictionary by id') do
      dictionary1 = Dictionary.new({ :name => "my dictionary", :id => nil })
      dictionary1.save()
      dictionary2 = Dictionary.new({ :name => "my other dictionary", :id => nil })
      dictionary2.save()
      expect(Dictionary.find(dictionary2.id())).to eq(dictionary2)
    end
  end
end