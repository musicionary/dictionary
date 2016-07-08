require('rspec')
require('word')
require('definition')

describe("Word") do
  before do
    Word.clear()
  end

  describe("#word") do
    it("should return name of the word") do
      test_word = Word.new({:word => "asymptote", :part_of_speech => "noun"})
      expect(test_word.word()).to(eq("asymptote"))
    end
  end

  describe("#part_of_speech") do
    it("should return the part of speech of the word") do
      test_word = Word.new({:word => "asymptote", :part_of_speech => "noun"})
      expect(test_word.part_of_speech()).to(eq("noun"))
    end
  end

  describe("#id") do
    it("should return the id of the word") do
      test_word = Word.new({:word => "asymptote", :part_of_speech => "noun"})
      expect(test_word.id()).to(eq(1))
    end
  end

  describe("#save") do
    it('should save the word to the array of words') do
      test_word = Word.new({:word => "asymptote", :part_of_speech => "noun"})
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe(".all") do
    it("should be empty at first") do
    expect(Word.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it('should empty out the array of words') do
      test_word = Word.new({:word => "asymptote", :part_of_speech => "noun"})
      test_word.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("should return a word by its id number") do
      test_word = Word.new({:word => "asymptote", :part_of_speech => "noun"})
      test_word.save()
      test_word2 = Word.new({:word => "asymptote", :part_of_speech => "noun"})
      test_word2.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end

  describe("#add_definition") do
    it("should add a definition to the definitions array") do
      test_word = Word.new({:word => "asymptote", :part_of_speech => "noun"})
      test_def = Definition.new({:definition => "a straight line approached by a given curve as one of the variables in the equation of the curve approaches infinity"})
      test_word.add_definition(test_def)
      expect(test_word.definitions()).to(eq([test_def]))
    end
  end
end
