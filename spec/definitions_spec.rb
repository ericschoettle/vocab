require('rspec')
require('definitions')
require('pry')

describe('Definitions') do
  definition_spec_params = {"word" => "slither", "part_of_speech" => "verb", "in_a_sentence" => "The snake slithered across the path", "body" => "to go or walk with a sliding motion"}
  definition_spec_params2 = {"word" => "slither", ":part_of_speech" => "verb", "in_a_sentence" => "The box slithered down the chute", "body" => "to slide down or along a surface, especially unsteadily, from side to side, or with some friction or noise"}
  before() do
    Definitions.clear()
  end

  describe("#word") do
    it("returns the word associated with the definition") do
      test_definition = Definitions.new(definition_spec_params)
      expect(test_definition.word()).to(eq("slither"))
    end
  end

  describe("#part_of_speech") do
    it("returns the part of speech of the definition") do
      test_definition = Definitions.new(definition_spec_params)
      expect(test_definition.part_of_speech()).to(eq("verb"))
    end
  end

  describe("#in_a_sentence") do
    it("returns a sentence using the word in context") do
      test_definition = Definitions.new(definition_spec_params)
      expect(test_definition.in_a_sentence()).to(eq("The snake slithered across the path"))
    end
  end

  describe("#body") do
    it("returns the definition") do
      test_definition = Definitions.new(definition_spec_params)
      expect(test_definition.body()).to(eq("to go or walk with a sliding motion"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Definitions.all()).to(eq([]))
    end
  end

  describe("#id") do
    it "returns the id of the definition" do
      test_definition = Definitions.new(definition_spec_params)
      test_definition.save()
      expect(test_definition.id()).to(eq(1))
    end
  end

  describe("#attach_to_word") do
    it "creates a new word if the word doesn't yet exist" do
      test_definition = Definitions.new(definition_spec_params)
      test_definition.attach_to_word()
      expect(Words.find_by_word("slither").definitions).to(eq([test_definition]))
    end
    it "attaches the definition to a pre-existing word" do
      new_word = Words.new("slither")
      new_word.save()
      test_definition = Definitions.new(definition_spec_params)
      test_definition.attach_to_word()
      expect(new_word.definitions.include?(test_definition)).to(eq(TRUE))
    end
  end

  describe("#save") do
    it("adds a definition to the array of saved definitions") do
      test_definition = Definitions.new(definition_spec_params)
      test_definition.save()
      expect(Definitions.all()).to(eq([test_definition]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved definitions") do
      Definitions.new(definition_spec_params).save()
      Definitions.clear()
      expect(Definitions.all()).to(eq([]))
    end
  end

  describe('find_by_id') do
    it ('returns definition based on id #') do
      test_definition = Definitions.new(definition_spec_params)
      test_definition.save()
      test_definition2 = Definitions.new(definition_spec_params)
      test_definition2.save()
      expect(Definitions.find_by_id(test_definition.id())).to(eq(test_definition))
    end
  end
end
