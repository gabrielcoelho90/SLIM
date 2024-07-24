class PagesController < ApplicationController
  def home
    @user = current_user
    redirect_to edit_user_path(@user) if @user.name.nil?
  end

  def profile

  end


end
