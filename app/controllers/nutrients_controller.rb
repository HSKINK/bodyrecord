class NutrientsController < ApplicationController
  def edit
    @nutrient = Nutrient.find(params[:id])
  end

  def update
    nutrient = Nutrient.find(params[:id])
    nutrient.update(nutrient_params)
    redirect_to root_path
  end

  private

  def nutrient_params
    params.require(:nutrient).permit(:n_protein,:n_fat, :n_carbohydrate).merge(body_id: current_user.body.id)
  end
end
