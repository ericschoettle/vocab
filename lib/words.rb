require('pry')

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
end
