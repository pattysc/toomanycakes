class PortionsController < ApplicationController

  def update
    # portions should be given eater ids
    @meal = Meal.find(params[:meal_id])
    delete_a_portion(@meal, params[:number])
    @meal.save
    flash[:notice] = "You claimed #{params[:number]} portion(s) of #{@meal.name}"
    redirect_to meal_path(@meal)
  end

  def delete_a_portion(meal, num)
    num.to_i.times do
      meal.portions.first.destroy
    end
  end

  def set_eater_id(meal, num)
    num.to_i.times do
      portion = meal.portions.where('eater_id = ?', nil).first
      portion.eater_id = session[:user_id]
      portion.save
    end
  end

  private

  def portion_params
    params.require(:portion).permit(:user_id, :meal_id)
  end
end