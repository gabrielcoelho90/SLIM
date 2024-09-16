class MealsController < ApplicationController
  before_action :set_user

  def new
    @meal = Meal.new
    meal_item = @meal.meal_items.build
    meal_item.build_item
  end

  def create
    raise
    @meal = @user.meals.build(meal_params)
    if @meal.save
      redirect_to user_meal_path(@user, @meal), notice: 'Meal was successfully created.'
    else
      render :new
    end
  end

  def get_food_options
    parameters = params[:name]
    response = GetFoodInfoService.call(parameters)
    render json: response
  end

  private

  def set_user
    @user = current_user
  end

  def set_meal
    @meal = @user.meals.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(
      :date,
      :meal_type,
      :_destroy,
      meal_items_attributes: [
        :qty,
        :measure_unit,
        :_destroy,
        item_attributes: [:name, :calories, :protein, :carbs, :fat]
      ]
    )
  end
end
