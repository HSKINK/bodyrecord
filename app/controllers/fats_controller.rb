class FatsController < ApplicationController

  def index
    @fats = Fat.all
  end

  def new
    @fat_body = FatBody.new
  end

  def create
    @fat_body = FatBody.new(fat_params)
    if @fat_body.valid?
      binding.pry
      @fat_body.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def fat_params
    params.require(:fat_body).permit(:weight, :body_fat, :sex_id, :age, :height, :nutrients_p, :nutrients_f, :nutrients_c, :goal_body_fat, :goal_day).merge(user_id: current_user.id)
  end
end
