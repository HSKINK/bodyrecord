class BodiesController < ApplicationController
  def edit
    @body = Body.find(params[:id])
  end

  def update
    body = Body.find(params[:id])
    body.update(body_params)
    redirect_to root_path
  end

  private

  def body_params
    params.require(:body).permit(:gender_id,:age, :tall).merge(body_id: current_user.id)
  end
end
