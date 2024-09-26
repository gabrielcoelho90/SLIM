require 'rails_helper'

describe DailyLossCalculatorService do
  before do
    user = create(:user)
    @calc = DailyLossCalculatorService.call(user)
  end

  describe '#daily_loss' do
    it 'shows the daily calories the user must burn' do
      expect(@calc).to eq(1100)
    end
  end
end
