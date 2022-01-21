class FatsController < ApplicationController
  def index
    @fats = current_user.fats.order('day DESC')
    @bodies = Body.all

    weights = current_user.fats.group_by_day(:day, series: false).sum(:weight)
    body_fats = current_user.fats.group_by_day(:day, series: false).sum(:body_fat)
    @chart = [
      { name: '体重', data: weights },
      { name: '体脂肪', data: body_fats }
    ]
  end

  def new
    @fat_body = FatBody.new
  end

  def create
    @fat_body = FatBody.new(fatbody_params)
    if @fat_body.valid?
      @fat_body.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    fat = Fat.find(params[:id])
    fat.destroy
    redirect_to root_path
  end

  def edit
    @fat_body = Body.find_by(fat_id: params[:id])
  end

  def update
    @fat_body = FatBody.new(body_params)
    if @fat_body.valid?
      @fat_body.save
      fat = Fat.find(params[:id])
      fat.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    redirect_to fats_path if user_signed_in?
  end

  private

  def fatbody_params
    params.require(:fat_body).permit(:gender_id, :age, :height, :nutrients_p, :nutrients_f, :nutrients_c, :goal_body_fat,
                                     :fat_id, :weight, :body_fat, :day).merge(user_id: current_user.id)
  end

  def body_params
    params.require(:body).permit(:gender_id, :age, :height, :nutrients_p, :nutrients_f, :nutrients_c, :goal_body_fat,
                                 :fat_id, :weight, :body_fat, :day).merge(user_id: current_user.id)
  end
end
