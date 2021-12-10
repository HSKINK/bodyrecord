class FatsController < ApplicationController

  def index
    @fats = Fat.all
  end

  def new
    @fat = Fat.new
  end

  def create
    Fat.create(fat_params)
  end

  private
  def fat_params
    params.require(:fat).permit(:weight, :body_fat)
  end

end
