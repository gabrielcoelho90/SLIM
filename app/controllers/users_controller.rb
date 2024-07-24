class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path, notice: 'User was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :weight, :height, :kilos_to_lose, :gender, :timeline)
  end
end
