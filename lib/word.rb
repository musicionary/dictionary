require('pry')
# require('definition')

class Word
  attr_reader(:word, :part_of_speech, :id, :definitions)

  @@words = []

  define_method(:initialize) do |attribute|
    @word = attribute.fetch(:word)
    @part_of_speech = attribute.fetch(:part_of_speech)
    @id = @@words.length().+(1)
    @definitions = []
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_method(:add_definition) do |definition|
    # definition.id = self.definitions.length() + 1
    @definitions.push(definition)
  end

  define_singleton_method(:all) do
    @@words
  end

  define_singleton_method(:clear) do
    @@words = []
  end

  define_singleton_method(:find) do |identification|
    found_word = nil
    @@words.each() do |word|
      if word.id().eql?(identification.to_i())
        found_word = word
      end
    end
    found_word
  end

end
