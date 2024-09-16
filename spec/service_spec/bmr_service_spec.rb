require 'rails_helper'

describe BmrCalculatorService do
  before(:each) do
    @calc = BmrCalculatorService.new()
  end

  describe "#bmr" do
    context "for a male" do
      it 'returns the male BMR calculator' do
        @weight = 90
        @height = 1.85
        @age = 33
        @gender = 'male'
        expect(@calc.call).to eq(1115.63)
      end
    end

    context "for a female" do
      it 'returns the female BMR calculator' do
        @age = 33
        @gender = 'female'
        expect(@calc.call).to_not eq(1142.66)
      end
    end
  end
end
