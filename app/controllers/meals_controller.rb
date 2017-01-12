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
      flash[:notice] = @meal.errors.full_messages
      redirect_to new_meal_path
    end
  end

  def new
    @meal = Meal.new
  end

  def edit
    @meal = Meal.find(params[:id])
  end

  def update
    @meal = Meal.find(params[:id])
    @meal.update(meal_params)
    if @meal.valid?
      redirect_to meal_path(@meal)
    else
      flash[:notice] = @meal.errors.full_messages
      redirect_to edit_meal_path
    end
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.delete
    flash[:notice] = "You successfully deleted this meal"
    redirect_to cook_path
  end



  private

  def meal_params
    params.require(:meal).permit(:name, :description, :category, :expiration, :img_url, :cook_id)
  end

end
