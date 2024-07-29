class PagesController < ApplicationController
  def home
    @user = current_user
    redirect_to edit_user_path(@user) if @user.name.nil?
    @bmi =CalculatorService.new(@user).bmi
    @bmr =CalculatorService.new(@user).bmr
  end

  def profile

  end
end
