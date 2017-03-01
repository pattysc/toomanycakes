class MealsController < ApplicationController
  before_action :authorize_user


  def show
    @user = current_user
    @meal = Meal.find(params[:id])
    @cook = @meal.get_cook
    # if meals.groups and current_user.groups have overlapping elements
    # and the current_user is not the eater or cook
    if (@meal.groups & current_user.groups).empty? && !(@meal.eater_ids.include? current_user.id) && (@meal.cook_id != current_user.id)
      redirect_to root_path
    end
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.cook_id = current_user.id
    @meal.group_ids = params[:meal][:group_ids].compact

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
    redirect_to meal_path(@meal) unless @meal.cook_id == current_user.id
  end

  def update
    @meal = Meal.find(params[:id])
    @meal.update(meal_params)
    if @meal.valid?
      @meal.group_ids = params[:meal][:group_ids].compact
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
    params.require(:meal).permit(:name, :description, :category, :expiration, :img_url, :cook_id, :group_ids)
  end

end
