require('rspec')
require('definition')

describe(Definition) do

  describe("#definition") do
    it("should return the definition") do
      test_def = Definition.new({:definition => "a straight line approached by a given curve as one of the variables in the equation of the curve approaches infinity"})
      expect(test_def.definition()).to(eq("a straight line approached by a given curve as one of the variables in the equation of the curve approaches infinity"))
    end
  end

end
