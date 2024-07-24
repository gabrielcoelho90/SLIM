class PagesController < ApplicationController
  def home
    @user = current_user
    render 'users/edit' if @user.weight.nil?
  end

  def profile

  end


end
