require('pry')
require "rest-client"

class Words
  @@words = []
  attr_accessor(:word, :images, :definitions)
  attr_reader(:id)

  define_method(:initialize) do |word|
    @word = word
    @images = []
    @definitions = []
    @id = @@words.length() + 1
  end

  define_singleton_method(:all) do
    @@words
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_method(:add_definition) do |definition|
    @definitions.push(definition)
  end

  define_method(:add_image) do |image|
    @images.push(image)
  end

  # define_singleton_method(:search_and_add) do |definition|
  #   if definition.word
  #
  #   end
  # end

  define_singleton_method(:clear) do
    @@words = []
  end

  define_singleton_method(:find_by_word) do |word|
    found_word = nil
    @@words.each() do |test_word|
      if test_word.word() == word
        found_word = test_word
      end
    end
    found_word
  end

  define_method(:dictionary) do
    url = "http://www.dictionaryapi.com/api/v1/references/collegiate/xml/" + word + "?key=dc368593-f759-4a0f-b8da-2e87f78e0fed"
    response = RestClient.get(url).body
    part_of_speech = /<fl>(.*?)<\/fl>/.match(response)[1]
    body = /<dt>:(.*?)<\/dt>/.match(response)[1]
    body = /.+?(?=[^A-Za-z0-9\s])/.match(body)[1]
    Definition.new({"word" => self, "part_of_speech" => part_of_speech, "in_a_sentence" => "", "body" => body})
    definition.save()
  end
end
