class BodiesController < ApplicationController
  def edit
    binding.pry
    @body = Body.find(params[:id])
  end
end
