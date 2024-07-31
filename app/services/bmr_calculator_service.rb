class BmrCalculatorService < ApplicationService
  def initialize(attr = {})
    @weight = attr[:weight]
    @height = attr[:height]
    @age = attr[:age]
    @gender = attr[:gender]
  end

  def call
    if @gender == 'male'
      (88.362 + (13.397 * @weight) + (4.799 * @height) - (5.677 * @age)).round(2)
    else
      (447.593 + (9.247 * @weight) + (3.098 * @height) - (4.330 * @age)).round(2)
    end
  end
end
