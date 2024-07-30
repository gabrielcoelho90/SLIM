class PagesController < ApplicationController
  def home
    @user = current_user
    if @user.name.nil?
      redirect_to edit_user_path(@user)
    else
      results = CalculatorService.call(@user)
      @bmi = results[:bmi]
      @bmr = results[:bmr]
      @cal_per_day = results[:daily_loss]
    end
  end

  def profile

  end
end
