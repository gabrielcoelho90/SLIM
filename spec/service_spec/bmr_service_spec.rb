require 'rails_helper'

describe BmrCalculatorService do
  before do
    @user = create(:user)
    @calc = BmrCalculatorService.call(@user)
  end

  describe "#bmr" do
    it 'returns MALE BMR calculator' do
      expect(@calc).to eq(1517.54)
    end

    it 'returns FEMALE BMR calculator' do
      @user.gender = 'female'
      expect(@calc).to_not eq(1142.66)
    end
  end
end
