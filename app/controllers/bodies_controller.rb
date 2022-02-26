class BodiesController < ApplicationController
  def edit
    binding.pry
    @body = Body.find(params[:id])
  end

  def update
    body = Body.find(params[:id])
    body.update(body_params)
    redirect_to root_path
  end

  private

  def body_params
    params.require(:fat).permit(:day,:weight, :body_fat).merge(nutrient_id: current_user.body.nutrient.id)
  end
end
