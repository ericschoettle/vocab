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

  define_singleton_method(:clear) do
    @@words = []
  end

  define_singleton_method(:find) do |ident|
    found_word = nil
    @@words.each() do |word|
      if word.id()==ident.to_i
        found_word = word
      end
    end
    found_word
  end
end
