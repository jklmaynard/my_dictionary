require('spec_buddy')

describe(Definition) do
  
  describe('#definition') do
    it('returns the definition of the object') do
      definition1 = Definition.new({ :definition => "A definition", :word_id => 1 })
      expect(definition1.definition()).to eq("A definition")
    end
  end
  
  describe('#word_id') do
    it('retrieves the word id from the definition') do
      definition1 = Definition.new({ :definition => "A definition", :word_id => 1 })
      expect(definition1.word_id()).to eq(1)
    end
  end
  
  describe('#save') do
    it('saves a definition into an array') do
      definition1 = Definition.new({ :definition => "A definition", :word_id => 1 })
      definition1.save()
      expect(Definition.all()).to eq([definition1])
    end
  end
  
  describe('#==') do
    it('identifies when two definitions are the same') do
     definition1 = Definition.new({ :definition => "A definition", :word_id => 1 })
     definition2 = Definition.new({ :definition => "A definition", :word_id => 1 })
      expect(definition1).to eq(definition2)
    end
  end
  
  describe('.all') do
    it('is empty at first') do
      expect(Definition.all()).to eq([])
    end
  end
  
end