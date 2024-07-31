class DailyLossCalculatorService < ApplicationService
  def initialize(attr = {})
    @kilos_to_lose = attr[:kilos_to_lose]
    @metric = attr[:metric]
    @timeline = attr[:timeline]
    @time_expectation = convert_to_days unless attr[:metric].nil?
  end

  def call
    daily_loss
  end

  private

  def daily_loss
    ((@kilos_to_lose * 7700) / @time_expectation).round(2)
  end

  def convert_to_days
    if @metric == "days"
      @timeline
    elsif @metric == "weeks"
      @timeline * 7
    else
      @timeline * 30
    end
  end
end
