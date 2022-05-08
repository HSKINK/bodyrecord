require 'rails_helper'

RSpec.describe BodyNutrientFat, type: :model do
binding.pry
  describe '身体情報新規登録' do
    before do
      user = FactoryBot.create(:user)
      @body_nutrient_fat = FactoryBot.build(:body_nutrient_fat, user_id: user.id)
      sleep(1)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@body_nutrient_fat).to be_valid
      end
    end
  end
end
