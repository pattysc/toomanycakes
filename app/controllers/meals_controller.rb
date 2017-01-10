class MealsController < ApplicationController

  def show
    # @user = User.find(session[:user_id])
    @user = User.all.first
    @meal = Meal.find(params[:id])
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.cook_id = User.first.id

    if @meal.save
      make_portions(@meal, params[:meal][:number])
      redirect_to meal_path(@meal)
    else
      redirect_to new_meal_path
    end
  end

  def new
    @meal = Meal.new
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :description, :expiration, :img_url, :cook_id)
  end

  def make_portions(meal, num)
    num.to_i.times do
      Portion.create(meal_id: meal.id)
    end
  end

end
