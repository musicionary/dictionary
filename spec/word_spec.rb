require('rspec')
require('word')

describe("Word") do
  before do
    Word.clear()
  end

  describe("#word") do
    it("should return name of the word") do
      test_word = Word.new({:word => "asymptote"})
      expect(test_word.word()).to(eq("asymptote"))
    end
  end

  describe("#id") do
    it("should return the id of the word") do
      test_word = Word.new({:word => "asymptote"})
      expect(test_word.id()).to(eq(1))
    end
  end

  describe("#save") do
    it('should save the word to the array of words') do
      test_word = Word.new({:word => "asymptote"})
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
      test_word = Word.new({:word => "asymptote"})
      test_word.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".find") do
  it("returns a word by its id number") do
    test_word = Word.new({:word => "asymptote"})
    test_word.save()
    test_word2 = Word.new({:word => "asymptote"})
    test_word2.save()
    expect(Word.find(test_word.id())).to(eq(test_word))
  end
end
end
