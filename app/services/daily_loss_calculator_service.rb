class DailyLossCalculatorService < ApplicationService
  def initialize(attr = {})
    @kilos_to_lose = attr[:kilos_to_lose]
    @metric = attr[:metric]
    @timeline = attr[:timeline]
  end

  def call
    time_expectation = convert_to_days(@metric, @timeline) unless @metric.nil?
    ((@kilos_to_lose * 7700) / time_expectation).round(2)
  end

  private

  def convert_to_days(metric, timeline)
    if metric == "days"
      timeline
    elsif metric == "weeks"
      timeline * 7
    else
      timeline * 30
    end
  end
end
