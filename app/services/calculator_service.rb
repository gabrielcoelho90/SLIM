class CalculatorService
  def initialize(attributes = {})
    @weight = 90 #attributes[:weight]
    @height = 1.85 #attributes[:height]
    @age = 33 #attributes[:age]
    @kilos_to_lose = 3 #attributes[:kilos_to_lose]
    @gender = 'female' #attributes[:gender]
    @metric = 'Months' #attributes[:metric]
    @timeline = 3 #attributes[:timeline]
    @time_expectation = convert_to_days unless attributes[:metric] == 'Days'
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
    (@kilos_to_lose * 7700) / @time_expectation
  end

  def convert_to_days
    @metric == "Months" ? @timeline * 30 : @timeline * 7
  end
end
