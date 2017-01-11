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
      portion.eater_id = User.all.first.id #[:user_id]
      portion.save
    end
  end

  private

  def portion_params
    params.require(:portion).permit(:user_id, :meal_id)
  end

end
