class MealsController < ApplicationController
  before_action :authorize_user

  def show
    # @user = User.find(session[:user_id])
    @user = current_user
    @meal = Meal.find(params[:id])
    @cook = @meal.get_cook
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.cook_id = current_user.id

    if @meal.save
      @meal.make_portions(params[:meal][:number])
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

end
