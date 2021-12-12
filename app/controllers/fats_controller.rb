class FatsController < ApplicationController

  def index
    @fats = Fat.all.order('id DESC')

      # 合計するデータが用意できなかったので 無意味に id を合計してます
      weights = Fat.group_by_day(:day).sum(:weight)
      body_fats = Fat.group_by_day(:day).sum(:body_fat)
      @chart = [
        { name: "体重", data: weights },
        { name: "体脂肪", data: body_fats },
      ]

  end

  def new
    @fat_body = FatBody.new
  end

  def create
    @fat_body = FatBody.new(fat_params)
    if @fat_body.valid?
      @fat_body.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def fat_params
    params.require(:fat_body).permit(:weight, :body_fat, :day, :sex_id, :age, :height, :nutrients_p, :nutrients_f, :nutrients_c, :goal_body_fat, :goal_day).merge(user_id: current_user.id)
  end
end
