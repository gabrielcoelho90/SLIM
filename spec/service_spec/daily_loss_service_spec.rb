require 'rails_helper'

describe DailyLossCalculatorService do
  before(:each) do
    @calc = DailyLossCalculatorService.new()
  end

  describe '#daily_loss' do
    it 'shows the daily calories the user must burn' do
      @time_expectation = 21
      @kilos_to_lose = 3
      expect(@calc.call).to eq(1100)
    end
  end
end
