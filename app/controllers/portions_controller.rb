class PortionsController < ApplicationController

  def update
    # portions should be given eater ids
    @meal = Meal.find(params[:meal_id])
    set_eater_id(@meal, params[:number])
    @meal.save
    flash[:notice] = "You claimed #{params[:number]} portion(s) of #{@meal.name}"
    redirect_to meal_path(@meal)
  end

  def set_eater_id(meal, num)
    num.to_i.times do
      portion = meal.portions.where(eater_id: nil).first
      portion.eater_id = current_user.id
      portion.save
    end
  end

  def return
    @meal = Meal.find(params["meal_id"])
    @user = User.find(params[:id])
    @meal.return_portions(params["number_returns"], @user.id)
    flash[:notice] = "You returned #{params["number_returns"]} portion(s) of #{@meal.name}"
    redirect_to claimed_meals_path(@user)
  end

  private

  def portion_params
    params.require(:portion).permit(:user_id, :meal_id)
  end

end
