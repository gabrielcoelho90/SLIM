require 'rails_helper'

describe BmiCalculatorService do
  describe "#call" do
    it "returns the BMI" do
      user = create(:user)
      @calc = BmiCalculatorService.call(user)
      expect(@calc).to eq(35.06)
    end
  end
end
