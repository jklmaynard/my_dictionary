require('rspec')
require('dictionary')
require('pry')

describe(Term) do
  before() do
    Term.clear()
  end

  describe("store") do
    it("stores word & definitions into their variable arrays") do
      test_term = Term.new()
      test_term.store("carrot", "a delicious vegetable")
      test_term.save()
      expect(Term.all()).to(eq([["carrot"], ["a delicious vegetable"]]))
    end
  end
  
#   describe("retrieve") do
#     it("retrieves a stored value by it's key") do
#       test_term = Term.new()
#       test_term.store("carrot", "a delicious vegetable")
#       expect(test_term.retrieve("carrot")).to(eq("a delicious vegetable"))
#     end
#   end

#     it("retrieves any stored value by its key") do
#       test_term = Term.new()
#       test_term.store("kitten", "cute")
#       expect(test_term.retrieve("kitten")).to(eq(["cute"]))
#     end
#   end

#   describe("add_def") do
#     it("pushes a second/third definition in the array of defs for a word") do
#       test_term = Term.new()
#       test_term.store("cat", "nasty")
#       test_term.add_def("cat", "smelly")
#       expect(test_term.retrieve("cat")).to(eq(["nasty", "smelly"]))
#     end
#   end

#   describe("post_word") do
#     it("displays the words you've added to the dictionary") do
#     test_term = Term.new()
#     test_term.store("kitten", "cute")
#     expect(test_term.post_word()).to(eq(["kitten"]))
#   end
# end

# describe("post_definition") do
#   it("displays the definition") do
#   test_term = Term.new()
#   test_term.store("kitten", "cute")
#   expect(test_term.post_definition()).to(eq(["cute"]))
#   end
# end

#   describe(".all") do
#     it("is empty at first") do
#       expect(Term.all()).to(eq([]))
#     end
#   end

end