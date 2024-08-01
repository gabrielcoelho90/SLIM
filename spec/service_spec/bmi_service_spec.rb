require 'rails_helper'

describe BmiCalculatorService do
  before(:each) do
    @calc = BmiCalculatorService.new()
  end

  describe "#call" do
    it "returns the BMI" do
      @weight = 90.0
      @height = 1.85
      expect(@calc.call).to eq(26.3)
    end
  end
end
