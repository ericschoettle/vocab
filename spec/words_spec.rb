require('rspec')
require('words')
require('definitions')
require('pry')

describe('Words') do
  before() do
    Words.clear()
  end

  describe("#word") do
    it("returns the word") do
      test_word = Words.new("slither")
      expect(test_word.word()).to(eq("slither"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Words.all()).to(eq([]))
    end
  end

  describe("#id") do
    it "returns the id of the word" do
      test_word = Words.new("slither")
      test_word.save()
      expect(test_word.id()).to(eq(1))
    end
  end

  describe("#save") do
    it("adds a word to the array of saved words") do
      Words.new("slither").save()
      expect(Words.all()).to(eq([test_word]))
    end
  end

  describe("#add_definition") do
    it "adds a definition to the word" do
      test_word = Words.new("slither").save()
      test_definition = Definitions.new({"word" => "slither", "part_of_speech" => "verb", "in_a_sentence" => "The snake slithered across the path", "body" => "to go or walk with a sliding motion"}).save()
      test_word.add_definition(test_definition)
      expect(test_word.definitions()).to(eq([test_definition]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved words") do
      Words.new("slither").save()
      Words.clear()
      expect(Words.all()).to(eq([]))
    end
  end

  describe('find') do
    it ('returns word based on id #') do
      test_word = Words.new("slither")
      test_word.save()
      test_word2 = Words.new("slather")
      test_word2.save()
      expect(Words.find(test_word.id())).to(eq(test_word))
    end
  end
end
