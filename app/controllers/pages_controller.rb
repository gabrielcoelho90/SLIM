class PagesController < ApplicationController
  def home
    @user = current_user
    redirect_to edit_user_path(@user) if @user.name.nil?
    result = Calculator.call(args)
    @bmi = result[:bmi]
    @bmi = Calculator.new(@user).bmi
    Calculator.call(@user)
    @bmr = Calculator.new(@user).bmr
  end


  def profile

  end


end
