class FatsController < ApplicationController
  def index
    @fats = Fat.order('day DESC')
    @bodies = Body.all

    weights = Fat.group_by_day(:day, series: false).sum(:weight)
    body_fats = Fat.group_by_day(:day, series: false).sum(:body_fat)
    @chart = [
      { name: '体重', data: weights },
      { name: '体脂肪', data: body_fats }
    ]
  end

  def new
    @body_nutrient_fat = BodyNutrientFat.new
  end

  def create
    @body_nutrient_fat = BodyNutrientFat.new(bodynutrientfat_params)
    if @body_nutrient_fat.valid?
      @body_nutrient_fat.save
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
    @body_nutrient_fat = Body.find_by(fat_id: params[:id])
  end

  def update
    @body_nutrient_fat = BodyNutrientFat.new(body_params)
    if @body_nutrient_fat.valid?
      @body_nutrient_fat.save
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

  def bodynutrientfat_params
    params.require(:body_nutrient_fat).permit(:gender_id, :age, :tall, :protein, :fat, :carbohydrate, :goal_body_fat, :body_id, :day, :weight, :body_fat, :nutrient_id).merge(user_id: current_user.id)
  end

  def body_params
    params.require(:body).permit(:gender_id, :age, :height, :nutrients_p, :nutrients_f, :nutrients_c, :goal_body_fat,
                                 :fat_id, :weight, :body_fat, :day).merge(user_id: current_user.id)
  end
end
