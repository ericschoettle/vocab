require('pry')

class Definitions
  @@definitions = []
  attr_accessor(:word, :part_of_speech, :in_a_sentence, :body)
  attr_reader(:id)

  define_method(:initialize) do |params|
    @word = params["word"]
    @part_of_speech = params["part_of_speech"]
    @in_a_sentence = params["in_a_sentence"]
    @body = params["body"]
    @id = @@definitions.length() + 1
  end

  define_singleton_method(:all) do
    @@definitions
  end

  define_method(:save) do
    @@definitions.push(self)
  end

  define_singleton_method(:clear) do
    @@definitions = []
  end

  define_method(:attach_to_word) do
    if Words.find_by_word(@word)
      Words.find_by_word(@word).add_definition(self)
    else
      new_word = Words.new(@word)
      new_word.save()
      new_word.add_definition(self)
    end
  end

  define_singleton_method(:find_by_id) do |ident|
    found_definition = nil
    @@definitions.each() do |definition|
      if definition.id()==ident.to_i
        found_definition = definition
      end
    end
    found_definition
  end
end
