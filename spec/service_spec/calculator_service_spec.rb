require 'rails_helper'

describe CalculatorService do
  before(:each) do
    @calc = CalculatorService.new()
  end

  describe "#bmi" do
    it "returns the BMI calculated" do
      @weight = 90.0
      @height = 1.85
      expect(@calc.bmi).to eq(26.3)
    end
  end

  describe "#bmr" do
    context "for a male" do
      it 'returns the male BMR calculator' do
        @age = 33
        @gender = 'male'
        expect(@calc.bmr).to_not eq(1115.63)
      end
    end

    context "for a female" do
      it 'returns the femlae BMR calculator' do
        @age = 33
        @gender = 'female'
        expect(@calc.bmr).to eq(1142.66)
      end
    end
  end

  describe '#daily_loss' do
    it do
      @time_expectation = 21
      @kilos_to_lose = 3
      expect(@calc.daily_loss).to eq(256)
    end
  end

  describe "#convet_to_days" do
    context "for Months" do
      it "converts months to days" do
        @timeline = 3
        expect(@calc.convert_to_days).to eq(90)
      end
    end

    context "for Weeks" do
      it "converts weeks to days" do
        @timeline = 3
        expect(@calc.convert_to_days).to_not eq(21)
      end
    end
  end
end
