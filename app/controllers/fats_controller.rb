class FatsController < ApplicationController
  def index
    @fats = Fat.order('day DESC')

    weights = Fat.group_by_day(:day, series: false).sum(:weight)
    body_fats = Fat.group_by_day(:day, series: false).sum(:body_fat)
    @chart = [
      { name: '体重', data: weights },
      { name: '体脂肪', data: body_fats }
    ]
  end

  def new
    if Fat.count == 1
      @body_nutrient_fat = BodyNutrientFat.new
    else
      @fat = Fat.new
    end
  end

  def create
    if Fat.count == 1
      @body_nutrient_fat = BodyNutrientFat.new(bodynutrientfat_params)
      if @body_nutrient_fat.valid?
        @body_nutrient_fat.save
        redirect_to root_path
      else
        render :new
      end
    else
      @fat = Fat.new(fat_params)
      if @fat.save
        redirect_to root_path
      else
        render :new
      end
    end
  end

  def destroy
    fat = Fat.find(params[:id])
    fat.destroy
    redirect_to root_path
  end

  def edit
    @fat = Fat.find(params[:id])
  end

  def update
    fat = Fat.find(params[:id])
    fat.update(fat_params)
    redirect_to root_path
  end

  def show
    redirect_to fats_path if user_signed_in?
  end

  private

  def bodynutrientfat_params
    params.require(:body_nutrient_fat).permit(:gender_id, :age, :tall, :n_protein, :n_fat, :n_carbohydrate, :goal_body_fat,
                                              :body_id, :day, :weight, :body_fat, :nutrient_id).merge(user_id: current_user.id)
  end

  def fat_params
    params.require(:fat).permit(:day,:weight, :body_fat).merge(nutrient_id: current_user.body.nutrient.id)
  end
end
