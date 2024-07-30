class CalculatorService < ApplicationService
  def initialize(attr = {})
    @weight = attr[:weight]
    @height = attr[:height]
    @age = attr[:age]
    @kilos_to_lose = attr[:kilos_to_lose]
    @gender = attr[:gender]
    @metric = attr[:metric]
    @timeline = attr[:timeline]
    @time_expectation = convert_to_days unless attr[:metric].nil?
  end

  def call
    bmi = calc_bmi
    bmr = calc_bmr
    daily_loss = calc_daily_loss
    {bmi:, bmr:, daily_loss:}
  end


  private

  def calc_bmi
    (@weight / (@height * @height)).round(2)
  end

  def calc_bmr
    if @gender == 'male'
      (88.362 + (13.397 * @weight) + (4.799 * @height) - (5.677 * @age)).round(2)
    else
      (447.593 + (9.247 * @weight) + (3.098 * @height) - (4.330 * @age)).round(2)
    end
  end

  def calc_daily_loss
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
