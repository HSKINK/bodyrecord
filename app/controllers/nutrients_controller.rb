class NutrientsController < ApplicationController
  def edit
    binding.pry
    @nutrient = Nutrient.find(params[:id])
  end

  def update
    nutrient = Nutrient.find(params[:id])
    nutrient.update(nutrient_params)
    redirect_to root_path
  end

  private

  def nutrient_params
    params.require(:fat).permit(:day,:weight, :body_fat).merge(nutrient_id: current_user.body.nutrient.id)
  end
end
