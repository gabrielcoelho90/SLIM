class CalculatorService
  def initialize(attributes = {})
    @weight = attributes[:weight]
    @height = attributes[:height]
    @age = attributes[:age]
    @gender = attributes[:gender]
    @timeline = attributes[:timeline]
  end

  def bmi
    (@weight / (@height * @height)).round(2)
  end

  def bmr
    if @gender == 'male'
      (88.362 + (13.397 * @weight) + (4.799 * @height) - (5.677 * @age)).round(2)
    else
      (447.593 + (9.247 * @weight) + (3.098 * @height) - (4.330 * @age)).round(2)
    end
  end

  def daily_loss
    timeline = convert_to_days(metric, @timeline) unless metric == "Days"
    (kilos_to_lose * 7700) / timeline
  end

  def convert_to_days(metric, timeline)
    metric == "Months" ? @timeline * 30 : @timeline * 7
  end
end
