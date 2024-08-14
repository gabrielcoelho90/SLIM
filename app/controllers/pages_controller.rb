class PagesController < ApplicationController
  def home
    @user = current_user
    if @user.name.nil?
      redirect_to edit_user_path(@user)
    else
      @bmi = BmiCalculatorService.call(@user)
      @bmr = BmrCalculatorService.call(@user)
      @daily_loss = DailyLossCalculatorService.call(@user)
    end
  end

  def profile
  end
end
