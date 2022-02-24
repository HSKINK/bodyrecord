class NutrientsController < ApplicationController
  def edit
    binding.pry
    @nutrient = Nutrient.find(params[:id])
  end
end
