class MealsController < ApplicationController
  before_action :set_user

  def index
    @daily_user_meals = Meal.meals_of_the_day(@user)
  end

  def new
    @meal = Meal.new
    meal_item = @meal.meal_items.build
    meal_item.build_item
  end

  def edit
    @meal = Meal.find(params[:id])
    render :new
  end

  def create
    @meal = @user.meals.build(meal_params)
    if @meal.save
      redirect_to user_meals_path(@user, @meal), notice: 'Meal was successfully created.'
    else
      render :new
    end
  end

  def update
    @meal = Meal.find(params[:id])
    if @meal.update(meal_params)
      redirect_to user_meals_path, notice: 'Meal was successfully updated.'
    else
      render :edit
    end
  end

  def destroy

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
        :id,
        :qty,
        :measure_unit,
        :_destroy,
        item_attributes: [:id, :name, :calories, :protein, :carbs, :fat]
      ]
    )
  end
end
