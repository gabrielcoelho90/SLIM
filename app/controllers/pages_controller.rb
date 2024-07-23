class PagesController < ApplicationController
  def home
  end

  def info
    @user_age = params[:age].to_i
    @user_weight = params[:peso].to_f
    @user_height = params[:altura].to_f
    @user_gender = params[:gender]
    @metric = params[:metric]
    @time = params[:time].to_i
    @time = day_convert(@metric, @time) unless @metric == "Days"
    @kilos = params[:kilos].to_f
    @calories_per_day = deficit(@kilos, @time).round(2)
    @bmi = bmi(@user_weight, @user_height).round(2)
    @bmr = baseline_calories(@user_gender, @user_height, @user_weight, @user_age).round(2)
  end

  def bmi(weight, height)
    weight / (height * height)
  end

  def baseline_calories(gender, height, weight, age)
    if gender == 'male'
      88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age)
    else
      447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age)
    end
  end

  # calories per day I need to lose
  def deficit(kilos, time)
    (kilos * 7700) / time
  end

  # convert to days
  def day_convert(metric, time)
    metric == "Months" ? time * 30 : time * 7
  end
end
