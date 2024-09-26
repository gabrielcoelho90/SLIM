class BmiCalculatorService < ApplicationService
  def initialize(attr = {})
    @weight = attr[:weight]
    @height = attr[:height]
  end

  def call
    (@weight / (@height ** 2)).round(2)
  end
end
