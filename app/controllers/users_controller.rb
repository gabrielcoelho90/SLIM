class UsersController < ApplicationController
  before_action :load_user

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: 'User was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

private

  def load_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :age, :weight, :height, :kilos_to_lose, :gender, :metric, :timeline)
  end
end
